package com.mrkimfood.gonggam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mrkimfood.gonggam.vo.RestaurantVO;

public interface RestaurantService {
	public void registerShop(RestaurantVO restaurantVO); 
	public List<RestaurantVO> shopList(Map<String, Object> inputMap);
	public List<RestaurantVO> selectBarList(Integer memberNo);
	public Integer getTotalShopCount(Map<String, Object> inputMap);
	public RestaurantVO shopInfo(Integer shopNo);
	public void modifyShop(RestaurantVO restaurantVO);
	public void dropShop(Integer shopNo);
	public String inquiryRestaurantName(Integer shopNo);
	public Integer selectMaxShop(Integer memberNo);

}
