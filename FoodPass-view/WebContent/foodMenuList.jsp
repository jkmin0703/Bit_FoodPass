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
ul {
	list-style: none;
	padding-left: 0;
}

.product .thumbnail {
	border: none;
}

.row {
	padding-left: 30px;
}

div.page_buttoms {
	text-align: center;
}

footer.prodcthead {
	margin-top: 93%;
}

.pagenavigation {
	margin-bottom: -15px;
}

.a {
	text-decoration:none
}

</style>

<!-- body -->

<!-- SideBar -->
<jsp:include page="commonView/FPsideBarMenu.jsp"></jsp:include>


<!-- 내 가게 메뉴 목록 박스-->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 목록</h3>
			<br>
		</div>

		<br>

		<!-- 내 가게 목록 선택 SELECT 폼 -->
		<div class="row">
			<div class="col-md-3">
				<select class="form-control">
					<option>맥도날드</option>
					<option>버거킹</option>
					<option>김가네</option>
					<option>롯데리아</option>
					<option>커피빈</option>
				</select>
			</div>
		</div>

		<!-- 내 가게 정보 테이블 -->
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="text-center gr"><strong>내 가게 이름</strong></td>
							<td>맥도날드</td>
							<td class="text-center gr"><strong>전화번호</strong></td>
							<td>02-123-4567</td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>내 가게 분류</strong></td>
							<td>패스트 푸드</td>
							<td class="text-center gr"><strong>오픈 시간</strong></td>
							<td>오전 09:00</td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>내 가게 주소</strong></td>
							<td>서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center gr"><strong>종료 시간</strong></td>
							<td>오후 24:00</td>
						</tr>
					</tbody>
				</table>

				<!-- 내 가게 메뉴 목록 SELECT 폼 -->
				<div class="row">
					<div class="col-md-3 col-md-offset-9">
						<select class="form-control">
							<option>전체메뉴</option>
							<option>세트메뉴</option>
							<option>햄버거</option>
							<option>디저트</option>
							<option>음료수</option>
							<option>기타</option>
						</select>
					</div>
				</div>


				<br>


				<!-- 내 가게 메뉴리스트 시작 -->
				<div class="col-md-3">
					<a href="foodInfo.jsp" title="클릭하시면 내 가게 메뉴 정보 페이지로 이동합니다.">
						<div class="thumbnail">		
							<img src="./img/Mc_donald.jpg">
							<div class="caption">
								<ul class="list-unstyled block">
									<li><b>빅맥세트</b></li>
									<li><b>지역-매장번호-000</b></li>
								</ul>
								<dl>
									<dt>판매가</dt>
									<dd>5,600 원</dd>
								</dl>
							</div>
						</div>			
					</a> 
					
					<br>					
			
					<div class="thumbnail">
						<img src="./img/Mc_donald.jpg">
						<div class="caption">
							<ul class="list-unstyled block">
								<li><b>치즈버거세트</b></li>
								<li><b>지역-매장번호-000</b></li>
							</ul>
							<dl>
								<dt>판매가</dt>
								<dd>5,600 원</dd>
							</dl>
						</div>

					</div>
				</div>

				<div class="col-md-3">
					<div class="thumbnail">
						<img src="./img/Mc_donald.jpg">
						<div class="caption">
							<ul class="list-unstyled block">
								<li><b>빅맥세트</b></li>
								<li><b>지역-매장번호-000</b></li>
							</ul>
							<dl>
								<dt>판매가</dt>
								<dd>5,600 원</dd>
							</dl>
						</div>

					</div>
					<br>
					<div class="thumbnail">
						<img src="./img/Mc_donald.jpg">
						<div class="caption">
							<ul class="list-unstyled block">
								<li><b>치즈버거세트</b></li>
								<li><b>지역-매장번호-000</b></li>
							</ul>
							<dl>
								<dt>판매가</dt>
								<dd>5,600 원</dd>
							</dl>
						</div>

					</div>
				</div>

				<div class="col-md-3">
					<div class="thumbnail">
						<img src="./img/Mc_donald.jpg">
						<div class="caption">
							<ul class="list-unstyled block">
								<li><b>빅맥세트</b></li>
								<li><b>지역-매장번호-000</b></li>
							</ul>
							<dl>
								<dt>판매가</dt>
								<dd>5,600 원</dd>
							</dl>
						</div>

					</div>
					<br>
					<div class="thumbnail">
						<img src="./img/Mc_donald.jpg">
						<div class="caption">
							<ul class="list-unstyled block">
								<li><b>치즈버거세트</b></li>
								<li><b>지역-매장번호-000</b></li>
							</ul>
							<dl>
								<dt>판매가</dt>
								<dd>5,600 원</dd>
							</dl>
						</div>

					</div>
				</div>

				<div class="col-md-3">
					<div class="thumbnail">
						<img src="./img/Mc_donald.jpg">
						<div class="caption">
							<ul class="list-unstyled block">
								<li><b>빅맥세트</b></li>
								<li><b>지역-매장번호-000</b></li>
							</ul>
							<dl>
								<dt>판매가</dt>
								<dd>5,600 원</dd>
							</dl>
						</div>

					</div>
					<br>
					<div class="thumbnail">
						<img src="./img/Mc_donald.jpg">
						<div class="caption">
							<ul class="list-unstyled block">
								<li><b>치즈버거세트</b></li>
								<li><b>지역-매장번호-000</b></li>
							</ul>
							<dl>
								<dt>판매가</dt>
								<dd>5,600 원</dd>
							</dl>
						</div>

					</div>
				</div>
			</div>

			<!-- 페이지 네비게이션 -->
			<jsp:include page="commonView/pageNavi.jsp"></jsp:include>
			<br>

		</div>
	</div>

</div>
<!-- 내 가게 메뉴 리스트 끝 -->


<!-- sideBanner -->
<jsp:include page="commonView/FPbanner.jsp"></jsp:include>

<br>


<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>