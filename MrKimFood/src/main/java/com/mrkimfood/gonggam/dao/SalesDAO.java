package com.mrkimfood.gonggam.dao;

import java.util.List;

import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;

public interface SalesDAO {

	public List<Integer> selectOrderListToday(Integer shopNo);

	public List<OrderMenuVO> selectOrderMenuListToday(List<Integer> orderNoList);

	public List<FoodMenuVO> selectShopFoodMenuList(Integer shopNo);

	public String selectToday();

}
