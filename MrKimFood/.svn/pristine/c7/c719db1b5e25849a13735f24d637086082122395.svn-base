package com.mrkimfood.gonggam.dao;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.FoodMenuImageVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
@Repository
public class FoodMenuDAOImpl implements FoodMenuDAO {
	
	@Inject
	private SqlSession sqlSession;
	
		//음식 메뉴
		@Override
		public Integer createFoodMenuPK(){
			return sqlSession.selectOne("createPK_FoodMenu");
		}
		
		@Override
		public void insert(FoodMenuVO foodMenuVO) {
			sqlSession.insert("insertFoodMenu", foodMenuVO);
		}
		
		@Override
		public List<FoodMenuVO> selectList(Map<String, Object> inputMap){
			
			return sqlSession.selectList("selectFoodList", inputMap);
		}
		
		@Override
		public FoodMenuVO select(Integer foodNo){
			return sqlSession.selectOne("selectFoodMenu", foodNo);
		}
		
		@Override
		public int update(FoodMenuVO foodMenuVO){
			return sqlSession.update("updateFoodMenu", foodMenuVO);
		}
		@Override
		public int updateToDeleteMenu(Integer foodNo){
			return sqlSession.update("updateToDropFood",foodNo);
		}
		
		//음식메뉴 이미지
		@Override
		public Integer createSaveImgNum(){
			return sqlSession.selectOne("create_saveImgNum");
		}
		
		@Override
		public void insert(FoodMenuImageVO foodMenuImageVO) {
			sqlSession.insert("insertFoodMenuImage", foodMenuImageVO);
		}
		
		@Override
		public List<FoodMenuImageVO> selectListFoodImage(Integer foodNo){
			return sqlSession.selectList("selectMenuImageList", foodNo);
		}
		
		@Override
		public int deleteFoodImage(Integer foodNo){
			return sqlSession.delete("deleteFoodImage", foodNo);
		}

		@Override
		public Integer updateFoodClassifyIdNull(Integer foodClassifyId,	Integer restaurantId) {
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyId", foodClassifyId);
			params.put("restaurantId", restaurantId);
			
			return sqlSession.update("updateFoodClassifyIdNull", params);
		}

		@Override
		public Integer updateFoodClassifyId(Integer foodClassifyId,
				Integer restaurantId, Integer foodId) {

			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyId", foodClassifyId);
			params.put("restaurantId", restaurantId);
			params.put("foodId", foodId);
			
			return sqlSession.update("updateFoodClassifyId", params);			
		}

		@Override
		public List<FoodMenuVO> selectFoodMenuListForClassify(
				Integer restaurantId, Integer foodId) {
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("restaurantId", restaurantId);
			params.put("foodId", foodId);	
			
			return sqlSession.selectList("selectFoodMenuListForClassify", params);
		}

		@Override
		public Integer foodMenuImgCount(Integer foodMenuFoodId) {
			return sqlSession.selectOne("foodmenuImgCount", foodMenuFoodId);
		}
		
		@Override
		public FoodMenuImageVO selectFoodImage(Integer foodNo){
			return sqlSession.selectOne("selectMenuImageList", foodNo);
		}

		@Override
		public Integer getFoodMenuCount(Integer shopNo) {
			return sqlSession.selectOne("selectMenuCount", shopNo);
		}
}
















