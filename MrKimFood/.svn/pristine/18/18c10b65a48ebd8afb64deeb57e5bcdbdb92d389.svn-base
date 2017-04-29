package com.mrkimfood.gonggam.hswtest;

import java.sql.Date;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.List;



import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.vo.CompanyVO;
import com.mrkimfood.gonggam.vo.OrderManageVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class MybatisSupportTest extends MyBatisSupport {
	
//	int orderId = 0;
	
	@Test
	public void testProgramacTraction() throws SQLException {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			CompanyVO member = new CompanyVO();
			member.setId("testId");
			member.setPw("1234");
			Date date = new Date(2014, 1, 5);
			Date date2 = new Date(2014, 11, 19);
			member.setRegDate(date2);
			member.setIsAway('x');
			member.setModifyDate(date);
			member.setLicenseNum("12234");
			member.setBusinessName("gonggam");
			
			
			int cnt = sqlSession.insert("registerMember", member);
			System.out.println("inserted = " + cnt);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void testOrderManagerInput() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			OrderManageVO orderManageVO = new OrderManageVO();
			orderManageVO.setPaymentSum(7000);
			orderManageVO.setPaymentWay('c');
			Date date = new Date(2014, 11, 25);
			orderManageVO.setRestaurantId(10);
			orderManageVO.setTableId(17);
//			orderManageVO.setPhoneNum("010-0123-2222");
			
			int cnt = sqlSession.insert("inOrderMg", orderManageVO);
			System.out.println("cnt = " + cnt);
			
			System.out.println("*orderId = " + orderManageVO.getOrderId());
			
//			int orderId = sqlSession.selectOne("selectOrderMg", orderManageVO);
//			System.out.println("orderId = " + orderId);
			
			/*OrderMenuVO orderMenuVO = new OrderMenuVO();
			orderMenuVO.setOrderId(0);
			orderMenuVO.setFoodId(2);
			orderMenuVO.setIsSupply('x');
			
			System.out.println(orderMenuVO.getOrderId());
			System.out.println(orderMenuVO.getFoodId());
			System.out.println(orderMenuVO.getIsSupply());
			
			cnt = sqlSession.insert("inOrderMenu", orderMenuVO);*/
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void testSelectOrderMg() {
		OrderManageVO orderManageVO = sqlSession.selectOne("selectOrderMg", 136);
	}
	
	@Test
	public void testSelectAllOrderMg() {
		List<OrderManageVO> orderManageVOs = sqlSession.selectList("selectOrderMgList", 9);
				
		System.out.println("Date = " + (orderManageVOs.get(0).getOrderDay()));
		System.out.println("year = " + (orderManageVOs.get(0).getOrderDay().getYear() + 1900));
		System.out.println("month = " + orderManageVOs.get(0).getOrderDay().getMonth());
		System.out.println("day = " + orderManageVOs.get(0).getOrderDay().getDay());
						
		System.out.println("Hours = " + orderManageVOs.get(0).getOrderTime().getHours());
		System.out.println("Minutes = " + orderManageVOs.get(0).getOrderTime().getMinutes());
		System.out.println("Time = " + orderManageVOs.get(0).getOrderTime());
		
	}
	
	@Test
	public void testUpdateOrderMg() {
		MyBatisTransactionManager transaction = getTransactionManager();
		
		try {
			transaction.start();
			
			OrderManageVO orderManageVO = new OrderManageVO();
			orderManageVO.setOrderId(132);
			orderManageVO.setPaymentSum(12000);
			orderManageVO.setPaymentWay('h');
			orderManageVO.setWhetherPayment('x');
			
			int cnt = sqlSession.update("updateOrderMg", orderManageVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void testInputPhoneNum() throws SQLException {
		
		/*IndividualVO individualVO = new IndividualVO();
		individualVO.setPhoneNum("010-0123-2222");
				
		String strPhone = sqlSession.selectOne("selectIndividual", individualVO.getPhoneNum());
		System.out.println("strPhone = " + strPhone);
		
		if (strPhone != null)
			return;
		
		try {
			sqlSession.insert("inIndividual", individualVO);
		} finally {
			String str = individualVO.getPhoneNum();
			System.out.println(str);
		}*/
		
	}
	
	@Test
	public void testUpdateOrderIsSupply() {
		MyBatisTransactionManager transaction = getTransactionManager();
		
		try {
			transaction.start();
			
			Map<String, Object> params = new Hashtable<String, Object>();
			params.put("orderId", 66);
			params.put("num", 0);
			params.put("isSupply", "o");
			
			sqlSession.update("updateOrderIsSupply", params);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectTableNoTest() {
		MyBatisTransactionManager transaction = getTransactionManager();
		
		try {
			transaction.start();
			
			int tableNo = sqlSession.selectOne("selectTableNo", 43);
			System.out.println("tableNo = " + tableNo);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void selectRestaurantName() {
		MyBatisTransactionManager transaction = getTransactionManager();
		
		try {
			transaction.start();
			
			String name = sqlSession.selectOne("selectRestaurantName", 9);
			System.out.println("name = " + name);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
}













