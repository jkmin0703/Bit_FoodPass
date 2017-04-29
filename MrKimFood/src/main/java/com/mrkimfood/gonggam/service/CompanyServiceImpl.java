package com.mrkimfood.gonggam.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;

import com.mrkimfood.gonggam.dao.CompanyDAO;
import com.mrkimfood.gonggam.vo.CompanyVO;

@Service
public class CompanyServiceImpl implements CompanyService {
	
	@Inject
	@Named ("companyDAO-myBatis")
	CompanyDAO dao;
	
	@Override
	public CompanyVO selectLoginMember(Integer memberNo){
		return dao.read(memberNo);
	}
	
	@Override
	public CompanyVO checkLogin(CompanyVO member) throws Exception {
		return dao.read(member);
	}

	@Override
	public void registerMember(CompanyVO member) throws Exception {
		System.out.println("registMember");
		if(member == null){
			System.out.println("회원 정보가 없습니다.");
			throw new Exception ("회원 정보가 없습니다.");
		}
		int insertResult = 0;
		System.out.println("public void registMember(CompanyVO member) throws Exception ");
		
		try {
			System.out.println("dao.create(member)");
			insertResult = dao.create(member);
			System.out.println("insertResult = " + insertResult);
		} catch (Exception e) {
			System.out.println("registMember-Exception");
			throw e;
		}
		
	}

	
	@Override
	public List<CompanyVO> getMemberList() throws Exception {
		// DAO를 통해 회원 목록 조회 (member list)
		List<CompanyVO> list = dao.getMemberList();
		// 회원 목록 리턴
		return list;

	}

	@Override
	public int modifyMember(CompanyVO member) throws Exception {
		return dao.update(member);
	}
	
	@Override
	public Boolean IdCheck(String checkId){
		Integer count = dao.selectToIdCheck(checkId);
		if(count==0){ 
			//입력한 아이디가 DB에 없을 때
			return false;
		}else{
			//입력한 아이디가 DB에 있을 때
			return true;
		}
	}
	
	@Override
	public int deleteMember(Integer memberNo){
		return dao.delete(memberNo);
	}
	

}
