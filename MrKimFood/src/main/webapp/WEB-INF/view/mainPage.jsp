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
<P> ������ �ֹ��� ��ٸ��ó���?</P>

<br/> 

<c:if test="${ empty member.id }">
	<a href="${pageContext.request.contextPath}/signUp">ȸ������</a>
	<a href="${pageContext.request.contextPath}/login">�α���</a>
</c:if>

<c:if test="${ not empty member.id }">
	<a href="${pageContext.request.contextPath}/company/main2">������ ������</a>
	<a href="${pageContext.request.contextPath}/myPage">����������</a>
	<a href="${pageContext.request.contextPath}/logout">�α׾ƿ�</a>
</c:if>
<hr><br/>

</div>
</body>
</html>

<jsp:include page="com/footer.jsp"/>