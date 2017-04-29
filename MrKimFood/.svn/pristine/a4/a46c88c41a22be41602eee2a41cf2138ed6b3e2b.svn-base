package com.mrkimfood.gonggam.hswtest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.vo.TableVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class TableTest extends MyBatisSupport {
	
	@Test
	public void insertTest() {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO tableVO = new TableVO();
			
			tableVO.setNo(13);
			tableVO.setQrCode("asdfasdf");
			tableVO.setIsUseTable("o");
			tableVO.setRestaurantId(9);
			
			sqlSession.insert("registerTable", tableVO);
			
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
			
			TableVO tableVO = new TableVO();
			tableVO.setTableId(87);
			tableVO.setNo(2);
			tableVO.setQrCode("bbbbbbbbbb");
			tableVO.setIsUseTable("o");
			tableVO.setRestaurantId(10);
			
			TableVO ttt = sqlSession.selectOne("idSelectTable", tableVO);
			
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
			
			List<TableVO> tableVOs = sqlSession.selectList("selectListTable", 9);
			for(TableVO table: tableVOs){
				System.out.println(table.getNo()+"  /  "+table.getQrCode());
			}
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
			tableVO.setTableId(87);
			tableVO.setNo(2);
			tableVO.setQrCode("bbbbbbbbbb");
			tableVO.setIsUseTable("o");
			tableVO.setRestaurantId(10);
			
			int cnt = sqlSession.update("updateTable", tableVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	/*
	@Test
	public void selectIsUseTable() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO tableVO = new TableVO();
//			tableVO.setIsUseTable("o");
//			tableVO.setNo(23);
			tableVO.setTableId(41);
			tableVO.setRestaurantId(10);
			
			String ttt = sqlSession.selectOne("selectIsUseTable", tableVO);
			System.out.println("테이블 사용 여부 = " + ttt);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	*/
	@Test
	public void updateIsUseTable() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO tableVO = new TableVO();
			tableVO.setIsUseTable("o");
//			tableVO.setNo(23);
			tableVO.setTableId(41);
			tableVO.setRestaurantId(10);
			
			sqlSession.update("updateIsUseTable", tableVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	/*
	@Test
	public void selectTableNo() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO tableVO = new TableVO();
			tableVO.setNo(11);
			tableVO.setRestaurantId(10);
			
			Integer a = sqlSession.selectOne("selectTableNo", tableVO);
			System.out.println("tableNo = " + a);
			if(a == null) return;
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	*/
}












