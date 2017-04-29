package com.mrkimfood.gonggam.dao;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.FoodClassifyVO;

@Repository
public class FoodClassifyDaoImpl implements FoodClassifyDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public Integer InsertFoodClassify(String foodClassifyName, int restaurantId) {
		FoodClassifyVO foodClassifyVO = new FoodClassifyVO();
		foodClassifyVO.setFoodClassifyName(foodClassifyName);
		foodClassifyVO.setRestaurantId(restaurantId);
		return sqlSession.insert("inFoodClassify", foodClassifyVO);
	}

	@Override
	public List<FoodClassifyVO> selectFoodClassifyList(int restaurantId) {
		return sqlSession.selectList("selectFoodClassifyList", restaurantId);
	}

	@Override
	public FoodClassifyVO selectFoodClassifyOne(int restaurantId,
			int foodClassifyId) {
		Map<String, Object> params = new Hashtable<String, Object>();
		params.put("restaurantId", restaurantId);
		params.put("foodClassifyId", foodClassifyId);
		return sqlSession.selectOne("selectFoodClassifyOne", params);
	}

	@Override
	public Integer selectFoodId(String foodClassifyName, int restaurantId) {
		Map<String, Object> params = new Hashtable<String, Object>();
		params.put("foodClassifyName", foodClassifyName);
		params.put("restaurantId", restaurantId);
		return sqlSession.selectOne("selectFoodId", params);
	}

	@Override
	public String selectFoodName(int foodClassifyId, int restaurantId) {
		Map<String, Object> params = new Hashtable<String, Object>();
		params.put("foodClassifyId", foodClassifyId);
		params.put("restaurantId", restaurantId);
		return sqlSession.selectOne("selectFoodName", params);
	}

	@Override
	public Integer deleteFoodClassify(int foodClassifyId, int restaurantId) {
		
		Map<String, Object> params = new Hashtable<String, Object>();
		params.put("foodClassifyId", foodClassifyId);
		params.put("restaurantId", restaurantId);
		
		return sqlSession.delete("deleteFoodClassifyToMap", params);
	}
	
	@Override
	public Integer deleteFoodClassify(Integer catagoryNo){
		return sqlSession.delete("deleteFoodClassify", catagoryNo);
	}
	
}
