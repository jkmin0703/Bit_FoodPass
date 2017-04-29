package com.mrkimfood.gonggam.hswtest;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.service.FoodMenuService;
import com.mrkimfood.gonggam.service.OrderService;
import com.mrkimfood.gonggam.service.RestaurantService;
import com.mrkimfood.gonggam.service.TableService;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.OrderDetailVO;
import com.mrkimfood.gonggam.vo.OrderManageVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;
import com.mrkimfood.gonggam.vo.RestaurantVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class OrderServiceTest extends MyBatisSupport{
	
	@Inject OrderService orderService;
	
	@Inject FoodMenuService foodMenuService;
	
	@Inject TableService tableService;
	
	@Inject RestaurantService restaurantService;
	
	@Test
	public void orderMenuTest() {
		/*		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			IndividualVO individualVO = new IndividualVO();
			individualVO.setPhoneNum("010-0123-2223");
			
			String checkUser = sqlSession.selectOne("selectIndividual", individualVO.getPhoneNum());
			
			if (checkUser == null)
				orderService.addUser(individualVO);
					
			OrderManageVO orderManageVO = new OrderManageVO();
			orderManageVO.setPaymentWay('c');
			orderManageVO.setRestaurantId(10);
			orderManageVO.setTableId(41);
			orderManageVO.setPhoneNum(individualVO.getPhoneNum());
			
			orderService.creationOrderId(orderManageVO);
			
			OrderMenuVO orderMenuVO = new OrderMenuVO();
			orderMenuVO.setOrderId(orderManageVO.getOrderId());
			orderMenuVO.setFoodId(2);
			orderMenuVO.setIsSupply("x");
			orderMenuVO.setNum(0);
			orderMenuVO.setCount(3);
			
			orderService.addMenu(orderMenuVO);
			
			orderMenuVO = new OrderMenuVO();
			orderMenuVO.setOrderId(orderManageVO.getOrderId());
			orderMenuVO.setFoodId(1);
			orderMenuVO.setIsSupply("x");
			orderMenuVO.setNum(1);
			orderMenuVO.setCount(2);
			
			orderService.addMenu(orderMenuVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		*/
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			OrderManageVO orderManageVO = new OrderManageVO();
			orderManageVO.setPaymentWay('c');
			orderManageVO.setRestaurantId(10);
			orderManageVO.setTableId(41);
			
			orderService.creationOrderId(orderManageVO);
			
			OrderMenuVO orderMenuVO = new OrderMenuVO();
			orderMenuVO.setOrderId(orderManageVO.getOrderId());
			orderMenuVO.setFoodId(6);
			orderMenuVO.setIsSupply("x");
			orderMenuVO.setNum(0);
			orderMenuVO.setCount(3);
			
			orderService.addMenu(orderMenuVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void updateOrderMenuTest() {
		
		OrderManageVO orderManageVO = orderService.selectManage(32);
		
		orderManageVO.setWhetherPayment('o');
		
		orderService.updateOrderMg(orderManageVO);
		
	}
	
	@Test
	public void updateFoodSupplyStatus() {
		
		orderService.updateFoodSupplyStatus(67, 0, "o");
		
	}
	
	@Test
	public void inquiryRestaurantName() {
		
		String name = restaurantService.inquiryRestaurantName(9);
		System.out.println("name = " + name);
		
	}
	
	@Test
	public void orderListTest() {
		
		List<OrderManageVO> orderManageVOs = orderService.selectAllManage(9);
		List<OrderMenuVO> orderMenuVOs;
		List<OrderDetailVO> orderDetailVOs = new ArrayList<OrderDetailVO>();
		FoodMenuVO foodMenuVO;	
		//주문관리 테이블의 tableId로 tableNo 가지고 옴
		
		Integer orderStanby = 0;
		
		for (int i = 0; i < orderManageVOs.size(); i++) {
			MyBatisTransactionManager transaction = getTransactionManager();
			try {
				transaction.start();
				
				Integer orderId = orderManageVOs.get(i).getOrderId();
	
				orderMenuVOs = orderService.selectIdAllMenu(orderId);
				int tableNo = tableService.inquiryTableNo(orderManageVOs.get(i).getTableId());
				
				for (int j = 0; j < orderMenuVOs.size(); j++) {
					System.out.println("테이블 번호 = " + tableNo + ", orderId = " + orderId + ", 주문날짜 = " + orderManageVOs.get(i).getOrderDay() + 
							", 주문시간 = " + orderManageVOs.get(i).getOrderTime());
					Integer foodId = orderMenuVOs.get(j).getFoodId();
					System.out.print("	foodid = " + foodId);
					foodMenuVO = foodMenuService.foodMenuInfo(foodId);
					System.out.println(", foodName = " + foodMenuVO.getFood_name() + ", pay = " + foodMenuVO.getPay() +
							", 수량 = " + orderMenuVOs.get(j).getCount() + ", 대기순번 = " + orderStanby + 
							", 음식제공여부 = " + orderMenuVOs.get(j).getIsSupply());
					
					OrderDetailVO orderDetailVO = new OrderDetailVO();
					orderDetailVO.setTableNo(9);
					orderDetailVO.setOrderFoodName(foodMenuVO.getFood_name());
					orderDetailVO.setPay(foodMenuVO.getPay());
					orderDetailVO.setOrderQuantity(orderMenuVOs.get(j).getCount());
					orderDetailVO.setOrderDay(orderManageVOs.get(i).getOrderDay());
					orderDetailVO.setOrderTime(orderManageVOs.get(i).getOrderTime());
					orderDetailVO.setOrderStanby(orderStanby);
					orderDetailVO.setIsSupply(orderMenuVOs.get(j).getIsSupply());
					orderDetailVOs.add(orderDetailVO);
					
					orderStanby++;
				}
				
				transaction.commit();
			} finally {
				transaction.end();
			}
		}
		OrderDetailVO orderDetailVO = orderDetailVOs.get(0);
		int a = 3;
	}
}












