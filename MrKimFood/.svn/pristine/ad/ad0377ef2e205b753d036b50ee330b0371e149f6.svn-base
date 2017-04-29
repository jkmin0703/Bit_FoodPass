package com.mrkimfood.gonggam.dao;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.OrderMenuVO;

@Repository
public class OrderMenuDAOImpl implements OrderMenuDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insert(OrderMenuVO orderMenuVO) {
		return sqlSession.insert("inOrderMenu", orderMenuVO);
	}

	@Override
	public List<OrderMenuVO> selectList(Integer orderId) {
		return sqlSession.selectList("selectOrderMenuList", orderId);
	}

	@Override
	public int update(OrderMenuVO orderMenuVO) {
		return sqlSession.update("updateOrderMenu", orderMenuVO);
	}

	@Override
	public int updateOrderIsSupply(Integer orderId, Integer num, String isSupply) {
		Map<String, Object> params = new Hashtable<String, Object>();
		params.put("orderId", orderId);
		params.put("num", num);
		params.put("isSupply", isSupply);
		
		return sqlSession.update("updateOrderIsSupply", params);
	}

}
