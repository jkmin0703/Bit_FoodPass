package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mrkimfood.gonggam.service.RestaurantService;
import com.mrkimfood.gonggam.service.SalesService;
import com.mrkimfood.gonggam.vo.FoodClassifyVO;
import com.mrkimfood.gonggam.vo.RestaurantVO;

@Controller
@RequestMapping("/company")
public class SalesController {
	
	@Inject private SalesService service;
	@Inject private RestaurantService restaurantService;
	
	
	@RequestMapping("/sales/day/total")
	public ModelAndView totalBarChart(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required=false) Integer shopNo) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		
		//현제 로그인 되어있는 회원의 회원번호를 받아온다.
		Integer memberNo = CompanyController.getLoginMember(request);
		
		if(shopNo == null){ //샵 번호를 받지 않을 경우 제일 큰 샵 번호를 DB에서 찾아서 넘겨준다.
			shopNo = restaurantService.selectMaxShop(memberNo);
		}
		
		//매출 selectBar 관련 데이터 처리
		String salesVal = "total";
		
		List<Map<String, Object>> salesBarList = new ArrayList<Map<String,Object>>();
		String[] salesBarValues = new String[]{"total","category"};
		String[] salesBarTexts = new String[]{"총 매출","카테고리"};

		for(int i=0;i<salesBarTexts.length;i++){
			Map<String, Object>salesBarInfo = new HashMap<String, Object>();
			salesBarInfo.put("salesBarVal", salesBarValues[i]);
			salesBarInfo.put("salesBarText", salesBarTexts[i]);
			
			salesBarList.add(salesBarInfo);
		}
		
		//내가계정보 관련 데이터 처리
		List<RestaurantVO> selectBarList = restaurantService.selectBarList(memberNo);
		RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);		//가계정보VO
		
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "mySales";
		
		//총 판매 금액 처리
		Map<String, Object>totalSalesInfoMap = service.totalSalesPayToday(shopNo);
		
		//최종 처리 데이터
		Map<String,Object> models = new HashMap<String, Object>();
		models.put("shopNo", shopNo);
		models.put("shopInfo", shopInfo);
		models.put("selectBarList", selectBarList);
		models.put("checkSideBar", checkSideBar);
		models.put("salesVal", salesVal);
		models.put("salesBarList", salesBarList);
		models.put("today", totalSalesInfoMap.get("today"));
		models.put("totalSalesPay", totalSalesInfoMap.get("totalSalesPay"));
		models.put("salesMenuList", totalSalesInfoMap.get("salesMenuList"));
		models.put("salesPayList", totalSalesInfoMap.get("salesPayList"));
		return new ModelAndView("/company/sales/totalBarChartToDay", "models", models);
	}
	
	@RequestMapping("/sales/day/category")
	public ModelAndView categoryPieChart(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required=false) Integer shopNo) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		
		//현제 로그인 되어있는 회원의 회원번호를 받아온다.
		Integer memberNo = CompanyController.getLoginMember(request);
		
		if(shopNo == null){ //샵 번호를 받지 않을 경우 제일 큰 샵 번호를 DB에서 찾아서 넘겨준다.
			shopNo = restaurantService.selectMaxShop(memberNo);
		}
		
		//매출 selectBar 관련 데이터 처리
		String salesVal = "category";
		
		List<Map<String, Object>> salesBarList = new ArrayList<Map<String,Object>>();
		String[] salesBarValues = new String[]{"total","category"};
		String[] salesBarTexts = new String[]{"총 매출","카테고리"};

		for(int i=0;i<salesBarTexts.length;i++){
			Map<String, Object>salesBarInfo = new HashMap<String, Object>();
			salesBarInfo.put("salesBarVal", salesBarValues[i]);
			salesBarInfo.put("salesBarText", salesBarTexts[i]);
			
			salesBarList.add(salesBarInfo);
		}
		
		//내가계정보 관련 데이터 처리
		List<RestaurantVO> selectBarList = restaurantService.selectBarList(memberNo);
		RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);		//가계정보VO
		
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "mySales";
		
		//차트 정보 반환
		Map<String, Object>totalSalesInfoMap = service.categorySalesPayToday(shopNo);
		
//		String testData = "세트메뉴/빅맥세트\t457500\n"+
//								"세트메뉴/치즈버거세트\t205000\n"+
//								"세트메뉴/새우버거세트\t28500\n"+
//								"세트메뉴/1995버거세트\t43500\n"+
//								"세트메뉴/맥스파이시버거 세트\t312200\n"+
//								"커피/아메리카노\t20000\n"+
//								"커피/카페라떼\t55000\n"+
//								"커피/아이스라떼\t31200\n"+
//								"커피/에스프레소\t34200\n"+
//								"버거/빅맥버거\t151100\n"+
//								"버거/새우버거\t287500\n";
		
		//최종 처리 데이터
		Map<String,Object> models = new HashMap<String, Object>();
		models.put("shopNo", shopNo);
		models.put("shopInfo", shopInfo);
		models.put("selectBarList", selectBarList);
		models.put("checkSideBar", checkSideBar);
		models.put("salesVal", salesVal);
		models.put("salesBarList", salesBarList);
		models.put("totalSalesPay", totalSalesInfoMap.get("totalSalesPay"));
		models.put("salesPieChartData", totalSalesInfoMap.get("salesPieChartData"));
		
		return new ModelAndView("/company/sales/categoryPieChartToDay", "models", models);
	}
	/*
	@RequestMapping("/sales/day/category")
	public ModelAndView categoryPieChart(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required=false) Integer shopNo) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		
		//현제 로그인 되어있는 회원의 회원번호를 받아온다.
		Integer memberNo = CompanyController.getLoginMember(request);
		
		if(shopNo == null){ //샵 번호를 받지 않을 경우 제일 큰 샵 번호를 DB에서 찾아서 넘겨준다.
			shopNo = restaurantService.selectMaxShop(memberNo);
		}
		
		//매출 selectBar 관련 데이터 처리
		String salesVal = "category";
		
		List<Map<String, Object>> salesBarList = new ArrayList<Map<String,Object>>();
		String[] salesBarValues = new String[]{"total","category"};
		String[] salesBarTexts = new String[]{"총 매출","카테고리"};

		for(int i=0;i<salesBarTexts.length;i++){
			Map<String, Object>salesBarInfo = new HashMap<String, Object>();
			salesBarInfo.put("salesBarVal", salesBarValues[i]);
			salesBarInfo.put("salesBarText", salesBarTexts[i]);
			
			salesBarList.add(salesBarInfo);
		}
		
		//내가계정보 관련 데이터 처리
		List<RestaurantVO> selectBarList = restaurantService.selectBarList(memberNo);
		RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);		//가계정보VO
		
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "mySales";
		
		Map<String,Object> models = new HashMap<String, Object>();
		models.put("shopNo", shopNo);
		models.put("shopInfo", shopInfo);
		models.put("selectBarList", selectBarList);
		models.put("checkSideBar", checkSideBar);
		models.put("salesVal", salesVal);
		models.put("salesBarList", salesBarList);
		return new ModelAndView("/company/sales/totalBarChartToDay", "models", models);
	}
	*/
}
