<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../com/header.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
<title>로그인</title>
<%-- <link rel="stylesheet" href="<%= request.getContextPath() %>/style/icon.css" />	 --%>
</head>
<body>


<%
String savedId = null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		if (c.getName().equals("loginId")) {
			savedId = c.getValue();
			break;
		}
	}
}


String redirect = request.getParameter("redirect");
//System.out.println("jsp 리더렉트 값 : " + redirect);
%>

<br>
<h3 align="center">로그인</h3>

<font color="red">${loginMessage}</font><br/>

<form name="login" action="login<%= redirect != null ? "?redirect=" + redirect : "" %>" method="post">
	
	<br/>
		<table align="center">
			<tr>
				<td><label for="name">ID</label></td>
				<td><input type="text" name="id" value="<%= savedId != null ? savedId : "" %>" /></td>
			</tr>
			<tr>
				<td><label for="name">PW</label></td>
				<td><input type="password" name="pw"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" name="saveId" <%= savedId != null ? "checked=\"checked\"" : "" %> /> 아이디 저장
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인"/>
				</td>
			</tr>
		</table>
		<!-- <br>
		<div align="center" >
			<a href="myPage" class="button blue"><span class="icon-check"></span>로그인 </a>
		</div>  -->
	<br/><br/>

</form>

</body>
</html>
<jsp:include page="../com/footer.jsp"/>