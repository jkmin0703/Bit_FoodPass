package com.mrkimfood.gonggam.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mrkimfood.gonggam.vo.RestaurantVO;

public interface RestaurantDAO {
	
	//음식점
	public void insert(RestaurantVO restaurantVO);
	public List<RestaurantVO> selectList(Map<String, Object> inputMap);
	public List<RestaurantVO> selectBarList(Integer memberNo);
	public Integer getTotalShopCount(Map<String, Object> inputMap);
	public RestaurantVO select(Integer shopNo);
	public void update(RestaurantVO restaurantVO);
	public void updateToDropShop(Integer shopNo);
	public String selectRestaurantName(Integer shopNo);
	public Integer selectMaxShopNo(Integer memberNo);
		
}