package com.mrkimfood.gonggam.dao;

import java.util.List;

import com.mrkimfood.gonggam.vo.OrderMenuVO;

public interface OrderMenuDAO {
	
	int insert(OrderMenuVO orderMenuVO);
	
	List<OrderMenuVO> selectList(Integer orderId);
	
	int update(OrderMenuVO orderMenuVO);
	
	int updateOrderIsSupply(Integer orderId, Integer num, String isSupply);
}
