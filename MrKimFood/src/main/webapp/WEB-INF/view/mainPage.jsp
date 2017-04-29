<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="com/header.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
</head>
<body>
<div align="center" >
<h3> FOOD-PASS SYSTEM </h3>
<br/>
<P> 아직도 주문을 기다리시나요?</P>

<br/> 

<c:if test="${ empty member.id }">
	<a href="${pageContext.request.contextPath}/signUp">회원가입</a>
	<a href="${pageContext.request.contextPath}/login">로그인</a>
</c:if>

<c:if test="${ not empty member.id }">
	<a href="${pageContext.request.contextPath}/company/main2">관리자 페이지</a>
	<a href="${pageContext.request.contextPath}/myPage">마이페이지</a>
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
</c:if>
<hr><br/>

</div>
</body>
</html>

<jsp:include page="com/footer.jsp"/>