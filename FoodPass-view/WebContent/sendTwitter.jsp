<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="commonView/FPheader.jsp"></jsp:include>

<!-- mycss -->
<link href="./css/mycss/body_container.css" rel="stylesheet"
	type="text/css">
<link href="./css/mycss/header_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="./css/mycss/footer_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="./css/kfonts2.css" rel="stylesheet" type="text/css">



<style>
.buttomgroup2 {
	margin-top: -25px;
}

/*.table > thead > tr > .no-line {border-bottom: none;}*/
.table>tbody>tr>.thick-line {
	border-top: 2px solid #dddddd;
}

.table>tbody>tr>.no-line {
	border-top: none;
}

.gr {
	background-color: #F2F2F0
}

.pagenavigation {
	margin-top: -15px;
}

.row1 {
	margin-left: -10px;
	margin-right: -5px;
}

.row2 {
	margin-top: -25px;
	margin-left: -16px;
	margin-right: 7px;
}

.buttomgroup2 {
	margin-top: -15px;
}

footer.prodcthead {
	margin-top: 83%;
}

</style>


<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarChart.jsp"></jsp:include>




<div class="col-md-8">

	<!-- 내 가게 정보 -->
	<jsp:include page="commonView/myShopInfo.jsp"></jsp:include>

	<!-- 내 가게 sns 홍보 박스  -->
	<div class="panel panel-danger">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 SNS 홍보</h3>
			<br>
		</div>
		<div class="panel-body">



			<!-- SNS 홍보 INPUT 박스 -->

			<div class="panel-body">
				<div class="col-md-12">

<br>

					<!-- 탭형 네비게이션 class="active" -->
					<ul class="nav nav-tabs">
						<li><a href="./sendCacao.jsp"><img alt=""
								src="./imgs/cacaoStory.jpg"> 카카오스토리</a></li>
						<li class="active"><a href="./sendTwitter.jsp"><img
								alt="" src="./imgs/twitter.jpg"> 트위터</a></li>
						<li><a href="./sendFacebook.jsp"><img alt=""
								src="./imgs/facebook.jpg"> 페이스북</a></li>
						<li><a href="./OneTimeAllSend.jsp"><img alt="" src="./imgs/onetime_logo.jpg"> One Time SNS</a></li>
					</ul>


					<br>


					<div class="table-responsive">
						<table class="table table-condensed">
							<form class="form-horizontal" role="form" id="ajax-contact-form">


								<div class="form-group">
									<textarea name="message" class="form-control required"
										id="message" title="Message" placeholder="원하시는 홍보 메시지를 입력하세요."
										rows=10></textarea>
								</div>


								<!-- 내 가게 테이블 등록, 취소 버튼 그룹 -->
								<div class="buttomgroup2">
									<div class="form-group">
										<div class="row2">
											<div class="col-md-3">
												<br>

												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-camera"></span>
												</button>
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-paperclip"></span>
												</button>

											</div>



											<div class="col-md-2 col-md-offset-7">
												<br>
												<button type="button" class="btn btn-primary">게시글
													전송</button>
												<br>
											</div>



										</div>
									</div>
							</form>
						</table>


						<!-- SNS 홍보 INPUT 박스 끝 -->

					</div>
				</div>
			</div>


		</div>
	</div>
</div>




<!-- SideBanner -->
<jsp:include page="commonView/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>