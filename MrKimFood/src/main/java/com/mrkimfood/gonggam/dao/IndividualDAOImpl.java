package com.mrkimfood.gonggam.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.IndividualVO;

@Repository
public class IndividualDAOImpl implements IndividualDAO {

	@Inject
	SqlSession sqlsession;
	
	
	@Override
	public List<IndividualVO> getInMemberList() throws Exception {
		return sqlsession.selectList("selectInMemberList");
	}
	
	@Override
	public IndividualVO read(IndividualVO inMember) throws Exception {
		return sqlsession.selectOne("selectInMember", inMember);
	}

	@Override
	public int create(IndividualVO inMember) throws Exception {
		return sqlsession.insert("registerInMember", inMember);
	}

	@Override
	public int update(IndividualVO inMember) throws Exception {
		return sqlsession.update("updateInMember", inMember);
	}

	@Override
	public int delete(IndividualVO inMember) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Integer selectToIdCheck(String checkId) {
		return sqlsession.selectOne("inMemberIdCheck", checkId);
	}
	

}
