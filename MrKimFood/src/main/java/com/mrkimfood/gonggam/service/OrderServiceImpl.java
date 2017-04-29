package com.mrkimfood.gonggam.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mrkimfood.gonggam.dao.OrderMenuDAO;
import com.mrkimfood.gonggam.dao.OrderMgDAO;
import com.mrkimfood.gonggam.vo.OrderManageVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderMgDAO orderMgDAO;

	@Inject
	private OrderMenuDAO orderMenuDAO;

	@Override
	public int creationOrderId(OrderManageVO orderManageVO) {
		return orderMgDAO.insert(orderManageVO);
	}

	@Override
	public int addMenu(OrderMenuVO orderMenuVO) {
		return orderMenuDAO.insert(orderMenuVO);
	}

	@Override
	public int updateOrderMg(OrderManageVO orderManageVO) {
		return orderMgDAO.update(orderManageVO);
	}

	@Override
	public int updateOrderMenu(OrderMenuVO orderMenuVO) {
		return orderMenuDAO.update(orderMenuVO);
	}

	@Override
	public OrderManageVO selectManage(int orderId) {
		return orderMgDAO.select(orderId);
	}

	@Override
	public List<OrderManageVO> selectAllManage(Integer restaurantId) {
		return orderMgDAO.selectList(restaurantId);
	}

	@Override
	public List<OrderMenuVO> selectIdAllMenu(int orderId) {
		return orderMenuDAO.selectList(orderId);
	}

	@Override
	public int updateFoodSupplyStatus(Integer orderId, Integer num,	String isSupply) {
		return orderMenuDAO.updateOrderIsSupply(orderId, num, isSupply);
	}

}
