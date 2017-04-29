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
	border-top: 2px solid #dddddd;;
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

.buttomgroup1{
	margin-bottom:65px;
}

</style>

<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarMyShop.jsp"></jsp:include>


<!-- 내 가게 삭제 목록 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 삭제</h3>
			<br>
		</div>

		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-condensed">

					<!-- 내 가게 목록 table 칼럼명-->
					<thead>
						<tr>

							<th>내 가게 이름</th>
							<th class="text-center">내 가게 주소</th>
							<th class="text-center">내 가게 분류</th>
							<th class="text-right">오픈 시간</th>
							<th class="text-right">종료 시간</th>
							<th class="text-right">선택</th>

						</tr>
					</thead>

					<!-- 내 가게 정보 -->
					<tbody>
						<tr>

							<td><a href="*">레스토랑'A'호</a></td>
							<td class="text-center"><a href="*">서울시 서초구 서초1동 123-1번지</a></td>
							<td class="text-center"><a href="*">americanFood</a></td>
							<td class="text-right"><a href="*">8:00</a></td>
							<td class="text-right"><a href="*">23:00</a></td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>
						<tr>

							<td><a href="*">레스토랑'A'호</a></td>
							<td class="text-center"><a href="*">서울시 서초구 서초1동 123-1번지</a></td>
							<td class="text-center"><a href="*">americanFood</a></td>
							<td class="text-right"><a href="*">8:00</a></td>
							<td class="text-right"><a href="*">23:00</a></td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>
						<tr>

							<td><a href="*">레스토랑'A'호</a></td>
							<td class="text-center"><a href="*">서울시 서초구 서초1동 123-1번지</a></td>
							<td class="text-center"><a href="*">americanFood</a></td>
							<td class="text-right"><a href="*">8:00</a></td>
							<td class="text-right"><a href="*">23:00</a></td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>
						<tr>

							<td><a href="*">레스토랑'A'호</a></td>
							<td class="text-center"><a href="*">서울시 서초구 서초1동 123-1번지</a></td>
							<td class="text-center"><a href="*">americanFood</a></td>
							<td class="text-right"><a href="*">8:00</a></td>
							<td class="text-right"><a href="*">23:00</a></td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>
						<tr>

							<td><a href="*">레스토랑'A'호</a></td>
							<td class="text-center"><a href="*">서울시 서초구 서초1동 123-1번지</a></td>
							<td class="text-center"><a href="*">americanFood</a></td>
							<td class="text-right"><a href="*">8:00</a></td>
							<td class="text-right"><a href="*">23:00</a></td>
							<td class="text-right"><input type="checkbox"></td>
						</tr>


						<!-- 내 가게 목록 테이블 맨 아래 줄 부분 코드 -->

						<tr>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
						</tr>

					</tbody>
				</table>

				<!-- 페이지 네비게이션 -->
				<jsp:include page="commonView/pageNavi.jsp"></jsp:include>

				<!-- 내 가게 삭제 및 취소 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" class="btn btn-primary" onclick="deleteMyShopFunction()">삭제</button>
							<button type="button" class="btn btn-default">취소</button>
						</div>						
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

<script>
	/* 내 가게 목록 삭제 확인 자바스크립트 */
	function deleteMyShopFunction() {
		confirm("내 가게를 삭제합니다.");
	}
</script>