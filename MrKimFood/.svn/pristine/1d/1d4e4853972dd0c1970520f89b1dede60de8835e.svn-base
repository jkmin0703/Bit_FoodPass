package com.mrkimfood.gonggam.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mrkimfood.gonggam.dao.OrderMenuDAO;
import com.mrkimfood.gonggam.dao.RestaurantDAO;
import com.mrkimfood.gonggam.dao.SalesDAO;
import com.mrkimfood.gonggam.vo.FoodMenuVO;
import com.mrkimfood.gonggam.vo.OrderMenuVO;
import com.mrkimfood.gonggam.vo.SalesVO;

@Service
public class SalesServiceImpl implements SalesService {
	
	@Inject private SalesDAO dao;
	
	@Override
	public Map<String, Object> totalSalesPayToday(Integer shopNo){
		Integer totalSalesPay = 0;
		String toDayStr = dao.selectToday();
		List<String> salesMenuList = new ArrayList<String>();
		List<Integer> salesPayList = new ArrayList<Integer>();
		
		 // 오늘 날짜에 해당 shop의 주문 내역이 있는지 확인한다.
		List<Integer> orderNoList =dao.selectOrderListToday(shopNo);
		
		//▶테스트 코드
		System.out.println("orderNo");
		for(Integer orderNo:orderNoList){
			System.out.println(orderNo);
		}
		System.out.println("-------------------");
		
		
		if(orderNoList.size() ==0){ //주문 내역이 없을 경우 0원을 리턴해 준다.
			Map<String, Object> salesInfoMap = new HashMap<String, Object>();
			salesInfoMap.put("today", toDayStr);
			salesInfoMap.put("totalSalesPay", totalSalesPay);
			salesInfoMap.put("salesMenuList", salesMenuList);
			salesInfoMap.put("salesPayList", salesPayList);
			
			return salesInfoMap;
		}else{	// 주문 내역이 있을경우 다음과 같은 알고리즘에 따라 처리한다.
			
			// 주문 내역에 해당하는 주문메뉴List를 가지고 온다.(= List<OrderMenuVO>)
			List<OrderMenuVO> todayOrderList =  dao.selectOrderMenuListToday(orderNoList);
			
			//▶테스트 코드
			System.out.println("주문 내역에 해당하는 주문메뉴List");
			for(OrderMenuVO todayOrder:todayOrderList){
				System.out.println(todayOrder.getOrderId()+"/"+todayOrder.getFoodId()+"/"+todayOrder.getCount());
			}
			System.out.println("-------------------");
			
			
			// 음식점에 해당하는 음식메뉴 List를 갖고 온다.
			List<FoodMenuVO> shopFoodMenuList = dao.selectShopFoodMenuList(shopNo);
			
			//▶테스트 코드
			System.out.println(" 음식메뉴 List");
			for(FoodMenuVO foodMenu: shopFoodMenuList){
				System.out.println(foodMenu.getFood_ID()+"/"+foodMenu.getRestaurant_ID()+"/"+
						foodMenu.getFood_type()+"/"+foodMenu.getFood_name()+"/"+foodMenu.getPay());
				System.out.println("foodType= Null?: "+(foodMenu.getFood_type()==null));
			}
			System.out.println("-------------------");
			
			
			
			// (★★ 5개)  금일 매출정보를 담고있는 salesList
			List<SalesVO> todaySalesList = new ArrayList<SalesVO>();
			
			//salesList를 구하는 알고리즘
			for(OrderMenuVO orderMenu: todayOrderList){
				for(FoodMenuVO shopFoodMenu :shopFoodMenuList){
					
					//1. 주문한 메뉴를 음식점 메뉴 리스트에서 찾는다.
					if(orderMenu.getFoodId() == shopFoodMenu.getFood_ID()){ 
						
						//2.선택된 메뉴가 SalesList에 등록 되어있는가?
						boolean isShopMenu = false;
						for(SalesVO salesInfo : todaySalesList){
							if(salesInfo.getFood_ID() == shopFoodMenu.getFood_ID()){
								
								isShopMenu = true;
								break;
							}
						}
						
						//2.1 메뉴정보가 salesList에 등록되지 않았다면 메뉴정보를 등록시킨다.
						if(isShopMenu == false){ 
							SalesVO salesInfo = new SalesVO();
							salesInfo.setFood_ID(shopFoodMenu.getFood_ID());
							salesInfo.setCategory(shopFoodMenu.getFood_type());
							salesInfo.setSubCategory(shopFoodMenu.getFood_name());
							salesInfo.setPay(0);
							todaySalesList.add(salesInfo);
						}
						
						//3. 주문내역 단위의 가격을 계산한다.
						Integer orderPay = shopFoodMenu.getPay() * orderMenu.getCount();
						
						//4. 계산한 금액을 salesList의 pay에 더한다.
						for(SalesVO salesInfo : todaySalesList){
							if(salesInfo.getFood_ID() == shopFoodMenu.getFood_ID()){
								Integer salesPay = salesInfo.getPay() + orderPay;
								salesInfo.setPay(salesPay);
							}
						}
						
					}
				}
			}
			
			//▶테스트 데이터
			for(SalesVO salesInfo : todaySalesList){
				System.out.println(salesInfo.getCategory()+"/"+salesInfo.getSubCategory()+"/"+salesInfo.getPay());
			}
			for(SalesVO salesData : todaySalesList){
				salesMenuList.add(salesData.getSubCategory());
				salesPayList.add(salesData.getPay());
				totalSalesPay += salesData.getPay();
			}
			
			//메뉴List의 내용을 javascript의 String 배열 형태로 변환
			StringBuilder menuListStr = new StringBuilder("[");
			for(int i=0;i<salesMenuList.size();i++){
				menuListStr.append("\'"+salesMenuList.get(i)+"\'");
				if( i != (salesMenuList.size()-1) ){
					menuListStr.append(",");
				}
			}
			menuListStr.append("]");
			
			
			Map<String, Object> salesInfoMap = new HashMap<String, Object>();
			salesInfoMap.put("today", toDayStr);
			salesInfoMap.put("totalSalesPay", totalSalesPay);
			salesInfoMap.put("salesMenuList", menuListStr.toString());
			salesInfoMap.put("salesPayList", salesPayList.toString());
			
			return salesInfoMap;
		}

	}
	
	@Override
	public Map<String, Object> categorySalesPayToday(Integer shopNo){
		Integer totalSalesPay = 0;
		
		 // 오늘 날짜에 해당 shop의 주문 내역이 있는지 확인한다.
		List<Integer> orderNoList =dao.selectOrderListToday(shopNo);
		String salesPieChartData = "";
		
		if(orderNoList.size() ==0){ //주문 내역이 없을 경우 0원을 리턴해 준다.
			Map<String, Object> salesInfoMap = new HashMap<String, Object>();
			salesInfoMap.put("totalSalesPay", totalSalesPay);
			salesInfoMap.put("salesPieChartData", salesPieChartData);
			
			return salesInfoMap;
		}else{	// 주문 내역이 있을경우 다음과 같은 알고리즘에 따라 처리한다.
			
			// 주문 내역에 해당하는 주문메뉴List를 가지고 온다.(= List<OrderMenuVO>)
			List<OrderMenuVO> todayOrderList =  dao.selectOrderMenuListToday(orderNoList);

			// 음식점에 해당하는 음식메뉴 List를 갖고 온다.
			List<FoodMenuVO> shopFoodMenuList = dao.selectShopFoodMenuList(shopNo);
			
			// (★★ 5개)  금일 매출정보를 담고있는 salesList
			List<SalesVO> todaySalesList = new ArrayList<SalesVO>();
			
			//salesList를 구하는 알고리즘
			for(OrderMenuVO orderMenu: todayOrderList){
				for(FoodMenuVO shopFoodMenu :shopFoodMenuList){
					
					//1. 주문한 메뉴를 음식점 메뉴 리스트에서 찾는다.
					if(orderMenu.getFoodId() == shopFoodMenu.getFood_ID()){ 
						
						//2.선택된 메뉴가 SalesList에 등록 되어있는가?
						boolean isShopMenu = false;
						for(SalesVO salesInfo : todaySalesList){
							if(salesInfo.getFood_ID() == shopFoodMenu.getFood_ID()){
								
								isShopMenu = true;
								break;
							}
						}
						
						//2.1 메뉴정보가 salesList에 등록되지 않았다면 메뉴정보를 등록시킨다.
						if(isShopMenu == false){ 
							SalesVO salesInfo = new SalesVO();
							salesInfo.setFood_ID(shopFoodMenu.getFood_ID());
							salesInfo.setCategory(shopFoodMenu.getFood_type());
							salesInfo.setSubCategory(shopFoodMenu.getFood_name());
							salesInfo.setPay(0);
							todaySalesList.add(salesInfo);
						}
						
						//3. 주문내역 단위의 가격을 계산한다.
						Integer orderPay = shopFoodMenu.getPay() * orderMenu.getCount();
						
						//4. 계산한 금액을 salesList의 pay에 더한다.
						for(SalesVO salesInfo : todaySalesList){
							if(salesInfo.getFood_ID() == shopFoodMenu.getFood_ID()){
								Integer salesPay = salesInfo.getPay() + orderPay;
								salesInfo.setPay(salesPay);
							}
						}
						
					}
				}
			}
			
			StringBuilder pieChartDataStr = new StringBuilder();
			for(SalesVO salesData : todaySalesList){
				if(salesData.getCategory() == null){
					pieChartDataStr.append("기타/"+salesData.getSubCategory()+"\t"+salesData.getPay()+"\n");
				}else{
					pieChartDataStr.append(salesData.getCategory()+"/"+salesData.getSubCategory()+"\t"+salesData.getPay()+"\n");
				}
				totalSalesPay += salesData.getPay();
			}
			
			salesPieChartData = pieChartDataStr.toString();
			
			Map<String, Object> salesInfoMap = new HashMap<String, Object>();
			salesInfoMap.put("totalSalesPay", totalSalesPay);
			salesInfoMap.put("salesPieChartData", salesPieChartData);
			
			return salesInfoMap;
		}

	} 
}
