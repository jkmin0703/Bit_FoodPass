package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.codehaus.jackson.map.util.JSONPObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mrkimfood.gonggam.service.FoodMenuService;
import com.mrkimfood.gonggam.service.RestaurantService;
import com.mrkimfood.gonggam.util.DeleteFunctionError;
import com.mrkimfood.gonggam.vo.FoodClassifyVO;
import com.mrkimfood.gonggam.vo.FoodMenuImageVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.RestaurantVO;

@Controller
@RequestMapping("/company")
public class FoodMenuController {

	@Inject	private FoodMenuService service;
	@Inject private RestaurantService restaurantService;
	
	//메뉴관리
		@RequestMapping(value="/foodMenu/registerMenu")
		public ModelAndView registerMenuForm(HttpServletRequest request, HttpServletResponse response,
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
			
			List<FoodClassifyVO> menuCatagoryList = service.menuCatagoryBarList(shopNo);
			
			//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
			String checkSideBar = "myFoodMenu";
			
			Map<String,Object> models = new HashMap<String, Object>();
			models.put("shopNo", shopNo);
			models.put("shopInfo", shopInfo);
			models.put("selectBarList", selectBarList);
			models.put("menuCatagoryList", menuCatagoryList);
			models.put("checkSideBar", checkSideBar);
			
			return  new ModelAndView("/company/menu/registerMenu", "models", models);
		}
		
		@RequestMapping(value="/foodMenu/registerMenu", method=RequestMethod.POST)
		public ModelAndView registerMenu(HttpServletRequest request, HttpServletResponse response,
				@RequestParam Integer shopNo, @ModelAttribute FoodMenuVO foodMenuVO) throws IOException{
					//로그인 확인처리
					if (!CompanyController.authAndRedirect(request, response)) {
						return null;
					}
					
					Map<String,Object> models = new HashMap<String, Object>();
					RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);
					
					foodMenuVO.setRestaurant_ID(shopNo);
					models.put("shopNo", shopNo);
					
					boolean imgEmpty = true;	// 파일 유무 판단.(파일이 있으면 false, 없으면 true)
					for(MultipartFile mf : foodMenuVO.getUploadFileImg()){
						if(!mf.isEmpty()){
							imgEmpty = false;
						}
					}
					
					if(! imgEmpty){ // 파일이 있는가?
						String imageSavePath=request.getSession().getServletContext().getRealPath("/WEB-INF/view/img/menu/"); //이미지 저장 path
						service.registerMenu(foodMenuVO, imageSavePath);
					}else{
						service.registerMenu(foodMenuVO);
					}
					
					//해당페이지로 이동
					response.sendRedirect(request.getContextPath()+"/company/foodMenu/registerMenu");
					return null;
		}

		@RequestMapping(value="/foodMenu/foodMenuList")
		public ModelAndView foodMenuListForm(HttpServletRequest request, HttpServletResponse response,
				@RequestParam(required=false) Integer shopNo, @RequestParam(required=false) Integer catagoryNo,
				@RequestParam(required=false, defaultValue="1") Integer page,
				@RequestParam(required=false, defaultValue="8") Integer pageColumnSize) throws IOException{
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
			List<FoodClassifyVO> menuCatagoryList = service.menuCatagoryBarList(shopNo);
			
			//1. 한 페이지에서 보여줄 메뉴정보 List를 갖고온다.(조건에 해당하는 메뉴정보.)
			//페이징 List 처리에 필요한 정보들..
			Map<String, Object> inputMap = new HashMap<String, Object>();
			inputMap.put("page", page);
			inputMap.put("pageColumnSize", pageColumnSize);
			inputMap.put("shopId", shopNo);
			inputMap.put("categoryNo", catagoryNo);
			List<FoodMenuVO> foodMenuList= service.foodMenuList(inputMap);
			
			//2. 추출한 메뉴가 이미지를 포함하고 있는지 확인한다.
			for(int i=0;i<foodMenuList.size();i++){
				Integer menuFoodId = foodMenuList.get(i).getFood_ID();
				Integer ImgCount = service.foodMenuImgCount(menuFoodId);
				//3. 이미지가 있다면 foodMenuVo에 이미지 정보를 추가시킨다.
				if(ImgCount == 1){
					foodMenuList.get(i).setFoodMenuImage(service.selectFoodImage(menuFoodId));
				}
			}
			
			//페이징 관련 정보 Map
			Map<String, Object> pagingInfo = new HashMap<String, Object>();
			Integer totalMenuCount = service.getFoodMenuCount(shopNo);	//해당 관리자가 관리하는 총 Menu의 개수를 갖고온다.
			Integer pageMenuSize = pageColumnSize;	// 한페이지에서 보여지는 Menu의 개수
			Integer pageNav = page;	//현제 페이지 위치
			Integer pageListCount = 5;	//한 블럭당 나타내 주는 페이지 개수
			Integer totalPage = (totalMenuCount/pageMenuSize) +1;	//총 페이지 개수
			if(totalMenuCount % pageMenuSize == 0){
				totalPage = totalMenuCount / pageMenuSize;
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
			
			pagingInfo.put("totalMenuCount", totalMenuCount);
			pagingInfo.put("pageMenuSize", pageMenuSize);
			pagingInfo.put("pageNav", pageNav);
			pagingInfo.put("pageListCount", pageListCount);
			pagingInfo.put("totalPage", totalPage);
			pagingInfo.put("blockNav", blockNav);
			pagingInfo.put("totalBlock", totalBlock);
			pagingInfo.put("startPage", startPage);
			pagingInfo.put("endPage", endPage);

			System.out.println("메뉴리스트 개수:"+foodMenuList.size());
			
			//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
			String checkSideBar = "myFoodMenu";
			
			//최종 출력 Map
			Map<String,Object> models = new HashMap<String, Object>();
			models.put("shopNo", shopNo);
			models.put("catagoryNo", catagoryNo); //값이 없으면 무조껀 null을 반환
			models.put("shopInfo", shopInfo);
			models.put("selectBarList", selectBarList);
			models.put("menuCatagoryList", menuCatagoryList);
			models.put("foodMenuList", foodMenuList);
			models.put("pagingInfo", pagingInfo);
			models.put("checkSideBar", checkSideBar);
			
			return  new ModelAndView("/company/menu/foodMenuList", "models", models);
		}
		
		@RequestMapping(value="/myShop/{shopNo}/foodMenuInfo/{foodNo}")
		public ModelAndView foodMenuInfo(HttpServletRequest request, HttpServletResponse response,
				@PathVariable("shopNo") Integer shopNo, @PathVariable("foodNo") Integer foodNo) throws IOException{
			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return null;
			}
			
			Map<String,Object> models = new HashMap<String, Object>();
			RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);
			
			FoodMenuVO foodMenuInfo = service.foodMenuInfo(foodNo);
			List<FoodClassifyVO> menuCatagoryList = service.menuCatagoryBarList(shopNo);
			
			for(FoodClassifyVO fcvo: menuCatagoryList){
				System.out.println(fcvo.getRestaurantId()+"/"+fcvo.getFoodClassifyName());
			}
			//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
			String checkSideBar = "myFoodMenu";
			
			models.put("shopNo", shopNo);
			models.put("foodNo", foodNo);
			models.put("foodMenuInfo", foodMenuInfo);
			models.put("menuCatagoryList", menuCatagoryList);
			List<FoodMenuImageVO> foodImageList = service.foodImageList(foodNo);
			models.put("foodImageList", foodImageList);
			models.put("checkSideBar", checkSideBar);
			
			return new ModelAndView("/company/menu/foodMenuInfo", "models", models);
		}
		
		
		@RequestMapping(value="/myShop/{shopNo}/foodMenuInfo/{foodNo}/modifyMenu")
		public ModelAndView modifyMenuForm(HttpServletRequest request, HttpServletResponse response,
				@PathVariable("shopNo") Integer shopNo, @PathVariable("foodNo") Integer foodNo) throws IOException{
			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return null;
			}
			
			Map<String,Object> models = new HashMap<String, Object>();
			RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);
			
			FoodMenuVO foodMenuInfo = service.foodMenuInfo(foodNo);
			List<FoodClassifyVO> menuCatagoryList = service.menuCatagoryBarList(shopNo);
			
			for(FoodClassifyVO fcvo: menuCatagoryList){
				System.out.println(fcvo.getRestaurantId()+"/"+fcvo.getFoodClassifyName());
			}
			
			//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
			String checkSideBar = "myFoodMenu";
			
			models.put("shopNo", shopNo);
			models.put("foodNo", foodNo);
			models.put("foodMenuInfo", foodMenuInfo);
			models.put("menuCatagoryList", menuCatagoryList);
			List<FoodMenuImageVO> foodImageList = service.foodImageList(foodNo);
			models.put("foodImageList", foodImageList);
			models.put("checkSideBar", checkSideBar);
			
			return new ModelAndView("/company/menu/modifyFoodMenu","models",models);
		}
		
		@RequestMapping(value="/myShop/{shopNo}/foodMenuInfo/{foodNo}/modifyMenu", method=RequestMethod.POST)
		public ModelAndView modifyMenu(HttpServletRequest request, HttpServletResponse response,
				@PathVariable("shopNo") Integer shopNo, @PathVariable("foodNo") Integer foodNo,
				@ModelAttribute FoodMenuVO foodMenuVO, @RequestParam Character hasImageType) throws IOException{
			
			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return null;
			}
			
			RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);
			if(shopInfo.getIs_manage()=='o'){
			
				FoodMenuVO foodMenuInfo = service.foodMenuInfo(foodNo);
				if(foodMenuInfo.getIsuse_food() == 'o'){
					//메뉴정보 VO에 shopNo와 foodNo를 입력 
					foodMenuVO.setFood_ID(foodNo);
					foodMenuVO.setRestaurant_ID(shopNo);
					//파일 저장 경로
					String imageSavePath=request.getSession().getServletContext().getRealPath("/WEB-INF/view/img/menu/");
					//메뉴를 수정한다.
					service.modifyFoodMenu(foodMenuVO, hasImageType, imageSavePath);
					response.sendRedirect(request.getContextPath()+"/company/myShop/"+shopNo+"/foodMenuInfo/"+foodNo);
					return null;
				}else{ //메뉴가 삭제 되었을 때 에러페이지 처리
					return new DeleteFunctionError().foodMenu(shopNo);
				}
			}else{ //매장이 삭제 되었을 때 에러페이지 처리
				return new DeleteFunctionError().restaurant();
			}
			
		}
		
		@RequestMapping(value="/myShop/{shopNo}/foodMenuInfo/{foodNo}/deleteMenu")
		public ModelAndView deleteMenu(HttpServletRequest request, HttpServletResponse response,
				@PathVariable("shopNo") Integer shopNo, @PathVariable("foodNo") Integer foodNo) throws IOException{
			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return null;
			}
			
			RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);
			if(shopInfo.getIs_manage()=='o'){
				
				FoodMenuVO foodMenuInfo = service.foodMenuInfo(foodNo);
				if(foodMenuInfo.getIsuse_food() == 'o'){
					
					service.deleteFoodMenu(foodNo);
					response.sendRedirect(request.getContextPath()+"/company/foodMenu/foodMenuList");
					return null;
					
				}else{ //메뉴가 삭제 되었을 때 에러페이지 처리
					return new DeleteFunctionError().foodMenu(shopNo);
				}
			}else{ //매장이 삭제 되었을 때 에러페이지 처리
				return new DeleteFunctionError().restaurant();
			}
		}
		
		@RequestMapping("/foodMenu/catagory")
		public ModelAndView menuCatagoryForm(HttpServletRequest request, HttpServletResponse response,
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
			
			List<FoodClassifyVO> menuCatagoryList = service.menuCatagoryBarList(shopNo);
			
			//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
			String checkSideBar = "myFoodMenu";
			
			Map<String,Object> models = new HashMap<String, Object>();
			models.put("shopNo", shopNo);
			models.put("shopInfo", shopInfo);
			models.put("selectBarList", selectBarList);
			models.put("menuCatagoryList", menuCatagoryList);
			models.put("checkSideBar", checkSideBar);
			
			return  new ModelAndView("/company/menu/menuCatagoryPlusMinus", "models", models);
		}
		
		
		@RequestMapping(value="/foodMenu/catagory/register", method=RequestMethod.POST)
		public void registerMenuCatagory(HttpServletRequest request, HttpServletResponse response,
				@RequestParam Integer shopNo, @ModelAttribute FoodClassifyVO foodClassifyVO) throws IOException{

			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return;
			}
			
			//메뉴 카테고리를 추가하여 상태값을 반환받는다.(0:성공, 1:값 존재, 2:실패)
			Integer hasFoodClassify =service.addFoodClassify(foodClassifyVO.getFoodClassifyName(), shopNo);
			
			//회원탈퇴 여부 판단 메세지
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			
			switch (hasFoodClassify) {
				case 0:{ // 성공
					PrintWriter writer = response.getWriter();
					writer.append("<!DOCTYPE html>");
					writer.append("<html>");
					writer.append("<head>");
					writer.append("<script type='text/javascript'>");
					writer.append("alert('메뉴 카테고리가 추가되었 습니다.');");
					writer.append("location.href='"+request.getContextPath()+"/company/foodMenu/catagory'");
					writer.append("</script>");
					writer.append("</head>");
					writer.append("<body>");
					writer.append("</body>");
					writer.append("</html>");
					writer.close();
				}break;
				case 1:{ //값이 존재.
					PrintWriter writer = response.getWriter();
					writer.append("<!DOCTYPE html>");
					writer.append("<html>");
					writer.append("<head>");
					writer.append("<script type='text/javascript'>");
					writer.append("alert('죄송합니다.\n 추가하려는 카테고리가 이미 존재합니다.');");
					writer.append("location.href='"+request.getContextPath()+"/company/foodMenu/catagory'");
					writer.append("</script>");
					writer.append("</head>");
					writer.append("<body>");
					writer.append("</body>");
					writer.append("</html>");
					writer.close();
				}break;
				
				default: break;
			}
		}
		
		@RequestMapping(value="/foodMenu/catagory/delete", method=RequestMethod.POST)
		public void deleteMenuCatagory(HttpServletRequest request, HttpServletResponse response,
				@RequestParam Integer shopNo, @ModelAttribute FoodClassifyVO foodClassifyVO) throws IOException{

			//로그인 확인처리
			if (!CompanyController.authAndRedirect(request, response)) {
				return;
			}
			
			System.out.println("shopNo:"+shopNo);
			System.out.println(foodClassifyVO.getFoodClassifyId());
			
			service.deleteFoodMenuCatagory(foodClassifyVO.getFoodClassifyId());
			
			response.sendRedirect(request.getContextPath()+"/company/foodMenu/catagory");
			
		}
		
		/*hsw modify*/
		@RequestMapping("/myShop/{shopNo}/menuListRsp")
		public @ResponseBody String menuListRsp(HttpServletRequest request,
				HttpServletResponse response,
				@PathVariable("shopNo") Integer shopNo,
				@RequestParam(required=false) String callback) throws JsonGenerationException, JsonMappingException, IOException {

			JSONPObject obj = null;
			
			Map<Integer, Object> menuMap = new Hashtable<Integer, Object>();
			List<FoodClassifyVO> foodClassifyVOs = service.getFoodClassifyList(shopNo);
			
			System.out.println("foodClassifyVOs.size() = " + foodClassifyVOs.size());
			
			for (int i = 0; i < foodClassifyVOs.size(); i++) {
				FoodClassifyVO foodClassifyVO = foodClassifyVOs.get(i);
				Integer classifyId = foodClassifyVO.getFoodClassifyId();
				String classifyName = foodClassifyVO.getFoodClassifyName();
				
				Map<String, Object> dumb = new Hashtable<String, Object>();
				
				List<FoodMenuVO> foodMenuVOs = service.getFoodMenuListForClassify(shopNo, classifyId);
				
				for (int j = 0; j < foodMenuVOs.size(); j++) {
					FoodMenuVO foodMenuVO = foodMenuVOs.get(j);
					List<FoodMenuImageVO> foodMenuImageVOs = service.foodImageList(foodMenuVO.getFood_ID());
					if (foodMenuImageVOs.size() != 0) {
						String path = foodMenuImageVOs.get(0).getSave_imageName();
						foodMenuVOs.get(j).setFoodImgPath(path);
					}
				}
				
				dumb.put("categoryId", classifyId);
				dumb.put("categoryName", classifyName);
				dumb.put("menu", foodMenuVOs);
				
				menuMap.put(i, dumb);
			}
			
			obj = new JSONPObject(callback, menuMap);
			
			ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
			String json = ow.writeValueAsString(obj);
			
			System.out.println(json);
			
			return json;
			
			/*PrintWriter writer = response.getWriter();
			writer.append(json);*/
		}
		
}






















