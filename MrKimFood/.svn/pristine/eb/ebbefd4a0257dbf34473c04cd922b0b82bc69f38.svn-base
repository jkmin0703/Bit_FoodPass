package com.mrkimfood.gonggam.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.RestaurantVO;

@Repository
public class RestaurantDAOImpl implements RestaurantDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	//음식점
	@Override
	public void insert(RestaurantVO restaurantVO) {
		sqlSession.insert("restaurantInsert", restaurantVO);
		System.out.println("ID값:"+restaurantVO.getRestaurant_ID());
	}

	@Override
	public List<RestaurantVO> selectList(Map<String, Object> inputMap) {
		return sqlSession.selectList("selectShopList", inputMap);
	}
	
	@Override
	public List<RestaurantVO> selectBarList(Integer memberNo){
		return sqlSession.selectList("selectBarList", memberNo);
	}
	
	@Override
	public Integer getTotalShopCount(Map<String, Object> inputMap){
		return sqlSession.selectOne("getTotalShopCount", inputMap);
	}
	
	@Override
	public RestaurantVO select(Integer shopNo) {
		return sqlSession.selectOne("selectShopInfo", shopNo);
	}

	@Override
	public void update(RestaurantVO restaurantVO) {
		sqlSession.update("restaurantUpdate", restaurantVO);
		
	}

	@Override
	public void updateToDropShop(Integer shopNo) {
		sqlSession.update("updateDropShop", shopNo);
	}

	@Override
	public String selectRestaurantName(Integer shopNo) {
		return sqlSession.selectOne("selectRestaurantName", shopNo);
	}
	
	@Override
	public Integer selectMaxShopNo(Integer memberNo){
		return sqlSession.selectOne("maxShopNo", memberNo);
	}
}
