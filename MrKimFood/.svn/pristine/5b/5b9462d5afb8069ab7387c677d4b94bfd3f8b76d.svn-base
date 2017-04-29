package com.mrkimfood.gonggam.test;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.vo.CompanyVO;
import com.mrkimfood.gonggam.vo.IndividualVO;
import com.mrkimfood.gonggam.vo.TableVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class MybatisSupportTest_JK extends MyBatisSupport {
	
	
	
	@Test
	public void testProgramacTraction() throws SQLException {
		
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			CompanyVO member = new CompanyVO();
			//member.setMemberId(1l);
			member.setId("testId");
			member.setPw("1234");
			member.setLicenseNum("12234");
			member.setPresidant("pp");
			member.setBusinessName("gonggam");
			
			
			int cnt = sqlSession.insert("registerMember", member);
			System.out.println("inserted = " + cnt);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
		
	}
	
	@Test
	public void testTable() throws SQLException {
		
		MyBatisTransactionManager transaction1 = getTransactionManager();
		try {
			transaction1.start();
			
			IndividualVO memberData = new IndividualVO();
			memberData.setEmail("jk@gmail.com");
			memberData.setPassWord("1234");
			
			IndividualVO inMember = null;
			
			inMember = sqlSession.selectOne("selectInMember", memberData);
			System.out.println("inMember = " + inMember);
			System.out.println(inMember.getEmail());
			
			transaction1.commit();
		} finally {
			transaction1.end();
		}
		
	}
	
	
}
 