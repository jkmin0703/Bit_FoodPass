package com.mrkimfood.gonggam.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;

@Repository
public class SalesDAOImpl implements SalesDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public String selectToday(){
		return sqlSession.selectOne("toDay");
	}
	
	@Override
	public List<Integer> selectOrderListToday(Integer shopNo){
		return sqlSession.selectList("selectOrderNoListToday", shopNo);
	}
	
	@Override //오늘 일자로 주문한 주문 내역 리스트를 반환
	public List<OrderMenuVO> selectOrderMenuListToday(List<Integer> orderNoList){
		return sqlSession.selectList("selectOrderMenuListToday", orderNoList);
	}
	
	@Override //매장의 음식메뉴 List를 출력
	public List<FoodMenuVO> selectShopFoodMenuList(Integer shopNo){
		
		return sqlSession.selectList("selectShopFoodMenuList", shopNo);
	}
	
	
}
