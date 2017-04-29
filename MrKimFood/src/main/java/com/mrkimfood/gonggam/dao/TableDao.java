package com.mrkimfood.gonggam.dao;

import java.util.List;
import java.util.Map;

import com.mrkimfood.gonggam.vo.MakeTableInfoVO;
import com.mrkimfood.gonggam.vo.TableVO;

public interface TableDao {
	
	int insert(TableVO tableVO);
	//현 매장에서 가장 많이 만든 테이블 개수를 반환한다.
	Integer selectTableMaxCount(Integer shopNo);
	//현제 사용중인 테이블 최대 개수를 반환한다.
	Integer selectTableCount(Integer shopNo);
	
	TableVO idSelect(TableVO tableVO);
	
	List<TableVO> selectList(Integer restaurantId);
	
	int update(TableVO tableVO);
	
	int updateIsUseTable(TableVO tableVO);
	
	int updateDeactivationTable(MakeTableInfoVO makeTableInfoVO);
	
	int updateActivationTable(MakeTableInfoVO makeTableInfoVO);

	int selectTableNo(Integer tableId);
	
	List<TableVO> selectListToPagging(Map<String, Object> inputMap);
}
