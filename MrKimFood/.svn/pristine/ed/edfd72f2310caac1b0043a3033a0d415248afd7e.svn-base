package com.mrkimfood.gonggam.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mrkimfood.gonggam.vo.CompanyVO;

@Controller
public class WelcomeController {
	
	@Inject
	SqlSession sqlSession;
	
	@RequestMapping("/")
	public String welcome() {
//		MemberVO member = new MemberVO();
//		member.setMemberId(1l);
//		member.setIndividualCompany('I');
//		member.setId("jinsu");
//		member.setPw("123");
//		Date date = new Date(2014, 1, 5);
//		Date date2 = new Date(2014, 11, 19);
//		member.setModifyDate(date);
//		member.setIsAway('1');
//		member.setRegDate(date2);
//		sqlSession.insert("registerMember", member);
		
		return "/companyMain";
	}
	
	@RequestMapping("/jinsuTest")
	public String jinsuTest(){
		return "jinsuTest";
	}
	
	@RequestMapping("/company/main2")
	public String companyMain(){
		
		return "/company/main2";
	}
	
	@RequestMapping("/orderMg")
	public String orderMg() {
		return "/orderMg";
	}
	
	@RequestMapping("/errorD")
	public ModelAndView deleteback(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("errorMessage", "삭제된 매장입니다.");
		models.put("changeUrl", "company/myShopList");
		return new ModelAndView("/error/deleteToBack","models",models);
	}
	
}
