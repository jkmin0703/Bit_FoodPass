package com.mrkimfood.gonggam.hswtest;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.vo.FoodClassifyVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class FoodClassifyTest extends MyBatisSupport {
	
	@Test
	public void insertFoodClassifyTest() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			String foodName = "커피와 음료";
			Integer restId = 9;
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyName", foodName);
			params.put("restaurantId", restId);
			
			Integer id = null;
			id = sqlSession.selectOne("selectFoodId", params);
			
			System.out.println("음식분류 Id = " + id);
			
			String use = null;
			
			if (id != null) {			
				Map<String, Object> params2 = new Hashtable<String, Object>();
				params2.put("restaurantId", restId);
				params2.put("foodClassifyId", id);
				use = sqlSession.selectOne("selectUse", params2);
				System.out.println("use = " + use);
			}
			
			if (id == null) {
				FoodClassifyVO foodClassifyVO = new FoodClassifyVO();
				foodClassifyVO.setFoodClassifyName((String)params.get("foodClassifyName"));
				foodClassifyVO.setRestaurantId((Integer)params.get("restaurantId"));
				sqlSession.insert("inFoodClassify", foodClassifyVO);
				System.out.println("aaa");
			} else if (id != null && use.equals("x")) {
				Map<String, Object> params3 = new Hashtable<String, Object>();
				params3.put("isUse", "o");
				params3.put("restaurantId", restId);
				params3.put("foodClassifyId", id);				
				sqlSession.update("updateUse", params3);
				System.out.println("bbb");
			}
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void selectFoodClassifyListTest() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			List<FoodClassifyVO> foodClassifyVOs = null;
			foodClassifyVOs = sqlSession.selectList("selectFoodClassifyList", 9);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectFoodClassifyOneTest() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("restaurantId", 9);
			params.put("foodClassifyId", 3);
			
			FoodClassifyVO foodClassifyVO = sqlSession.selectOne("selectFoodClassifyOne", params);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectFoodNameTest() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyId", 3);
			params.put("restaurantId", 9);
			
			String strName = sqlSession.selectOne("selectFoodName", params);
			System.out.println("strName = " + strName);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void deleteFoodClassifyTest() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyId", 7);
			params.put("restaurantId", 9);
			sqlSession.delete("deleteFoodClassify", params);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void updateFoodClassifyIdNull() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyId", 4);
			params.put("restaurantId", 9);
			sqlSession.update("updateFoodClassifyIdNull", params);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void updateFoodClassifyId() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyId", 10);
			params.put("restaurantId", 9);
			params.put("foodId", 8);
			sqlSession.update("updateFoodClassifyId", params);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectFoodMenuListForClassify() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("restaurantId", 9);
			params.put("foodId", 11);
			List<FoodMenuVO> foodMenuVOs = sqlSession.selectList("selectFoodMenuListForClassify", params);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
}













