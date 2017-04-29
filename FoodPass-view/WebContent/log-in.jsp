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
<script src="js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script src="js/respond.js"></script>

<!-- Bootstrap -->
<link href="./css/nomalize.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/bootstrap-responsive.css" rel="stylesheet">

<!-- mycss -->
<link href="./css/mycss/body_container.css" rel="stylesheet" type="text/css">

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

<!-- 로그인 메인 코드 -->

	<div class="auto-grid">
		<div class="container">

			<form class="form-signin">
				<h2 class="form-signin-heading">로그인</h2>
				<input type="text" class="form-control" placeholder="Email address"
					autofocus> 
					<input type="password" class="form-control"	placeholder="Password"> <label class="checkbox"> <input
					type="checkbox" value="remember-me"> 아이디/비밀번호 저장
				</label>
				<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
				<br>
			</form>
		</div>

<!-- footer -->
<jsp:include page="commonView/FPfooter_slim.jsp"></jsp:include>