package com.mrkimfood.gonggam.dao;

import java.util.List;
import java.util.Map;

import com.mrkimfood.gonggam.vo.FoodMenuImageVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;

public interface FoodMenuDAO {
	//음식메뉴
		public Integer createFoodMenuPK();
		public Integer createSaveImgNum();
		public void insert(FoodMenuVO foodMenuVO);
		public void insert(FoodMenuImageVO foodMenuImageVO);
		public List<FoodMenuVO> selectList(Map<String, Object> inputMap);
		public FoodMenuVO select(Integer foodNo);
		public List<FoodMenuImageVO> selectListFoodImage(Integer foodNo);
		public int update(FoodMenuVO foodMenuVO);
		public int deleteFoodImage(Integer foodNo);
		public int updateToDeleteMenu(Integer foodNo);
		
		public Integer updateFoodClassifyIdNull(Integer foodClassifyId, Integer restaurantId);
		
		public Integer updateFoodClassifyId(Integer foodClassifyId, Integer restaurantId, Integer foodId);
		
		public List<FoodMenuVO> selectFoodMenuListForClassify(Integer restaurantId, Integer foodId);
		public Integer foodMenuImgCount(Integer foodMenuFoodId);
		
		FoodMenuImageVO selectFoodImage(Integer foodNo);
		public Integer getFoodMenuCount(Integer shopNo);
		
}
