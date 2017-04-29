package com.mrkimfood.gonggam.service;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.dao.FoodClassifyDao;
import com.mrkimfood.gonggam.dao.FoodMenuDAO;
import com.mrkimfood.gonggam.vo.FoodClassifyVO;
import com.mrkimfood.gonggam.vo.FoodMenuImageVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;

@Service
public class FoodMenuServiceImpl extends MyBatisSupport implements FoodMenuService {
	
	private final static int SUCCESS = 0;
	private final static int EXISTENCE = 1;
	private final static int FAIL = 2;
	
	@Inject
	private FoodMenuDAO dao;
	
	@Inject FoodClassifyDao foodClassifyDao;
	
	@Override	//파일이 없는 음식메뉴
	public void registerMenu(FoodMenuVO foodMenuVO) {
		Integer foodId = dao.createFoodMenuPK();
		foodMenuVO.setFood_ID(foodId);
		dao.insert(foodMenuVO);
	}

	@Override	//파일이 있는 음식메뉴
	public void registerMenu(FoodMenuVO foodMenuVO, String imageSavePath) {
		
		// 음식메뉴 정보를 DB에 저장
		Integer food_ID = dao.createFoodMenuPK();
		foodMenuVO.setFood_ID(food_ID);
		dao.insert(foodMenuVO);
		
		//받아온 이미지에 대한 정보를 서버에 저장
		for(MultipartFile imageFile: foodMenuVO.getUploadFileImg()){
			if(!imageFile.isEmpty()){
				FoodMenuImageVO foodMenuImageVO = new FoodMenuImageVO();
				Long file_size = imageFile.getSize();
				String[] o_imageArr = imageFile.getOriginalFilename().split("\\.");
				String original_imageName = imageFile.getOriginalFilename();
				String save_imageName = "Img_"+dao.createSaveImgNum()+"."+o_imageArr[1];
				
				foodMenuImageVO.setOriginal_imageName(original_imageName);
				foodMenuImageVO.setSave_path(imageSavePath);
				foodMenuImageVO.setFile_size(file_size);
				foodMenuImageVO.setSave_imageName(save_imageName);
				foodMenuImageVO.setFood_ID(food_ID);
				dao.insert(foodMenuImageVO);
				System.out.println("DB에 파일 저장 완료");
				
				//이미지를 webapp/img/menu에 저장
				try {
					File saveFile = new File(imageSavePath,save_imageName);
					imageFile.transferTo(saveFile);
					System.out.println("서버에 파일저장 완료");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Override
	public List<FoodMenuVO> foodMenuList(Map<String, Object> inputMap){
		return dao.selectList(inputMap);
	}
	
	@Override
	public FoodMenuVO foodMenuInfo(Integer foodNo){
		return dao.select(foodNo);
	}
	
	@Override
	public List<FoodMenuImageVO> foodImageList(Integer foodNo){
		return dao.selectListFoodImage(foodNo);
	}
	
	@Override
	public void modifyFoodMenu(FoodMenuVO foodMenuVO, Character hasImageType, String imageSavePath){
		//서버에 해당 메뉴의 이미지 정보를 갖고 온다.(이미지가 있는지 없는지 판별)
		List<FoodMenuImageVO> foodImageList = dao.selectListFoodImage(foodMenuVO.getFood_ID());
		
		//메뉴정보 업데이트
		dao.update(foodMenuVO);
		
		//파일처리
		switch(hasImageType){
			case'n':	//	n일때 처리(아무것도 처리안함)
				break;
		
			case'm':{	//	m일때 처리(기존이미지 삭제, 받아온 이미지 입력)
				
				//기존 이미지가 있다면 삭제
				if(!foodImageList.isEmpty()){
					for(FoodMenuImageVO menuImageVO : foodImageList){
						File file = new File(menuImageVO.getSave_path(), menuImageVO.getSave_imageName());
						//파일을 삭제하고,
						boolean isfile= file.delete();
						//파일에 대한 DB 정보 삭제.
						int isImg = dao.deleteFoodImage(menuImageVO.getFood_image_ID());
					}
				}
				
				//받아온 이미지에 대한 정보를 서버에 저장
				for(MultipartFile imageFile: foodMenuVO.getUploadFileImg()){
					if(!imageFile.isEmpty()){
						//foodMenuImageVO 객체를 생성하여 필요한 정보를 찾아 저장
						FoodMenuImageVO foodMenuImageVO = new FoodMenuImageVO();
						Long file_size = imageFile.getSize();
						String[] o_imageArr = imageFile.getOriginalFilename().split("\\.");
						String original_imageName = imageFile.getOriginalFilename();
						String save_imageName = "Img_"+dao.createSaveImgNum()+"."+o_imageArr[1];
						
						foodMenuImageVO.setOriginal_imageName(original_imageName);
						foodMenuImageVO.setSave_path(imageSavePath);
						foodMenuImageVO.setFile_size(file_size);
						foodMenuImageVO.setSave_imageName(save_imageName);
						foodMenuImageVO.setFood_ID(foodMenuVO.getFood_ID());
						//이미지 정보를 DB에 저장한다.
						dao.insert(foodMenuImageVO);
						
						//이미지 데이터를 webapp/img/menu에 저장
						try {
							File saveFile = new File(imageSavePath,save_imageName);
							imageFile.transferTo(saveFile);
						} catch (IllegalStateException e) {
							e.printStackTrace();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}break;
			case'd':{	//	d일때 처리(기존 이미지 삭제)
				if(!foodImageList.isEmpty()){ //서버에 이미지가 있다면..(있다:false , 없다:true)
					for(FoodMenuImageVO menuImageVO : foodImageList){
						File file = new File(menuImageVO.getSave_path(), menuImageVO.getSave_imageName());
						//파일을 삭제하고,
						boolean isfile= file.delete();
						//파일에 대한 DB 정보 삭제.
						int isImg = dao.deleteFoodImage(menuImageVO.getFood_image_ID());
					}
				}
			}break;
		}
	}
	
	@Override
	public void deleteFoodMenu(Integer foodNo){
		List<FoodMenuImageVO> foodImageList = dao.selectListFoodImage(foodNo);
		if(!foodImageList.isEmpty()){ //서버에 이미지가 있다면..(있다:false , 없다:true)
			for(FoodMenuImageVO menuImageVO : foodImageList){
				File file = new File(menuImageVO.getSave_path(), menuImageVO.getSave_imageName());
				//파일을 삭제하고,
				boolean isfile= file.delete();
				//파일에 대한 DB 정보 삭제.
				int isImg = dao.deleteFoodImage(menuImageVO.getFood_image_ID());
			}
		}
		//메뉴를 삭제처리한다.
		dao.updateToDeleteMenu(foodNo);
	}

	@Override
	public Integer addFoodClassify(String foodClassifyName, int restaurantId) {
		
		Map<String, Object> params = new Hashtable<String, Object>();
		params.put("foodClassifyName", foodClassifyName);
		params.put("restaurantId", restaurantId);
		
		// 음식 분류 ID가 있는지 조회한다.
		Integer getFoodClassifyId = null;
		getFoodClassifyId = foodClassifyDao.selectFoodId(foodClassifyName, restaurantId);
		
		System.out.println("음식분류 Id = " + getFoodClassifyId);
		
		Integer isSuccess = null;
		if (getFoodClassifyId == null) {
			isSuccess = foodClassifyDao.InsertFoodClassify(foodClassifyName, restaurantId);
			System.out.println("DB삽입여부 = " + isSuccess);
		} else {
			return EXISTENCE;
		}
		
		if (isSuccess == 1) {
			return SUCCESS;
		}
		else {
			return FAIL;
		}
	}

	@Override
	public List<FoodClassifyVO> getFoodClassifyList(int restaurantId) {
		
		return foodClassifyDao.selectFoodClassifyList(restaurantId);
	}

	@Override
	public FoodClassifyVO getFoodClassifyOne(int restaurantId, int foodClassifyId) {
		
		return foodClassifyDao.selectFoodClassifyOne(restaurantId, foodClassifyId);
	}

	@Override
	public Integer getFoodId(String foodClassifyName, int restaurantId) {
		
		return foodClassifyDao.selectFoodId(foodClassifyName, restaurantId);
	}

	@Override
	public String getFoodName(int foodClassifyId, int restaurantId) {
		
		return foodClassifyDao.selectFoodName(foodClassifyId, restaurantId);
	}

	@Override
	public String removeFoodClassifyOne(int foodClassifyId, int restaurantId) {
		
		String foodClassifyName = null;
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			foodClassifyName = foodClassifyDao.selectFoodName(foodClassifyId, restaurantId);
			System.out.println("foodClassifyName = " + foodClassifyName);
			
			Integer changeNull = dao.updateFoodClassifyIdNull(foodClassifyId, restaurantId);
			System.out.println("changeNull = " + changeNull);
			
			Integer checkDelete = foodClassifyDao.deleteFoodClassify(foodClassifyId, restaurantId);
			System.out.println("checkDelete = " + checkDelete);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
		return foodClassifyName;
	}

	@Override
	public Integer changeFoodClassifyIdToNull(int foodClassifyId, int restaurantId) {
		return dao.updateFoodClassifyIdNull(foodClassifyId, restaurantId);
	}

	@Override
	public void setFoodClassifyId(List<Integer> listClassifyId,
			int foodId, int restaurantId) {
		
		for (int i = 0; i < listClassifyId.size(); i++) {
			dao.updateFoodClassifyId(foodId, restaurantId, listClassifyId.get(i));
		}
	}

	@Override
	public List<FoodMenuVO> getFoodMenuListForClassify(int restaurantId,
			int foodClassifyId) {
		return dao.selectFoodMenuListForClassify(restaurantId, foodClassifyId);
	}
	
	@Override
	public List<FoodClassifyVO> menuCatagoryBarList(Integer shopNo){
		return foodClassifyDao.selectFoodClassifyList(shopNo);
	}
	
	@Override
	public Integer deleteFoodMenuCatagory(Integer catagoryNo){
		return foodClassifyDao.deleteFoodClassify(catagoryNo);
	}
	
	@Override
	public Integer foodMenuImgCount(Integer foodMenuFoodId){
		
		return dao.foodMenuImgCount(foodMenuFoodId);
		
	}
	
	@Override
	public FoodMenuImageVO selectFoodImage(Integer foodNo){
		return dao.selectFoodImage(foodNo);
	}

	@Override
	public Integer getFoodMenuCount(Integer shopNo) {
		return dao.getFoodMenuCount(shopNo);
	}
}

















