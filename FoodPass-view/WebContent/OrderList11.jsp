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

.buttomgroup1 {
	margin-top: -10px;
	margin-bottom: 20px;
}
</style>

<!-- body -->

<!-- SideBar -->
<jsp:include page="commonView/FPsideBarOrder.jsp"></jsp:include>





<div class="col-md-8">

	<!-- 내 가게 정보 -->
	<jsp:include page="commonView/myShopInfo.jsp"></jsp:include>

	<!-- 내 가게 주문 내역 -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 주문 내역</h3>
			<br>
		</div>

		<!-- 내 가게 주문 내역 테이블 -->
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-condensed">

					<!-- 주문내역 테이블의 타이틀 코드 -->

					<thead>
						<tr>
							<th>테이블 번호</th>
							<th>선택메뉴</th>
							<th class="text-center">가격</th>
							<th class="text-center">수량</th>
							<th class="text-right">주문날짜</th>
							<th class="text-right">주문시간</th>
							<th class="text-right">대기순번</th>
							<th class="text-right">서비스 제공</th>
						</tr>
					</thead>

					<!-- 주문내역 테이블의 부분 요소 -->

					<tbody>
						<tr>
							<td>8</td>
							<td>케이준 버거 세트</td>
							<td class="text-center">6,000원</td>
							<td class="text-center">3</td>
							<td class="text-right">2014-12-04</td>
							<td class="text-right">19:54:39</td>
							<td class="text-right">0</td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>
						<tr>
							<td>6</td>
							<td>빅맥세트</td>
							<td class="text-center">5,500원</td>
							<td class="text-center">3</td>
							<td class="text-right">2014-12-04</td>
							<td class="text-right">19:54:51</td>
							<td class="text-right">1</td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>
						<tr>
							<td>8</td>
							<td>상하이 버거 세트</td>
							<td class="text-center">6,000원</td>
							<td class="text-center">2</td>
							<td class="text-right">2014-12-04</td>
							<td class="text-right">19:54:56</td>
							<td class="text-right">2</td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>
						<tr>
							<td>8</td>
							<td>케이준 버거 세트</td>
							<td class="text-center">6,000원</td>
							<td class="text-center">3</td>
							<td class="text-right">2014-12-04</td>
							<td class="text-right">19:54:57</td>
							<td class="text-right">3</td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>

						<!-- 주문내역 테이블의 마지막 줄 코드 -->

						<tr>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
						</tr>
					</tbody>
				</table>

				<!-- 주문 내역 조회, 서비스 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" class="btn btn-primary">조회</button>
							<button type="button" class="btn btn-default">서비스 제공</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>

<!-- sideBanner -->
<jsp:include page="commonView/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>