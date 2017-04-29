package com.mrkimfood.gonggam.hswtest;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.service.TableService;
import com.mrkimfood.gonggam.vo.TableVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class TableServiceTest extends MyBatisSupport {
	
	@Inject TableService tableService;
	
	@Test
	public void insertTest() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO tableVO = new TableVO();
			tableVO.setNo(1);
			tableVO.setQrCode("ttttttttttt");
			tableVO.setIsUseTable("x");
			tableVO.setRestaurantId(10);
			
			tableService.makeTable(tableVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void idSelectTest() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO t = new TableVO();
			t.setTableId(81);
			t.setRestaurantId(10);
			t.setIsUseTable("o");
			
			TableVO tableVO = tableService.selectTable(t);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectListTest() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			List<TableVO> tableVOs = tableService.selectAllTable(10);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void updateTest() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
	
			TableVO tableVO = new TableVO();
			tableVO.setTableId(63);
			tableVO.setNo(2);
			tableVO.setQrCode("ttttttttt");
			tableVO.setIsUseTable("x");
			tableVO.setRestaurantId(10);
			
			int cnt = tableService.updateTable(tableVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void updateUseTableStatus() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO tableVO = new TableVO();
			tableVO.setTableId(63);
			tableVO.setNo(2);
			tableVO.setQrCode("ttttttttt");
			tableVO.setIsUseTable("o");
			tableVO.setRestaurantId(10);
			
			tableService.updateUseTableStatus(tableVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void inquiryTableNo() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			int tableNo = tableService.inquiryTableNo(43);
			System.out.println(tableNo);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
}

	
	
	
	
	
	
	
	
	
	
	