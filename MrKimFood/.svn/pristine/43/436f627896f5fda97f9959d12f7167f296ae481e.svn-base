package com.mrkimfood.gonggam.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public class DeleteFunctionError {
	
	//매장이 삭제된 다음 기능을 이용하려 할때 에러 페이지로 이동해 주는 메소드
	public ModelAndView restaurant(){
		Map<String, Object> models = new HashMap<String, Object>();
		String errorMessage = "매장이 삭제되어 기능을 이용할 수 없습니다.";
		models.put("errorMessage", errorMessage);
		String changeUrl = "company/myShopList";
		models.put("changeUrl", changeUrl);
		return new ModelAndView("/error/deleteToBack", "models", models);
	}
	
	//메뉴가 사용한 다음 메뉴 기능을 이용하려 할 때 에러페이지로 이동해 주는 메소드
	public ModelAndView foodMenu(Integer shopNo){
		Map<String,Object> models = new HashMap<String, Object>();
		String errorMessage = "이미 삭제된 메뉴입니다.";
		models.put("errorMessage", errorMessage);
		String changeUrl = "company/myShop/"+shopNo+"/foodMenuList";
		models.put("changeUrl", changeUrl);
		return new ModelAndView("/error/deleteToBack", "models", models);
	}
	
}
