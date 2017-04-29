package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mrkimfood.gonggam.service.RestaurantService;
import com.mrkimfood.gonggam.util.DeleteFunctionError;
import com.mrkimfood.gonggam.vo.CompanyVO;
import com.mrkimfood.gonggam.vo.RestaurantVO;

@Controller
@RequestMapping("/company")
public class RestaurantController {
	
	@Inject
	private RestaurantService service;
	
	
	@RequestMapping("/registerShop")
	public ModelAndView registerShopForm(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "myShop";
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("checkSideBar", checkSideBar);
		return new ModelAndView("/company/myShop/registerShop", "models", models);
	}
	
	@RequestMapping(value="/registerShop", method=RequestMethod.POST)
	public void registerShop(HttpServletRequest request,	HttpServletResponse response,
			@ModelAttribute RestaurantVO restaurantVO ) throws IOException{

		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return;
		}
		
		HttpSession session = request.getSession();		//접속되 있는 사용자를 확인
		CompanyVO companyVO = (CompanyVO)session.getAttribute("member");	
		
		restaurantVO.setMember_ID( companyVO.getMemberId());		//매장 생성시 사용자의 정보를 입력해 준다.

		System.out.println(restaurantVO.getRestaurant_ID());
		System.out.println(restaurantVO.getMember_ID());
		System.out.println(restaurantVO.getRestaurant_name());
		System.out.println(restaurantVO.getAddress());
		System.out.println(restaurantVO.getRestaurant_type());
		System.out.println(restaurantVO.getOpeningTime());
		System.out.println(restaurantVO.getClosingTime());
		System.out.println(restaurantVO.getRes_phone());

		service.registerShop(restaurantVO);	//입력받은 폼 정보 등록
		
		//가계등록 메세지 작성.
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();
		writer.append("<!DOCTYPE html>");
		writer.append("<html>");
		writer.append("<head>");
		writer.append("<script type='text/javascript'>");
		writer.append("alert('가계등록이 완료되었습니다.');");
		writer.append("location.replace('"+request.getContextPath()+"/company/myShopList');");
		writer.append("</script>");
		writer.append("</head>");
		writer.append("<body>");
		writer.append("</body>");
		writer.append("</html>");
		
		writer.close();
		
	}
	
	@RequestMapping("/myShopList")
	public ModelAndView myShopListForm(HttpServletRequest request,	HttpServletResponse response,
			@RequestParam(required=false, defaultValue="1") Integer page,
			@RequestParam(required=false, defaultValue="10") Integer pageColumnSize) throws IOException{
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		HttpSession session = request.getSession();		//접속되 있는 사용자를 확인
		CompanyVO companyVO = (CompanyVO)session.getAttribute("member");
		
		//페이징 List 처리에 필요한 정보들..
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("page", page);
		inputMap.put("pageColumnSize", pageColumnSize);
		inputMap.put("memberId", companyVO.getMemberId());
		
		//출력 결과물
		List<RestaurantVO> shopList = service.shopList(inputMap);	//한 페이지당 보여줄 샵의 List를 갖고온다.
		
		//페이징 관련 정보 Map
		Map<String, Object> pagingInfo = new HashMap<String, Object>();
		Integer totalShopCount = service.getTotalShopCount(inputMap);	//해당 관리자가 관리하는 총 shop의 개수를 갖고온다.
		Integer pageShopSize = pageColumnSize;	// 한페이지에서 보여지는 매장의 개수
		Integer pageNav = page;	//현제 페이지 위치
		Integer pageListCount = 5;	//한 블럭당 나타내 주는 페이지 개수
		Integer totalPage = (totalShopCount/pageShopSize) +1;	//총 페이지 개수
		if(totalShopCount % pageShopSize == 0){
			totalPage = totalShopCount / pageShopSize;
		}
		Integer blockNav=  (pageNav / pageListCount) +1;		// 현제 블럭 위치
		if(pageNav % pageListCount == 0){
			blockNav=  pageNav / pageListCount;
		}
		Integer totalBlock = (totalPage / pageListCount) +1;	//총 블럭의 개수
		if(totalPage % pageListCount == 0){
			totalBlock = totalPage / pageListCount;
		}
		Integer startPage = ((blockNav -1) *pageListCount) +1; //시작 페이지
		Integer endPage;		//종료 페이지
		if(blockNav != totalBlock){
			endPage = blockNav *pageListCount;
		}else{
			endPage = totalPage;
		}
		
		pagingInfo.put("totalShopCount", totalShopCount);
		pagingInfo.put("pageShopSize", pageShopSize);
		pagingInfo.put("pageNav", pageNav);
		pagingInfo.put("pageListCount", pageListCount);
		pagingInfo.put("totalPage", totalPage);
		pagingInfo.put("blockNav", blockNav);
		pagingInfo.put("totalBlock", totalBlock);
		pagingInfo.put("startPage", startPage);
		pagingInfo.put("endPage", endPage);
		
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "myShop";
		
		//최종 반환 모델
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("shopList", shopList);
		models.put("pagingInfo", pagingInfo);
		models.put("checkSideBar", checkSideBar);
		
		return new ModelAndView("/company/myShop/myShopList", "models", models);
	}
	
	//매장관리
	@RequestMapping("/myShop/{shopNo}")
	public ModelAndView shopInfoForm(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("shopNo") Integer shopNo) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		
		Map<String,Object> models = new HashMap<String, Object>();
		
		RestaurantVO shopInfo = service.shopInfo(shopNo);
		if(shopInfo.getIs_manage()=='o'){
			
			models.put("shopNo", shopNo);
			models.put("shopInfo", shopInfo);
	
			return new ModelAndView("/company/myShop/shopInfo", "models", models);
		
		}else{ //매장이 삭제 되었을 때 에러페이지 처리
			return new DeleteFunctionError().restaurant();
		}
		
	}
	
	@RequestMapping("/modifyShop")
	public ModelAndView initModifyShopForm(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required=false) Integer shopNo) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		
		//현재 로그인 되어있는 회원의 회원번호를 받아온다.
		Integer memberNo = CompanyController.getLoginMember(request);
		
		if(shopNo == null){ //샵 번호를 받지 않을 경우 제일 큰 샵 번호를 DB에서 찾아서 넘겨준다.
			shopNo = service.selectMaxShop(memberNo);
		}
		
		//현재 로그인 되어있는 회원의 회원번호를 받아온다.
		List<RestaurantVO> selectBarList = service.selectBarList(memberNo);
		RestaurantVO shopInfo = service.shopInfo(shopNo);		//가계정보VO
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "myShop";
		
		if(shopInfo.getIs_manage()=='o'){
			Map<String,Object> models = new HashMap<String, Object>();
			models.put("shopNo", shopNo);
			models.put("shopInfo", shopInfo);
			models.put("selectBarList", selectBarList);
			models.put("checkSideBar", checkSideBar);
			
			return new ModelAndView("/company/myShop/modifyShop","models",models);
		
		}else{ //매장이 삭제 되었을 때 에러페이지 처리
			return new DeleteFunctionError().restaurant();
			
		}
	}
	
	@RequestMapping(value="/modifyShop", method=RequestMethod.POST)
	public ModelAndView modifyShop(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required=false) Integer shopNo, @ModelAttribute RestaurantVO restaurantVO ) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		
		Integer memberNo = CompanyController.getLoginMember(request);	//현재 로그인 되어있는 회원의 회원번호를 받아온다.

		if(shopNo == null){ //샵 번호를 받지 않을 경우 제일 큰 샵 번호를 DB에서 찾아서 넘겨준다.
			shopNo = service.selectMaxShop(memberNo);
			
		}
		RestaurantVO shopInfo = service.shopInfo(shopNo);
		
		if(shopInfo.getIs_manage()=='o'){
			restaurantVO.setRestaurant_ID(shopNo);
			restaurantVO.setMember_ID(memberNo);
			service.modifyShop(restaurantVO);
			
			response.sendRedirect(request.getContextPath()+"/company/modifyShop?shopNo="+shopNo);
			return null;
			
		}else{	//매장이 삭제 되었을 때 에러페이지 처리
			return new DeleteFunctionError().restaurant();
			
		}
	}

	@RequestMapping("/deleteShop")
	public ModelAndView deleteShopForm(HttpServletRequest request,	HttpServletResponse response,
			@RequestParam(required=false, defaultValue="1") Integer page,
			@RequestParam(required=false, defaultValue="3") Integer pageColumnSize,
			@RequestParam(required=false) String checkListStr) throws IOException{
		
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		HttpSession session = request.getSession();		//접속되 있는 사용자를 확인
		CompanyVO companyVO = (CompanyVO)session.getAttribute("member");
		
		
		//페이징 List 처리에 필요한 정보들..
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("page", page);
		inputMap.put("pageColumnSize", pageColumnSize);
		inputMap.put("memberId", companyVO.getMemberId());
		
		// 1. 페이지단위로 출력할 shop의 List
		List<RestaurantVO> shopList = service.shopList(inputMap);	
		
		// 2. 페이징 관련 정보 Map
		Map<String, Object> pagingInfo = new HashMap<String, Object>();
		Integer totalShopCount = service.getTotalShopCount(inputMap);	//해당 관리자가 관리하는 총 shop의 개수를 갖고온다.
		Integer pageShopSize = pageColumnSize;	// 한페이지에서 보여지는 매장의 개수
		Integer pageNav = page;	//현제 페이지 위치
		Integer pageListCount = 2;	//한 블럭당 나타내 주는 페이지 개수
		Integer totalPage = (totalShopCount/pageShopSize) +1;	//총 페이지 개수
		if(totalShopCount % pageShopSize == 0){
			totalPage = totalShopCount / pageShopSize;
		}
		Integer blockNav=  (pageNav / pageListCount) +1;		// 현제 블럭 위치
		if(pageNav % pageListCount == 0){
			blockNav=  pageNav / pageListCount;
		}
		Integer totalBlock = (totalPage / pageListCount) +1;	//총 블럭의 개수
		if(totalPage % pageListCount == 0){
			totalBlock = totalPage / pageListCount;
		}
		Integer startPage = ((blockNav -1) *pageListCount) +1; //시작 페이지
		Integer endPage;		//종료 페이지
		if(blockNav != totalBlock){
			endPage = blockNav *pageListCount;
		}else{
			endPage = totalPage;
		}
		
		pagingInfo.put("totalShopCount", totalShopCount);
		pagingInfo.put("pageShopSize", pageShopSize);
		pagingInfo.put("pageNav", pageNav);
		pagingInfo.put("pageListCount", pageListCount);
		pagingInfo.put("totalPage", totalPage);
		pagingInfo.put("blockNav", blockNav);
		pagingInfo.put("totalBlock", totalBlock);
		pagingInfo.put("startPage", startPage);
		pagingInfo.put("endPage", endPage);
		
		
		//체크리스트 처리
		List<String> checkList = new ArrayList<String>();
		
		System.out.println("checkList문자열:"+checkListStr);
		
		String[] checkArr;
		if(checkListStr != null && checkListStr !=""){
			checkArr = checkListStr.split(",");
			
			for(String checkData: checkArr){
				checkList.add(checkData);
			}
		}
		
		for(String cData : checkList){
			System.out.println("check리스트 Data:"+cData);
		}
		
		// 3. 체크리스트 정보
		Map<String, Object> checkListInfo = new HashMap<String, Object>();
		checkListInfo.put("checkListStr", checkListStr);
		checkListInfo.put("checkList", checkList);
				
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "myShop";
				
		//최종 반환 모델
		Map<String, Object> models = new HashMap<String, Object>();
		models.put("shopList", shopList);
		models.put("pagingInfo", pagingInfo);
		models.put("checkListInfo", checkListInfo);
		models.put("checkSideBar", checkSideBar);
		
		return new ModelAndView("/company/myShop/deleteShop", "models", models);
	}
	
	@RequestMapping(value="/deleteShop", method=RequestMethod.POST)
	public void deleteShop(HttpServletRequest request, HttpServletResponse response,
			@RequestParam String checkList) throws IOException{
		
		System.out.println("checkList문자열:"+checkList);
		
		List<Integer> deleteShopNoList = new ArrayList<Integer>();
		
		//1. 체크 문자열을 split을 통해 배열로 분해한다.
		String[] checkArr = checkList.split(",");
		
		//2. Integer로 형변환 하여 List에 담는다.
		for(String checkData: checkArr){
			deleteShopNoList.add(Integer.parseInt(checkData));
		}
		
		//3. list에 저장되어잇는 수만큼 반복하여 shop를 삭제한다.
		for(Integer deleteShop : deleteShopNoList){
			service.dropShop(deleteShop);
		}
		
		//4. 삭제처리 완료후 매장 삭제 페이지로 이동(매장이 삭제되었는지 확인.)
		response.sendRedirect(request.getContextPath()+"/company/deleteShop");
	}
	
	@RequestMapping("/dropShop/{shopNo}")
	public ModelAndView dropShop(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("shopNo") Integer shopNo) throws IOException{
		//로그인 확인처리
		if (!CompanyController.authAndRedirect(request, response)) {
			return null;
		}
		
		RestaurantVO shopInfo = service.shopInfo(shopNo);
		if(shopInfo.getIs_manage()=='o'){
			
			service.dropShop(shopNo);
			//해당페이지로 이동
			response.sendRedirect(request.getContextPath()+"/company/myShopList");			
			return null;
			
		}else{ //매장이 삭제 되었을 때 에러페이지 처리
			return new DeleteFunctionError().restaurant();
		}
	}
	
}