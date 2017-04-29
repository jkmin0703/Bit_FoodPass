package com.mrkimfood.gonggam.dao;

import java.util.List;

import com.mrkimfood.gonggam.vo.CompanyVO;

public interface CompanyDAO {

	List<CompanyVO> getMemberList() throws Exception;
	
	CompanyVO read(CompanyVO member) throws Exception;
	CompanyVO read(Integer memberNo);
	
	int create(CompanyVO member) throws Exception;
	
	int update(CompanyVO member) throws Exception;
	
	int delete(Integer memberNo);

	Integer selectToIdCheck(String checkId);

}
