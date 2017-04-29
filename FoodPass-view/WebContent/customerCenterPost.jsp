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

/* 캐러셀 컨트롤 위치 설정 코드 */
.control {
	position: inherit;
	top: 50%;
	z-index: 5;
	display: inline-block;
	right: 50%;
}

/*.table > thead > tr > .no-line {border-bottom: none;}*/
.table>tbody>tr>.thick-line {
	border-top: 2px solid #dddddd;;
}

.table>tbody>tr>.no-line {
	border-top: none;
}

.sideimage {
	margin-top: 3px;
	margin-left: -2px;
}

.pagenavigation {
	margin-top: -100px;
}
</style>



<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarCustomer.jsp"></jsp:include>

<!-- 공지사항 박스 -->
<div class="tablebody">
	<div class="col-md-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">푸드패스 공지사항</h3>
				<br>
			</div>
			<br>



			<!-- 공지사항 테이블 -->
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번 호</th>
								<th>제 목</th>
								<th>등록일</th>
							</tr>
						</thead>
						<tr>
							<td>1</td>
							<td><a href="">[공지]사장님 전용사이트가 오픈했습니다!</a></td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="">약관</a></td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href=""> 취급방침</a></td>
							<td></td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href=""> 판매 및 환불정책</a></td>
							<td></td>
						</tr>
						<tr>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
						</tr>


					</table>
				</div>
			</div>

			<!-- 페이지 네비게이션 -->
			<jsp:include page="commonView/pageNavi.jsp"></jsp:include>
			<br>

		</div>
	</div>
</div>


<!-- SideBanner -->
<jsp:include page="commonView/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>