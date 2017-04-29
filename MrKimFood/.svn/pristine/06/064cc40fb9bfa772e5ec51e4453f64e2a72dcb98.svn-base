package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.brm.mybatis.MyBatisSupport;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mrkimfood.gonggam.service.FoodMenuService;
//import com.mrkimfood.gonggam.service.IndividualService;
import com.mrkimfood.gonggam.service.OrderService;
import com.mrkimfood.gonggam.service.RestaurantService;
import com.mrkimfood.gonggam.service.TableService;
import com.mrkimfood.gonggam.util.DeleteFunctionError;
import com.mrkimfood.gonggam.util.DummyData;
import com.mrkimfood.gonggam.util.InputData;
import com.mrkimfood.gonggam.util.OrderInfo;
import com.mrkimfood.gonggam.util.UseJson;
//import com.mrkimfood.gonggam.vo.CompanyVO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.OrderDetailVO;
import com.mrkimfood.gonggam.vo.OrderManageVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;
import com.mrkimfood.gonggam.vo.RestaurantVO;


@Controller
@RequestMapping("/order")
public class OrderController extends MyBatisSupport {
	
//	@Inject private IndividualService individualService;
	@Inject	private OrderService orderService;
	@Inject	private RestaurantService restaurantService;
	@Inject	private TableService tableService;
	@Inject	private FoodMenuService foodMenuService;
		
	@ResponseBody
	@RequestMapping(value = "rsp/{shopId}/orderInfoJson/{tableId}", produces="application/json;charset=UTF-8")
	public String RcvOrderInfo(HttpServletRequest request, HttpServletResponse response,
			@PathVariable("shopId") Integer shopNo,
			@PathVariable("tableId") Integer tableNo,
			@RequestParam(value="data", required=false) String encData,
			@RequestParam String callback) throws JsonGenerationException, JsonMappingException, IOException {
		
		String jsonData = URLDecoder.decode(encData, "UTF-8");
		
		System.out.println("jsondata = " + jsonData);
		
		Gson gson = new Gson();
		Type type = new TypeToken<List<OrderInfo>>(){}.getType();
		List<OrderInfo> orderMenuVOs = gson.fromJson(jsonData, type);
		
		OrderManageVO orderManageVO = new OrderManageVO();
		orderManageVO.setPaymentWay('c');
		orderManageVO.setRestaurantId(shopNo);
		orderManageVO.setTableId(tableNo);
		orderManageVO.setWhetherPayment('o');
		
		orderService.creationOrderId(orderManageVO);
		List<OrderDetailVO> orderDetailVOs = new ArrayList<OrderDetailVO>();
		
		for (int i = 0; i < orderMenuVOs.size(); i++) {
			OrderMenuVO orderMenuVO = new OrderMenuVO();
			orderMenuVO.setOrderId(orderManageVO.getOrderId());
			orderMenuVO.setFoodId(orderMenuVOs.get(i).getFoodId());
			orderMenuVO.setIsSupply("x");
			orderMenuVO.setNum(i);
			orderMenuVO.setCount(orderMenuVOs.get(i).getQuantity());	
			Integer foodId = orderMenuVO.getFoodId();
			FoodMenuVO foodMenuVO = foodMenuService.foodMenuInfo(foodId);
			
			orderService.addMenu(orderMenuVO);
			
			OrderDetailVO orderDetailVO = new OrderDetailVO();
			orderDetailVO.setOrderId(orderManageVO.getOrderId());
			orderDetailVO.setTableNo(tableNo);
			orderDetailVO.setRestaurantName(restaurantService.inquiryRestaurantName(shopNo));
			orderDetailVO.setOrderFoodName(foodMenuVO.getFood_name());
			orderDetailVO.setPay(foodMenuVO.getPay());
			orderDetailVO.setOrderQuantity(orderMenuVO.getCount());
			orderDetailVO.setOrderDay(orderManageVO.getOrderDay());
			orderDetailVO.setOrderTime(orderManageVO.getOrderTime());
			orderDetailVO.setOrderStanby(0);
			orderDetailVO.setIsSupply(orderMenuVO.getIsSupply());
			orderDetailVO.setNum(orderMenuVO.getNum());
			orderDetailVOs.add(orderDetailVO);
		}
		
		return callback + "({\"code\":0,\"message\":\"Success\"})";
	}
	
	@MessageMapping("/add")
    @SendTo("/topic/updateOrder")
	public DummyData RealTimeOrderList(InputData data) {
		
		System.out.println(data.getStr1() + ", " + data.getStr2());
		
		return new DummyData("mission success");
	}
	
	@RequestMapping(value="/orderList", method=RequestMethod.GET)
	public ModelAndView orderListForm(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required=false) Integer shopNo) throws IOException {

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
		
		
		//상원이형 소스
		/*HttpSession session = request.getSession();
		
		CompanyVO companyVO = (CompanyVO)session.getAttribute("member");*/
		System.out.println("OrderController - orderList");
		
		Map<String, Object> orders = new Hashtable<String, Object>();
		List<OrderDetailVO> orderDetailVOs = new ArrayList<OrderDetailVO>();		
		List<OrderManageVO> orderManageVOs = orderService.selectAllManage(shopNo);
		Integer orderStanby = 0;
		
		String restaurantName = restaurantService.inquiryRestaurantName(shopNo);
		orders.put("shopNo", shopNo);
		orders.put("restaurantName", restaurantName);
		
		System.out.println("orderManageVOs.size() = " + orderManageVOs.size());
		
		for (int i = 0; i < orderManageVOs.size(); i++) {
			
			Integer orderId = orderManageVOs.get(i).getOrderId();
			
			System.out.println("orderId = " + orderId);
			
			List<OrderMenuVO> orderMenuVOs = orderService.selectIdAllMenu(orderId);
			int tableNo = tableService.inquiryTableNo(orderManageVOs.get(i).getTableId());
			
			for (int j = 0; j < orderMenuVOs.size(); j++) {
				System.out.println("테이블 번호 = " + tableNo + ", orderId = " + orderId + ", 주문날짜 = " + orderManageVOs.get(i).getOrderDay() + 
						", 주문시간 = " + orderManageVOs.get(i).getOrderTime());
				Integer foodId = orderMenuVOs.get(j).getFoodId();
				
				System.out.print("	foodid = " + foodId);
				FoodMenuVO foodMenuVO = foodMenuService.foodMenuInfo(foodId);
				
				if (foodMenuVO != null) {
					System.out.print("	foodid = " + foodId);
					System.out.println(", foodName = " + foodMenuVO.getFood_name() + ", pay = " + foodMenuVO.getPay() +
							", 수량 = " + orderMenuVOs.get(j).getCount() + ", 대기순번 = " + orderStanby + 
							", 음식제공여부 = " + orderMenuVOs.get(j).getIsSupply() + ", 번호 = " + orderMenuVOs.get(j).getNum());
					
					OrderDetailVO orderDetailVO = new OrderDetailVO();
					orderDetailVO.setOrderId(orderId);
					orderDetailVO.setTableNo(tableNo);
					orderDetailVO.setRestaurantName(restaurantService.inquiryRestaurantName(shopNo));
					orderDetailVO.setOrderFoodName(foodMenuVO.getFood_name());
					orderDetailVO.setPay(foodMenuVO.getPay());
					orderDetailVO.setOrderQuantity(orderMenuVOs.get(j).getCount());
					orderDetailVO.setOrderDay(orderManageVOs.get(i).getOrderDay());
					orderDetailVO.setOrderTime(orderManageVOs.get(i).getOrderTime());
					orderDetailVO.setOrderStanby(orderStanby);
					orderDetailVO.setIsSupply(orderMenuVOs.get(j).getIsSupply());
					orderDetailVO.setNum(orderMenuVOs.get(j).getNum());
					orderDetailVOs.add(orderDetailVO);
					
					orderStanby++;
					System.out.println("orderStanby = " + orderStanby);
				}
				
//				orderStanby++;
//				System.out.println("orderStanby = " + orderStanby);
			}
			
		}
		
		orders.put("pOrderInfos", orderDetailVOs);
		//Open되야 하는 sideBar 데이터(FPsideBar에서 사용)
		String checkSideBar = "myOrder";
				
		Map<String,Object> models = new HashMap<String, Object>();
		models.put("shopNo", shopNo);
		models.put("shopInfo", shopInfo);
		models.put("selectBarList", selectBarList);
		models.put("orders", orders);
		models.put("checkSideBar", checkSideBar);
		
		return new ModelAndView("/order/orderList11", "models", models);
	}
	
	@RequestMapping(value="/orderList/{shopId}", method=RequestMethod.POST)
	public ModelAndView supplyOrderFood(HttpServletRequest request,	HttpServletResponse response,
			@PathVariable("shopId") Integer shopNo,
			@RequestParam(value="isSupply", required=true) List<String> values,
			@RequestParam(value="orderId", required=true) List<Integer> orderId,
			@RequestParam(value="num", required=true) List<Integer> num) throws IOException {
		RestaurantVO shopInfo = restaurantService.shopInfo(shopNo);
		if(shopInfo.getIs_manage()=='o'){
			
			int i = 0;
			for (String  value : values) {
				if (value.equals("o")) {
					System.out.println("index = " + i + " = " + value);
					System.out.println("orderId = " + orderId.get(i));
					System.out.println("num = " + num.get(i));
					orderService.updateFoodSupplyStatus(orderId.get(i), num.get(i), "o");
				}
				i++;
			}
			response.sendRedirect(request.getContextPath()+"/order/orderList?shopNo=" + shopNo);
			return null;
			
		}else{//매장이 삭제 되었을 때 에러페이지 처리
			return new DeleteFunctionError().restaurant();
		}
		
	}
	
	@RequestMapping(value="/json/orderFood", method={RequestMethod.GET, RequestMethod.POST})
	public void receiveOrderFood(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam String data) throws IOException {
		
		response.setContentType("application/json");
		
		Gson gson = new Gson();
		
		String json = data;
		System.out.println("json data: \n" + json);
		
		String callback = (String) request.getParameter("callback");
		
		System.out.println("callback: " + callback);

		List<String> keys = UseJson.jsonToMapKeys(json);
		
		for (String key : keys) {
			String jsonData = UseJson.mapDataToJson(json, key);
			System.out.println(jsonData);
			if (key.endsWith("Obj")) {
				System.out.println("start obj");
//				OrderManageVO orderManageVO = gson.fromJson(jsonData, OrderManageVO.class);
//				System.out.println("Obj = " + orderManageVO.getPhoneNum());
			} else if (key.endsWith("List")) {
				System.out.println("start List");
				Type type = new TypeToken<List<OrderMenuVO>>(){}.getType();
		    	List<OrderMenuVO> orderMenuVOs = gson.fromJson(jsonData, type);
		    	System.out.println("List = " + orderMenuVOs.get(0).getFoodId());
			}
		}
		
		PrintWriter writer = response.getWriter();
		writer.append(callback + "({\"code\":0,\"message\":\"Success\"})");
		writer.flush();
	}
	
}
