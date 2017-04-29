package com.mrkimfood.gonggam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company/customerCenter")
public class customerCenterController {

	@RequestMapping("/FAQ")
	public String customerCenterFAQForm(HttpServletRequest request, HttpServletResponse response){
		return "/company/customerCenter/customerCenterFAQ";
	}
	@RequestMapping("/mailingService")
	public String customerCenterMailingServiceForm(HttpServletRequest request, HttpServletResponse response){
		return "/company/customerCenter/customerCenterMailingService";
	}
	@RequestMapping("/post")
	public String customerCenterPostForm(HttpServletRequest request, HttpServletResponse response){
		return "/company/customerCenter/customerCenterPost";
	}
}
