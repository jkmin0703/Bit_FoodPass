<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FOOD-PASS</title>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요한) -->
<script src="//code.jquery.com/jquery.js"></script>
<!-- 모든 합쳐진 플러그인을 포함하거나 (아래) 필요한 각각의 파일들을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<!-- Respond.js 으로 IE8 에서 반응형 기능을 활성화하세요 (https://github.com/scottjehl/Respond) -->
<script src="js/respond.js"></script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- Bootstrap -->
<link href="./css/nomalize.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./css/bootstrap.css" rel="stylesheet">
<link href="./css/bootstrap-responsive.css" rel="stylesheet">
<link href="./css/doc.css" rel="stylesheet">



</head>
<body>
	<div class="container">
		<header class="prodcthead">
		<h1>
			<b><a href="main2.jsp">FOOD-PASS</a></b>
		</h1>
		<div class="sns pull-right">
			<ul>
				<li><a href="log-in.jsp" class="foodpass">로그인</a></li>
				<li><a href="#myModal" class="foodpass" data-toggle="modal">회원가입</a></li>
				<li><a href="myShopList.jsp" class="foodpass">내 가게</a></li>
				<li><a href="myInfo.jsp" class="foodpass">내 정보</a></li>
				<li><a href="customerCenterPost.jsp" class="foodpass">고객센터</a></li>
			</ul>
		</div>
		</header>
		<br>

		<!-- 회원가입 모달 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">
							<b>Membership Join</b>
						</h4>
					</div>
					<div class="modal-body">
						<br />
						<br />
						<div class="row">
							<form class="form-horizontal" role="form">
								<div class="form-group">
									<label for="ID" class="col-lg-3 control-label">ID</label>
									<div class="col-lg-8">
										<input type="text" class="form-control" id="ID"
											placeholder="ID">
									</div>
								</div>
								<div class="form-group">
									<label for="Password" class="col-lg-3 control-label">Password</label>
									<div class="col-lg-8">
										<input type="text" class="form-control" id="ID"
											placeholder="Password">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-8 col-md-offset-3">
										<input type="text" class="form-control" id="ID"
											placeholder="Password 확인">
									</div>
								</div>
								<div class="form-group">
									<label for="Password" class="col-lg-3 control-label">법인
										명</label>
									<div class="col-lg-8">
										<input type="text" class="form-control" id="ID"
											placeholder="법인명">
									</div>
								</div>
								<div class="form-group">
									<label for="Password" class="col-lg-3 control-label">사업자
										등록번호</label>
									<div class="col-lg-8">
										<input type="text" class="form-control" id="ID"
											placeholder="사업자 등록번호 13자리 ( - 생략)">
									</div>
								</div>
								<div class="form-group">
									<label for="Password" class="col-lg-3 control-label">대표자
										명</label>
									<div class="col-lg-8">
										<input type="text" class="form-control" id="ID"
											placeholder="대표자 명">
									</div>
								</div>
							</form>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		<!-- 회원가입 모달 끝 -->