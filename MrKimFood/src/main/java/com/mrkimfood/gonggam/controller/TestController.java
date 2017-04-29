package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@Inject	SqlSession sqlSession;
	
	@RequestMapping("/qrCreate")
	public String qrCreateForm(){
		return "/TEST/QR/qrCreate";
	}
	
	@RequestMapping("/qrReader")
	public String qrSacnnerForm(){
		return "/TEST/QR/qrReader";
	}

	@RequestMapping("/webqr")
	public String webQRForm(){
		return "/TEST/QR/webqrSemple";
	}
	
	//--------- HightChart Test(나진수) ----------
	@RequestMapping("/test/chartSample")
	public String chartSampleForm(){
		return "/company/sales/chartSemple";
	}
	
	@RequestMapping("/test/chart/basicBar")
	public String basicBarChart(){
		return "/TEST/highChart/BarChart-basic";
	}

	@RequestMapping("/test/chart/drilldownBar")
	public String drilldownBarChart(){
		return "/TEST/highChart/BarChart-Drilldown";
	}
	
	@RequestMapping("/test/chart/drilldownPie")
	public String drilldownPieChart(){
		return "/TEST/highChart/PieChart-Drilldown";
	}
	
	
	//---------- AJAX Upload ----------------
	@RequestMapping("/AjaxUp")
	public String AjaxUpForm(){
		return "/TEST/Ajax/AjaxDataUp";
	}
	
//	@RequestMapping("/AjaxGetUp")
//	public @ResponseBody String memberIdCheck(HttpServletRequest request, 
//			HttpServletResponse response, @ModelAttribute CompanyVO member){
//		System.out.println(member.getId());
//		return "성공!";
//	}
	
	@RequestMapping(value="/test/AjaxGetUp", method=RequestMethod.GET)
	public @ResponseBody String memberIdCheck(HttpServletRequest request, 
			HttpServletResponse response, @RequestParam("id") String id){
		System.out.println(id);
		return "get 성공!";
	}
	
	@RequestMapping(value="/test/AjaxPostUp", method=RequestMethod.POST)
	public @ResponseBody String AjaxDataPostUp(HttpServletRequest request, 
			HttpServletResponse response, @RequestParam("id") String id){
		System.out.println("Ajax Post UP 테스트");
		System.out.println(id);
		return "Post 성공";
	}
	
	@RequestMapping(value="/test/jsonpUp")
	public void AjaxJSONPUp(HttpServletRequest request, HttpServletResponse response,
		@RequestParam("data") String jsonStr, @RequestParam(required=false) String callback ) throws JsonParseException, JsonMappingException, IOException{
		
		System.out.println("JSONP 테스트");
		System.out.println(jsonStr);
		
		ObjectMapper om = new ObjectMapper();
		// JSON 문자열을 Map or List Object 로 변환
//        Map<String, Object> m = om.readValue(jsonStr, new TypeReference<Map<String, Object>>(){});
//        System.out.println("json to object : " + m);
        
		//JSON 문자열을 Bean 객체로 변환
		HashMap<String, Object> map = om.readValue(jsonStr, new TypeReference<Map<String, Object>>(){});
		System.out.println((Integer)map.get("id"));
		JSONParser parser = new JSONParser();
		System.out.println(map.get("voData"));
		JSONObject jsonObj = (JSONObject)  map.get("voData");
		String foodClassfyId = (String) jsonObj.get("foodClassfyId");
		System.out.println(foodClassfyId);
		
//		FoodClassifyVO vo =  om.readValue(jsonStr, FoodClassifyVO.class);
//		System.out.println(vo.getRestaurantId());
//		System.out.println(vo.getFoodClassifyName());
//		System.out.println(vo.getFoodClassifyId());
		
	}
	
}
