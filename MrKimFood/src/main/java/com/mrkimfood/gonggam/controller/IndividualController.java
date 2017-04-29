package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.MemberImpl;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import org.codehaus.jackson.map.util.JSONPObject;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;













import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.mrkimfood.gonggam.service.IndividualService;
import com.mrkimfood.gonggam.vo.IndividualVO;

@Controller
public class IndividualController {
	
	@Inject
	private IndividualService individualService;
	
	//회원 가입
	@RequestMapping(value = "/inMemberSend" ,produces="application/json;charset=UTF-8")
	private String inMemberResist(HttpServletRequest req, HttpServletResponse rep, 
			@RequestParam(value="data", required=false) String encData,
			@RequestParam String callback) throws JsonGenerationException, JsonMappingException, IOException {
		
		/*JsonFactory factory = new JsonFactory();
		JsonParser jp = factory.createJsonParser(data);*/
		
		String jsonData = URLDecoder.decode(encData, "UTF-8");
		
		ObjectMapper mapper = new ObjectMapper();
		IndividualVO individualVO = mapper.readValue(jsonData, IndividualVO.class);
		
		
		System.out.println(jsonData);
		System.out.println(individualVO);
		
		try {
			individualService.registerInMember(individualVO);
			System.out.println("회원등록 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원등록 실패");
		}
		return (callback + "({\"cookies\": ()})");
	}
	
	//회원 로그인
	@ResponseBody
	@RequestMapping("/inMemberLogin")
	public String doLogin(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="data", required=false) String encData,
			@RequestParam (required=false)String redirect,
			@RequestParam (required=false)String callback) throws JsonParseException, JsonMappingException, IOException {
		
		String inMemberData = (encData == null) ? null : URLDecoder.decode(encData, "UTF-8");

		System.out.println(inMemberData);
		
		Gson gson = new Gson();
		IndividualVO memberData = gson.fromJson(inMemberData, IndividualVO.class);
		System.out.println("memberData = " + memberData);
		System.out.println("memberdata email : " + memberData.getEmail());
		System.out.println("memberdata password : " + memberData.getPassWord());
		
		
		ObjectMapper mapper = new ObjectMapper();
		
		//IndividualVO inMember = mapper.setSerializationInclusion(Inclusion.NON_NULL).readValue(inMemberData, IndividualVO.class);
		//Map<String, Object> inputMap = mapper.readValue(inMemberData, new TypeReference<Map<String, Object>>(){});
		
		IndividualVO individualMemberInfo = null;
		try {
			individualMemberInfo = individualService.checkLogin(memberData);
			if(individualMemberInfo != null){
				HttpSession session = request.getSession();
				System.out.println("individualMemberInfo is not null/ individualMember = " + individualMemberInfo);
				session.setAttribute("inMember", individualMemberInfo);
			}
			request.setAttribute("loginMessage", "Email,Password 를 정확히 입력해 주세요.");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("loginMessage", "Occurrence of Login Error");
		}
		
		
		
		
		
//		PrintWriter writer = response.getWriter();
//		writer.append(callback + "({\"code\":0,\"message\":\"Success\"})");
//		writer.flush();
		
		HttpSession session = request.getSession(false);
		if(individualMemberInfo != null){
			session.setAttribute("FPLoginId", individualMemberInfo.getEmail());
			String checkId = individualMemberInfo.getEmail();
			Boolean hasId = individualService.Idcheck(checkId);
			System.out.println("hasId :: " + hasId);
		}
		
		String returnStr;
		
		if (individualMemberInfo == null) {
			returnStr = (callback + "({\"loginCheck\": \"" + request.getAttribute("loginMessage") +"\"" + "})");
		} else {
			returnStr = (callback + "({\"cookies\": {"
					+ "\"JSESSIONID\": \"" + session.getId() + "\"" + ","
					+ "\"fpMemberName\": \"" + individualMemberInfo.getName() + "\"" + ","
					+ "\"fpMemberEmail\": \"" + individualMemberInfo.getEmail() + "\"" + ","
					+ "\"loginCheck\": \"" + request.getAttribute("loginMessage") + "\"" + ","
					+ "}})");
		}
		
		return returnStr;
		
	}
	
	
	
}
