package com.mrkimfood.gonggam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mrkimfood.gonggam.dao.RestaurantDAO;
import com.mrkimfood.gonggam.vo.RestaurantVO;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	@Inject
	private RestaurantDAO dao;
	
	@Override
	public void registerShop(RestaurantVO restaurantVO) {
		dao.insert(restaurantVO);
	}

	@Override
	public List<RestaurantVO> shopList(Map<String, Object> inputMap) {
		return dao.selectList(inputMap);
	}
	
	@Override
	public List<RestaurantVO> selectBarList(Integer memberNo) {
		return dao.selectBarList(memberNo);
	}
	
	@Override
	public Integer getTotalShopCount(Map<String, Object> inputMap){
		return dao.getTotalShopCount(inputMap);
	}
	
	@Override
	public RestaurantVO shopInfo(Integer shopNo) {
		return dao.select(shopNo);
	}

	@Override
	public void modifyShop(RestaurantVO restaurantVO) {
		dao.update(restaurantVO);
		
	}

	@Override
	public void dropShop(Integer shopNo) {
		dao.updateToDropShop(shopNo);
	}

	@Override
	public String inquiryRestaurantName(Integer shopNo) {
		return dao.selectRestaurantName(shopNo);
	}
	
	@Override
	public Integer selectMaxShop(Integer memberNo){
		return dao.selectMaxShopNo(memberNo);
	}
}
