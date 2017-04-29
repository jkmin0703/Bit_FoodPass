package com.mrkimfood.gonggam.service;

import java.util.List;

import com.mrkimfood.gonggam.vo.OrderManageVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;

public interface OrderService {
	
	int creationOrderId(OrderManageVO orderManageVO);
	int addMenu(OrderMenuVO orderMenuVO);
	int updateOrderMg(OrderManageVO orderManageVO);
	int updateOrderMenu(OrderMenuVO orderMenuVO);
	OrderManageVO selectManage(int orderId);
	List<OrderManageVO> selectAllManage(Integer restaurantId);
	List<OrderMenuVO> selectIdAllMenu(int orderId);
	int updateFoodSupplyStatus(Integer orderId, Integer num, String isSupply);
	
}
