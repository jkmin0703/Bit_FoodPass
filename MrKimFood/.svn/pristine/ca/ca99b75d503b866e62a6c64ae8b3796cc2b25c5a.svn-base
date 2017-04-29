<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter" %>
<%@page import="com.mrkimfood.gonggam.vo.CompanyVO" %>
<%@page import="java.util.List" %>
<%@page import="org.json.JSONArray" %>
<%@page import="org.json.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	String callback = (String) request.getAttribute("callback");

	JSONObject jsonObject = new JSONObject();
	JSONArray arr = new JSONArray();
	List<CompanyVO> list = (List<CompanyVO>)request.getAttribute("members"); 
	for(int i=0; i < list.size(); i++){
		JSONObject json = new JSONObject();
		json.put("id", list.get(i).getId());
		json.put("pw", list.get(i).getPw());
		json.put("businessName", list.get(i).getBusinessName());
	}
	response.setContentType("application/json");
	jsonObject.put("list", list);
//	out.print(jsonObject);
	
	if (callback != null) {
		out.append(callback).append("(");
	}
	out.append(jsonObject.toString());
	if (callback != null) {
		out.append(")");
	}
	System.out.println(jsonObject.toString());
	out.flush();






%>
