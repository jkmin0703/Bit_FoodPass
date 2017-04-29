package com.mrkimfood.gonggam.hswtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.vo.OrderMenuVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class OrderMenuTest extends MyBatisSupport {
	
	@Test
	public void testOrderMenuInput() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			OrderMenuVO orderMenuVO = new OrderMenuVO();
			orderMenuVO.setOrderId(132);
			orderMenuVO.setFoodId(2);
			orderMenuVO.setIsSupply("x");
			orderMenuVO.setNum(5);
			
			System.out.println(orderMenuVO.getOrderId());
			System.out.println(orderMenuVO.getFoodId());
			System.out.println(orderMenuVO.getIsSupply());
			
			int cnt = sqlSession.insert("inOrderMenu", orderMenuVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void testMenuList() {		
		List<OrderMenuVO> menuVOs = sqlSession.selectList("selectOrderMenuList", 132);
	}
	
	@Test
	public void testMenuUpgrade() {
		OrderMenuVO orderMenuVO = new OrderMenuVO();
		orderMenuVO.setOrderId(132);
		orderMenuVO.setFoodId(1);
		orderMenuVO.setIsSupply("o");
		orderMenuVO.setNum(2);
		
		int cnt = sqlSession.update("updateOrderMenu", orderMenuVO);
	}
}
