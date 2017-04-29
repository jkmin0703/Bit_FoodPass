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
import com.mrkimfood.gonggam.vo.FoodMenuImageVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.RestaurantVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/**/*-config.xml" })
public class FoodMenuTest extends MyBatisSupport {

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
	public void foodMenuList(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			
			Map<String, Object> inputMap = new HashMap<String, Object>();
			inputMap.put("page", 1);
			inputMap.put("pageColumnSize", 8);
			inputMap.put("shopId", 9);
			inputMap.put("categoryNo", null);
			List<FoodMenuVO> foodMenuList = sqlSession.selectList("selectFoodList", inputMap);

			for(FoodMenuVO fvo: foodMenuList){
				System.out.println(fvo.getFood_ID()+"/"+fvo.getFood_name()+"/"+
						fvo.getIsuse_food()+"/"+fvo.getRestaurant_ID()+"/"+fvo.getFood_classify_id());
			}
			
			transaction.commit();
			
			
		} finally {
			transaction.end();
		}
	}
	
	@Test
	public void foodMenuCount(){
		MyBatisTransactionManager transaction = getTransactionManager();
		try {
			transaction.start();
			Integer foodId =0;
			Integer output = sqlSession.selectOne("foodmenuImgCount", foodId);
			System.out.println(output);
			
			transaction.commit();
		} finally {
			transaction.end();
		}
	}
		
}
