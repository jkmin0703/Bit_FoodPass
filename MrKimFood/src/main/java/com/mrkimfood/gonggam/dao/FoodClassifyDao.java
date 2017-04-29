package com.mrkimfood.gonggam.dao;

import java.util.List;

import com.mrkimfood.gonggam.vo.FoodClassifyVO;

public interface FoodClassifyDao {
	
	public Integer InsertFoodClassify(String foodClassifyName, int restaurantId);
	
	public List<FoodClassifyVO> selectFoodClassifyList(int restaurantId);
	
	public FoodClassifyVO selectFoodClassifyOne(int restaurantId, int foodClassifyId);
	
	public Integer selectFoodId(String foodClassifyName, int restaurantId);
	
	public String selectFoodName(int foodClassifyId, int restaurantId);
	
	public Integer deleteFoodClassify(int foodClassifyId, int restaurantId);

	public Integer deleteFoodClassify(Integer catagoryNo);
	
}
