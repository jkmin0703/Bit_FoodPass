package com.mrkimfood.gonggam.jinsuTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.brm.mybatis.MyBatisSupport;
import com.brm.mybatis.transaction.MyBatisTransactionManager;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class ETCtest  extends MyBatisSupport {
	
	@Test
	public void switchCaseTest(){
		
		Integer getTableCount=11;
		Integer tableCount = 5;
		Integer tableMaxCount=10;
		
		System.out.println("입력받은 테이블 카운터:"+getTableCount);
		System.out.println("현제 사용중인 테이블:"+tableCount);
		System.out.println("현제까지 최대로 많이 만든 테이블 수:"+tableMaxCount);
		System.out.println("----------------------------------");
		
		if(tableMaxCount==null){
			System.out.println("테이블이 한번도 생성되지 않음");
		
		}else{
			
			if(getTableCount==0){
				System.out.println("0이 입력되었음.");
			
			}else if(getTableCount <= tableMaxCount){
				System.out.println("입력값이 최대 테이블 생성 개수보다 작음");
				
				if(getTableCount <= tableCount){
					System.out.println("현제 사용중인 테이블보다 작거나 같음");
				}else{
					System.out.println("현제 사용중인 테이블보다 큼");
				}
				
				
			}else if(getTableCount > tableMaxCount){
				System.out.println("입력값이 더큼");
			}
			
		}
		
	}
	
	@Test
	public void StringSplitTest(){
		String s1 ="10,20,30";
		String[] sp_s1 = s1.split(",");
		for(String ss:sp_s1){
			System.out.println(ss);
		}
		System.out.println("-------------");
		String s2 ="10";
		String[] sp_s2 = s2.split(",");
		for(String ss2:sp_s2){
			System.out.println(ss2);
		}
		
		String s3 = null;
		String[] sp_s3 = s3.split(",");
		System.out.println(sp_s3.length);
	}
	

}
