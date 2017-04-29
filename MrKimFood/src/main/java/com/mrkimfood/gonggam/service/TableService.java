package com.mrkimfood.gonggam.service;

import java.util.List;
import java.util.Map;

import com.mrkimfood.gonggam.vo.TableVO;

public interface TableService {
	
	public int makeTable(TableVO tableVO);
	
	void makeTable(Integer shopNo, Integer tableCount);

	public TableVO selectTable(TableVO tableVO);

	public List<TableVO> selectTableList(Map<String, Object> inputMap);
	
	public List<TableVO> selectAllTable(Integer restaurantId);

	public int updateTable(TableVO tableVO);
	
	public int updateUseTableStatus(TableVO tableVO);

	public int inquiryTableNo(Integer tableId);

	public Integer getTableCount(Integer shopNo);

}
