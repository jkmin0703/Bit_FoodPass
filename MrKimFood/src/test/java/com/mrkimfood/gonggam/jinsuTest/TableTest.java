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
import com.mrkimfood.gonggam.vo.MakeTableInfoVO;
import com.mrkimfood.gonggam.vo.TableVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class TableTest extends MyBatisSupport {
	
	/*@Test
	public void testMethod(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}*/
	
	@Test
	public void selectTableCount(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Integer tableCount = sqlSession.selectOne("selectTableCount", 10);
			System.out.println("출력되는 테이블 개수:"+tableCount);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectListTableToPagging(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Map<String, Object> inputMap = new HashMap<String, Object>();
			inputMap.put("shopId", 9);
			inputMap.put("page", 3);
			inputMap.put("pageColumnSize", 4);
			
			List<TableVO> tableList = sqlSession.selectList("selectListTableToPagging", inputMap);
			
			for(TableVO table :tableList){
				System.out.println(table.getNo());
			}
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void insertTable(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			TableVO tableVO = new TableVO();
			tableVO.setNo(14);
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
	public void deactivationTableTest(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			MakeTableInfoVO makeTableInfoVO = new MakeTableInfoVO();
			makeTableInfoVO.setShopNo(9);
			makeTableInfoVO.setTableNum(0);
			makeTableInfoVO.setActiveTableNum(8);
			makeTableInfoVO.setTableMaxCount(16);
			
			sqlSession.update("deactivationTable", makeTableInfoVO);
			
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void activationTableTest(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			MakeTableInfoVO makeTableInfoVO = new MakeTableInfoVO();
			makeTableInfoVO.setShopNo(9);
			makeTableInfoVO.setTableNum(12);
			makeTableInfoVO.setActiveTableNum(10);
			makeTableInfoVO.setTableMaxCount(16);
			
			sqlSession.update("activationTable", makeTableInfoVO);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void makeTableMaxOverTest(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			MakeTableInfoVO makeTableInfoVO = new MakeTableInfoVO();
			makeTableInfoVO.setShopNo(9);
			makeTableInfoVO.setTableNum(16);
			makeTableInfoVO.setActiveTableNum(15);
			makeTableInfoVO.setTableMaxCount(15);
			
			sqlSession.update("activationTable", makeTableInfoVO);
			
			
			for(int i=makeTableInfoVO.getTableMaxCount()+1; i<=makeTableInfoVO.getTableNum();i++){
				System.out.println(i);
				TableVO tableVO = new TableVO();
				tableVO.setNo(i);
				tableVO.setQrCode("QRcodeURL?shopNo="+makeTableInfoVO.getShopNo()+"&tableID="+i);
				tableVO.setRestaurantId(makeTableInfoVO.getShopNo());
				
				sqlSession.insert("registerTable", tableVO);
			}
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
}
