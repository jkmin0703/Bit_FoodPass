package com.mrkimfood.gonggam.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.MakeTableInfoVO;
import com.mrkimfood.gonggam.vo.TableVO;

@Repository
public class TableDaoImpl implements TableDao{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int insert(TableVO tableVO) {
		return sqlSession.insert("registerTable", tableVO);
	}
	
	@Override
	public TableVO idSelect(TableVO tableVO) {
		return sqlSession.selectOne("idSelectTable", tableVO);
	}
	
	@Override
	public Integer selectTableMaxCount(Integer shopNo){
		return sqlSession.selectOne("selectTableMaxCount", shopNo);
	}
	
	@Override
	public Integer selectTableCount(Integer shopNo){
		return sqlSession.selectOne("selectTableCount", shopNo);
	}
	
	@Override
	public List<TableVO> selectList(Integer restaurantId) {
		return sqlSession.selectList("selectListTable", restaurantId);
	}
	
	@Override
	public List<TableVO> selectListToPagging(Map<String, Object> inputMap){
		return sqlSession.selectList("selectListTableToPagging", inputMap);
	}
	
	@Override
	public int update(TableVO tableVO) {
		return sqlSession.update("updateTable", tableVO);
	}

	@Override
	public int updateIsUseTable(TableVO tableVO) {
		return sqlSession.update("updateIsUseTable", tableVO);
	}
	
	@Override
	public int updateDeactivationTable(MakeTableInfoVO makeTableInfoVO){
		return sqlSession.update("deactivationTable", makeTableInfoVO);
	}
	
	@Override
	public int updateActivationTable(MakeTableInfoVO makeTableInfoVO){
		return sqlSession.update("activationTable", makeTableInfoVO);
	}

	@Override
	public int selectTableNo(Integer tableId) {
		return sqlSession.selectOne("selectTableNo", tableId);
	}
	
}
