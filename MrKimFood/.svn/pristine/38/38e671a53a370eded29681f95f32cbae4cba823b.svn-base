package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mrkimfood.gonggam.service.RestaurantService;
import com.mrkimfood.gonggam.service.TableService;
import com.mrkimfood.gonggam.util.DeleteFunctionError;
import com.mrkimfood.gonggam.vo.RestaurantVO;
import com.mrkimfood.gonggam.vo.TableVO;

@Controller
@RequestMapping("/company/table")
public class TableController {

		@Inject	private TableService service;
		@Inject private RestaurantService restaurantService;
		
		
		@RequestMapping("/registerTable")
		public ModelAndView registerTableForm(HttpServletRequest request, HttpServletResponse response,
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
			
			List<RestaurantVO> selectBarList = restaurantService.selectBarList(memberNo);
			RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);		//가계정보VO
			
			//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
			String checkSideBar = "myTable";
			
			Map<String,Object> models = new HashMap<String, Object>();
			models.put("shopNo", shopNo);
			models.put("shopInfo", shopInfo);
			models.put("selectBarList", selectBarList);
			models.put("checkSideBar", checkSideBar);
			
			
			return  new ModelAndView("/company/table/registerTable", "models", models);
		}
		
		@RequestMapping(value="/registerTable", method=RequestMethod.POST)
		public ModelAndView registerTable(HttpServletRequest request, HttpServletResponse response,
				@RequestParam(required=false) Integer shopNo, @RequestParam(required=false) Integer tableCount) throws IOException{
			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return null;
			}
			
			//현제 로그인 되어있는 회원의 회원번호를 받아온다.
			Integer memberNo = CompanyController.getLoginMember(request);
			
			//매장번호, 입력받은 테이블 개수를 사용하여 테이블을 생성
			service.makeTable(shopNo,tableCount);
			
			if(shopNo ==  restaurantService.selectMaxShop(memberNo)){
				response.sendRedirect(request.getContextPath()+"/company/table/tableList");
			}
			else{
				response.sendRedirect(request.getContextPath()+"/company/table/tableList?shopNo="+shopNo);
			}
			
			return null;
		}
		
		@RequestMapping(value="/tableList")
		public ModelAndView tableListForm(HttpServletRequest request, HttpServletResponse response,
				@RequestParam(required=false) Integer shopNo,
				@RequestParam(required=false, defaultValue="1") Integer page,
				@RequestParam(required=false, defaultValue="10") Integer pageColumnSize) throws IOException{
			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return null;
			}
			
			//현제 로그인 되어있는 회원의 회원번호를 받아온다.
			Integer memberNo = CompanyController.getLoginMember(request);
			if(shopNo == null){ //샵 번호를 받지 않을 경우 제일 큰 샵 번호를 DB에서 찾아서 넘겨준다.
				shopNo = restaurantService.selectMaxShop(memberNo);
			}
			
			
			List<RestaurantVO> selectBarList = restaurantService.selectBarList(memberNo);
			RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);
			
			System.out.println(shopNo);
			
			//페이징 List 처리에 필요한 정보들..
			Map<String, Object> inputMap = new HashMap<String, Object>();
			inputMap.put("page", page);
			inputMap.put("pageColumnSize", pageColumnSize);
			inputMap.put("shopId", shopNo);
			
			//1. 페이지 영역에 해당하는 테이블 리스트를 갖고 온다.
			List<TableVO> tableList = service.selectTableList(inputMap);
			
			System.out.println(service.getTableCount(shopNo));
			
			//페이징 관련 정보 Map
			Map<String, Object> pagingInfo = new HashMap<String, Object>();
			Integer totalTableCount = service.getTableCount(shopNo);	//해당 관리자가 관리하는 총 shop의 개수를 갖고온다.
			Integer pageTableSize = pageColumnSize;	// 한페이지에서 보여지는 매장의 개수
			Integer pageNav = page;	//현제 페이지 위치
			Integer pageListCount = 5;	//한 블럭당 나타내 주는 페이지 개수
			Integer totalPage = (totalTableCount/pageTableSize) +1;	//총 페이지 개수
			if(totalTableCount % pageTableSize == 0){
				totalPage = totalTableCount / pageTableSize;
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
			
			pagingInfo.put("totalTableCount", totalTableCount);
			pagingInfo.put("pageTableSize", pageTableSize);
			pagingInfo.put("pageNav", pageNav);
			pagingInfo.put("pageListCount", pageListCount);
			pagingInfo.put("totalPage", totalPage);
			pagingInfo.put("blockNav", blockNav);
			pagingInfo.put("totalBlock", totalBlock);
			pagingInfo.put("startPage", startPage);
			pagingInfo.put("endPage", endPage);
			
			//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
			String checkSideBar = "myTable";
			
			Map<String, Object> models = new HashMap<String, Object>();
			models.put("shopNo", shopNo);
			models.put("shopInfo", shopInfo);
			models.put("selectBarList", selectBarList);
			models.put("tableList", tableList);
			models.put("pagingInfo", pagingInfo);
			models.put("checkSideBar", checkSideBar);
			
			return new ModelAndView("/company/table/tableList", "models", models);
		}
		
}
