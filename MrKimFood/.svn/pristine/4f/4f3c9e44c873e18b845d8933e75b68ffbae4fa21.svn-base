<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>푸드패스 사장님 사이트 로그인 페이지</title>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="//code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script src="${pageContext.request.contextPath}/js/respond.js"></script>

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/nomalize.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap-responsive.css" rel="stylesheet">

<!-- mycss -->
<link href="${pageContext.request.contextPath}/css/mycss/body_container.css" rel="stylesheet" type="text/css">

<style>
div.container {
	margin-top: 200px;
	text-align: center;
}

footer.prodcthead {
	border-top: 1px solid #ccc;
	padding: 8px 0;
	margin-top: 370px;
}
</style>

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

<!-- 로그인 메인 코드 -->

	<div class="auto-grid">
		<div class="container">
		<font color="red">${loginMessage}</font><br/>
		
			<form class="form-signin" name="login" action="login<%= redirect != null ? "?redirect=" + redirect : "" %>" method="post">
				<h2 class="form-signin-heading">로그인</h2>
				<input type="text" class="form-control" placeholder="Email address" name="id" value="<%= savedId != null ? savedId : "" %>"> 
					<input type="password" class="form-control"	placeholder="Password" name="pw"> <label class="checkbox">
					 <input type="checkbox" value="remember-me" name="saveId" <%= savedId != null ? "checked=\"checked\"" : "" %> > 아이디/비밀번호 저장
				</label>
				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
				<br>
			</form>
			
		</div>

<!-- footer -->
<jsp:include page="../com/FPfooter_slim.jsp"></jsp:include>