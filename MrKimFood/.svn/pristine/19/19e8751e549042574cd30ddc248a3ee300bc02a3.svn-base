package com.mrkimfood.gonggam.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.OrderManageVO;

@Repository
public class OrderMgDAOImpl implements OrderMgDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insert(OrderManageVO orderManageVO) {
		return sqlSession.insert("inOrderMg", orderManageVO);
	}

	@Override
	public OrderManageVO select(Integer orderId) {
		return sqlSession.selectOne("selectOrderMg", orderId);
	}

	@Override
	public int update(OrderManageVO orderManageVO) {
		return sqlSession.update("updateOrderMg", orderManageVO);
	}

	@Override
	public List<OrderManageVO> selectList(Integer restaurantId) {
		return sqlSession.selectList("selectOrderMgList", restaurantId);
	}

}
