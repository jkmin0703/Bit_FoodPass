package com.mrkimfood.gonggam.dao;

import java.util.List;
import java.util.Map;

import com.mrkimfood.gonggam.vo.IndividualVO;

public interface IndividualDAO {
	
	//회원 조회
	List<IndividualVO> getInMemberList() throws Exception;
	//회원 정보 확인
	IndividualVO  read(IndividualVO inMember) throws Exception;
	//회원 등록
	int create (IndividualVO inMember) throws Exception;
	//회원 정보 업데이트
	int update (IndividualVO inMember) throws Exception;
	//회원 정보 삭제
	int delete (IndividualVO inMember) throws Exception;
	//ID 체크
	Integer selectToIdCheck(String checkId);
	

}
