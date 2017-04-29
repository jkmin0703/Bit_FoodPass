<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../../com/header.jsp"></jsp:include>


<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"></jsp:include>
	
	<div id="content">
		매장 ID: ${models.shopInfo.restaurant_ID}<br/>
		음식점 이름: ${models.shopInfo.restaurant_name}<br/>
		음식점 주소: ${models.shopInfo.address}<br/>
		매장 분류: ${models.shopInfo.restaurant_type}<br/>
		영업 시간: ${models.shopInfo.openingTime}<br/>
		종료 시간: ${models.shopInfo.closingTime}<br/>
		영업 회원 ID: ${models.shopInfo.member_ID}<br/>
	</div>
</div>

<jsp:include page="../../com/footer.jsp"></jsp:include>