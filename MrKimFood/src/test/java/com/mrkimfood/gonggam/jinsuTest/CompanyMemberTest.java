package com.mrkimfood.gonggam.jinsuTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;
import com.mrkimfood.gonggam.vo.CompanyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class CompanyMemberTest extends MyBatisSupport {

	@Test
	public void idCheckTest() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			String CheckData = "jinsu123";
			Integer count = sqlSession.selectOne("memberIdCheck", CheckData);
			System.out.println(count);
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void selectMemberId() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Integer memberNo = 0;
			CompanyVO member = sqlSession.selectOne("selectMemberToMemberId", memberNo);
			System.out.println(member.getMemberId()+"/"+member.getId()+"/"+member.getPw());

			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void modifyMember() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
//			//1. pwChange 관련 수정 처리
//			CompanyVO cvo = new CompanyVO();
//			cvo.setMemberId(283);
//			cvo.setPw("changePW1");
//			
//			int i = sqlSession.update("updateMember", cvo);
//			System.out.println(i);
			
			//2. 기업회원 정보 수정 처리
			CompanyVO cvo = new CompanyVO();
			cvo.setMemberId(283);
			cvo.setLicenseNum("1112233339");
			cvo.setBusinessName("수정 법인명");
			cvo.setPresidant("수정 대표자명");
			int i = sqlSession.update("updateMember", cvo);
			System.out.println(i);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void updateToDeleteMember() {
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Integer memberNo = 281;
			int i = sqlSession.update("updateToDeleteMember", memberNo);
			
			System.out.println(i);

			transaction.commit();
		} finally {
			transaction.end();
		}
	}
	
}
