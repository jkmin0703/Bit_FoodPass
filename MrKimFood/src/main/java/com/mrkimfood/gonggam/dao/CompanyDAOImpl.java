package com.mrkimfood.gonggam.dao;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mrkimfood.gonggam.vo.CompanyVO;

@Repository("companyDAO-myBatis")
public class CompanyDAOImpl implements CompanyDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<CompanyVO> getMemberList() throws Exception {
		return sqlSession.selectList("selectMemberList");
	}

	@Override
	public CompanyVO read(CompanyVO member) throws Exception {
		System.out.println("CompanyDAOImpl-read");
		return sqlSession.selectOne("selectMember", member);
	}

	@Override
	public CompanyVO read(Integer memberNo){
		return sqlSession.selectOne("selectMemberToMemberId", memberNo);
	}
	
	@Override
	public int create(CompanyVO member) throws Exception {
		System.out.println("CompanyDAOImpl-create");
		return sqlSession.insert("registerMember", member);
	}

	@Override
	public int update(CompanyVO member) throws Exception {
		return sqlSession.update("updateMember", member);
	}

	@Override
	public Integer selectToIdCheck(String checkId){
		return sqlSession.selectOne("memberIdCheck", checkId);
	}
	
	@Override
	public int delete(Integer memberNo){
		return sqlSession.update("updateToDeleteMember", memberNo);
	}

}
