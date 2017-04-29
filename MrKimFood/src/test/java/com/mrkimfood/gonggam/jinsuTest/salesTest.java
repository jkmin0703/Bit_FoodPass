package com.mrkimfood.gonggam.jinsuTest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.dao.OrderMenuDAO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.MakeTableInfoVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;
import com.mrkimfood.gonggam.vo.TableVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class salesTest extends MyBatisSupport {
	
/*	
 	@Test
	public void testMethod(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
*/
	@Test
	public void selectToday(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
				System.out.println(sqlSession.selectOne("toDay"));
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectOrderListToday(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
				
				List<Integer> orderNoList =  sqlSession.selectList("selectOrderNoListToday", 9);
				System.out.println(orderNoList.toString());
				
				for(Integer orderNo : orderNoList){
					System.out.println(orderNo);
				}
				
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectOrderMenuListToday(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			List<Integer> orderNoList = new ArrayList<Integer>();
			orderNoList.add(162);
			orderNoList.add(161);
			orderNoList.add(163);
			orderNoList.add(164);
			
			List<OrderMenuVO> orderMenuList = sqlSession.selectList("selectOrderMenuListToday", orderNoList);
			for(OrderMenuVO orderMenu :orderMenuList){
				System.out.println(orderMenu.getOrderId()+" / "+orderMenu.getFoodId()+" / "+orderMenu.getCount());
			}
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectShopFoodMenuList(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			List<FoodMenuVO> foodMenuList = sqlSession.selectList("selectShopFoodMenuList", 9);
			for(FoodMenuVO foodMenu: foodMenuList){
				System.out.println(foodMenu.getFood_ID()+"/"+foodMenu.getRestaurant_ID()+"/"+
						foodMenu.getFood_type()+"/"+foodMenu.getFood_name()+"/"+foodMenu.getPay());
				System.out.println("foodType= Null?: "+(foodMenu.getFood_type()==null));
			}
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
}
