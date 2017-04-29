package com.mrkimfood.gonggam.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Service;

import com.mrkimfood.gonggam.dao.IndividualDAO;
import com.mrkimfood.gonggam.vo.IndividualVO;

@Service
public class IndividualServiceImpl implements IndividualService {

	@Inject
	IndividualDAO dao;
	
	
	//회원 정보 등록
	@Override
	public void registerInMember(IndividualVO inMember) throws Exception {
		if(inMember==null){
			System.out.println("회원 정보가 없습니다.");
		}
		int insertResult = 0;
		
		try {
			insertResult = dao.create(inMember);
		} catch (Exception e) {
			System.out.println("resistInMeber-Exception");
			throw e;
		}
	}
	
	//회원 로그인 확인
	@Override
	public IndividualVO checkLogin(IndividualVO inMember) throws Exception {
		return dao.read(inMember);
	}


	//회원 정보 조회
	@Override
	public List<IndividualVO> getInMeberList() throws Exception {
		List<IndividualVO> list = dao.getInMemberList();
		return list;
	}

	//회원 정보 수정(update)
	@Override
	public IndividualVO modifyInMember(IndividualVO inMember) throws Exception {
		dao.update(inMember);
		return inMember;
	}
	
	//로그인 회원 ID 체크
	@Override
	public Boolean Idcheck(String checkId) {
		Integer count = dao.selectToIdCheck(checkId);
		if(count == 0){
			return false;
		}else{
			return true;
		}
	}
	
	

}
