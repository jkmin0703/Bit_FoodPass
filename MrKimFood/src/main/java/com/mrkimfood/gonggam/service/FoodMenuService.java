package com.mrkimfood.gonggam.service;

import java.util.List;
import java.util.Map;

import com.mrkimfood.gonggam.vo.FoodClassifyVO;
import com.mrkimfood.gonggam.vo.FoodMenuImageVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;

public interface FoodMenuService {
	//음식메뉴
	public void registerMenu(FoodMenuVO foodMenuVO);
	public void registerMenu(FoodMenuVO foodMenuVO, String imageSavePath);
	public List<FoodMenuVO> foodMenuList(Map<String, Object> inputMap);
	public FoodMenuVO foodMenuInfo(Integer foodNo);
	public void modifyFoodMenu(FoodMenuVO foodMenuVO, Character hasImageType, String imageSavePath);
	public void deleteFoodMenu(Integer foodNo);
	
	//음식 이미지
	public List<FoodMenuImageVO> foodImageList(Integer foodNo);
	public Integer foodMenuImgCount(Integer foodMenuFoodId);
	
	/*음식 메뉴 카테고리*/
	public Integer addFoodClassify(String foodClassifyName, int restaurantId);
	public List<FoodClassifyVO> getFoodClassifyList(int restaurantId);
	public FoodClassifyVO getFoodClassifyOne(int restaurantId, int foodClassifyId);
	public Integer getFoodId(String foodClassifyName, int restaurantId);
	public String getFoodName(int foodClassifyId, int restaurantId);
	public String removeFoodClassifyOne(int foodClassifyId, int restaurantId);
	public Integer changeFoodClassifyIdToNull(int foodClassifyId, int restaurantId);
	public void setFoodClassifyId(List<Integer> listClassifyId, int foodClassifyId, int restaurantId);
	public List<FoodMenuVO> getFoodMenuListForClassify(int restaurantId, int foodClassifyId);
	public List<FoodClassifyVO> menuCatagoryBarList(Integer shopNo);
	public Integer deleteFoodMenuCatagory(Integer catagoryNo);
	public FoodMenuImageVO selectFoodImage(Integer foodNo);
	public Integer getFoodMenuCount(Integer shopNo);
	
	
	
}
