package com.mrkimfood.gonggam.hswtest;

import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.dao.FoodClassifyDao;
import com.mrkimfood.gonggam.dao.FoodMenuDAO;
import com.mrkimfood.gonggam.vo.FoodClassifyVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class FoodClassifyServiceTest extends MyBatisSupport {
	
	@Inject FoodClassifyDao foodClassifyDao;
	
	@Inject FoodMenuDAO foodMenuDAO;
	
	@Test
	public void insertFoodClassifyTest() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			String foodClassifyName = "디저트";
			Integer restaurantId = 9;
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("foodClassifyName", foodClassifyName);
			params.put("restaurantId", restaurantId);
			
			Integer getFoodClassifyId = null;
			getFoodClassifyId = foodClassifyDao.selectFoodId(foodClassifyName, restaurantId);
			
			System.out.println("음식분류 Id = " + getFoodClassifyId);
			
//			String isUseFoodClassify = null;
			
			/*if (getFoodClassifyId != null) {
				isUseFoodClassify = foodClassifyDao.selectUse(restaurantId, getFoodClassifyId);
				System.out.println("isUseFoodClassify = " + isUseFoodClassify);
			}*/
			
			if (getFoodClassifyId == null) {
				FoodClassifyVO foodClassifyVO = new FoodClassifyVO();
				foodClassifyVO.setFoodClassifyName(foodClassifyName);
				foodClassifyVO.setRestaurantId(restaurantId);
				foodClassifyDao.InsertFoodClassify(foodClassifyName, restaurantId);
				System.out.println("aaa");
			} /*else if (getFoodClassifyId != null && isUseFoodClassify.equals("x")) {
				foodClassifyDao.updateUse("o", restaurantId, getFoodClassifyId);
				System.out.println("bbb");
			}*/
			
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
			
			List<FoodClassifyVO> foodClassifyVOs = foodClassifyDao.selectFoodClassifyList(9);
			
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
			
			FoodClassifyVO foodClassifyVO = foodClassifyDao.selectFoodClassifyOne(9, 3);
			
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
						
			String strName = foodClassifyDao.selectFoodName(3, 9);
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
			
			String foodClassifyName = foodClassifyDao.selectFoodName(10, 9);
			System.out.println("foodClassifyName = " + foodClassifyName);
			if (foodClassifyName == null) {
				return;
			}
			
			Integer changeNull = foodMenuDAO.updateFoodClassifyIdNull(10, 9);
			System.out.println("changeNull = " + changeNull);
			
			Integer checkDelete = foodClassifyDao.deleteFoodClassify(10, 9);
			System.out.println("checkDelete = " + checkDelete);
			
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
			
			Integer in = foodMenuDAO.updateFoodClassifyIdNull(4, 9);
			System.out.println(in);
			
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
			
			List<Integer> listClassifyId = new ArrayList<Integer>();
			listClassifyId.add(7);
			listClassifyId.add(8);
			listClassifyId.add(9);
			listClassifyId.add(10);
			
			for (int i = 0; i < listClassifyId.size(); i++) {
				foodMenuDAO.updateFoodClassifyId(11, 9, listClassifyId.get(i));
			}
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void getFoodMenuListForClassify() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			List<FoodMenuVO> foodMenuVOs = foodMenuDAO.selectFoodMenuListForClassify(9, 11);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
}














