package com.mrkimfood.gonggam.jinsuTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.RestaurantVO;
import com.mrkimfood.gonggam.vo.TableVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class RestaurantTest extends MyBatisSupport {
	

	@Test
	public void selectShopList() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			Map<String, Object> inputMap = new HashMap<String, Object>();
			inputMap.put("page", 1);
			inputMap.put("pageColumnSize", 5);
			inputMap.put("memberId", 0);
			
			List<RestaurantVO> restVO= sqlSession.selectList("selectShopList", inputMap);
			for(RestaurantVO rVO:restVO){
				System.out.println(rVO.getRestaurant_name()+"  "+rVO.getAddress()+"  "+rVO.getOpeningTime()+"  "+rVO.getClosingTime());
			}
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}

	@Test
	public void selectShopInfo() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			

			RestaurantVO restVO= sqlSession.selectOne("selectShopInfo", 8);
				System.out.println(restVO.getRestaurant_name()+"  "+restVO.getAddress()+"  "+restVO.getOpeningTime()+"  "+restVO.getClosingTime());
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void updateShop(){
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			RestaurantVO restVO = new RestaurantVO();
			restVO.setRestaurant_ID(102);
			restVO.setMember_ID(0);
			restVO.setRes_phone("031-632-0081");
			restVO.setAddress("강남동ac32c");
			restVO.setRestaurant_name("강남물개");
			
			System.out.println("가계ID: "+restVO.getRestaurant_ID());
			System.out.println("회원ID: "+restVO.getMember_ID());
			System.out.println("가계이름: "+restVO.getRestaurant_name());
			System.out.println("가계주소: "+restVO.getAddress());
			System.out.println("가계타입: "+restVO.getRestaurant_type());
			System.out.println("오픈시간: "+restVO.getOpeningTime());
			System.out.println("종료시간: "+restVO.getClosingTime());
			System.out.println("전화번호: "+restVO.getRes_phone());
			
			sqlSession.update("restaurantUpdate", restVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void sideBar(){
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Integer memberNo = 0;
			List<RestaurantVO> shopList= sqlSession.selectList("selectBarList",memberNo);
			for(RestaurantVO shop : shopList){
				System.out.println(shop.getRestaurant_ID()+"/"+shop.getRestaurant_name()+"/"+shop.getAddress());
				
			}
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void maxShopNo(){
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Integer memberNo = 0;
			Integer maxShopNo= sqlSession.selectOne("maxShopNo",memberNo);
			System.out.println(maxShopNo);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	
	
}
