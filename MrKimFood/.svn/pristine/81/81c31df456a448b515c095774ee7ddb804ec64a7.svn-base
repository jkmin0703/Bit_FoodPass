package com.mrkimfood.gonggam.service;

import java.util.List;

import javax.inject.Inject;

import com.mrkimfood.gonggam.vo.CompanyVO;

public interface CompanyService {
	
	//회원 번호를 사용하여 회원 정보 조회
	CompanyVO selectLoginMember(Integer memberNo);

	// 로그인 확인
	CompanyVO checkLogin(CompanyVO member) throws Exception;
	
	// 회원 등록
	void registerMember(CompanyVO member) throws Exception;
	
	// 회원 목록 조회
	List<CompanyVO> getMemberList() throws Exception;

	// 회원 수정
	int modifyMember(CompanyVO member) throws Exception;

	Boolean IdCheck(String checkId);
	
	//회원 탈퇴
	int deleteMember(Integer memberNo);



}
