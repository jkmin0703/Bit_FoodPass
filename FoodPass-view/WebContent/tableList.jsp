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

.row1{
margin-left:-16px;
margin-bottom:45px; 
}

/*.table > thead > tr > .no-line {border-bottom: none;}*/
.table>tbody>tr>.thick-line {
	border-top: 2px solid #dddddd;;
}

.table>tbody>tr>.no-line {
	border-top: none;
}

.tablecss{
top: 50%;
}

.gr {
	background-color: #F2F2F0
}

.panel-body1 {
	margin-top: -1px;
	margin-right: 20px;
	margin-left: 20px;
}

.pagenavigation {
	margin-top: -15px;
}

.buttomgroup1 {
	margin-top: -15px;
	margin-right: -138px;
}

footer.prodcthead {
	margin-top: 80%;
}
</style>

<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarTable.jsp"></jsp:include>


<!-- 내 가게 테이블 목록 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 테이블 목록</h3>
			<br>
		</div>

		<div class="panel-body1">
			<div class="table-responsive">
				<table class="table table-condensed">

					<br>

					<!-- 내 가게 목록 SELECT 박스 -->
					<div class="row1">
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


					<!-- 내 가게 테이블 칼럼 명-->
					<thead>
						<tr>
							<th class="text-center">내 가게 이름</th>
							<th class="text-center">내 가게 주소</th>
							<th class="text-center">내 가게 테이블 고유번호</th>
							<th class="text-center">QR 코드</th>
							<th class="text-center">선택</th>

						</tr>
					</thead>

					<!-- 내 가게 테이블 정보 -->

					<tbody>
						<div class="tablecss">
						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>
						</div>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<tr>
							<td class="text-center">맥도날드</td>
							<td class="text-center">서울시 서초구 서초1동 123-1번지</td>
							<td class="text-center">서초-0000-000</td>
							<td class="text-center"><img src="./img/qrCode.jpg"
								width="45px" height="45px"></td>
							<td class="text-center"><input type="checkbox"></td>
						</tr>

						<!-- 내 가게 테이블 목록 마지막 줄 코드 -->

						<tr>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
							<td class="thick-line"></td>
						</tr>

					</tbody>

				</table>


				<!-- 전체선택 및 출력하기 버튼 및 자바스크립트 confirm 메소드 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-6 col-md-offset-6">
							<button type="button" onclick="AllQRFunction()"
								class="btn btn-default btn-sm">가게 전체 테이블 출력</button>
							<button type="button" onclick="PartQRFunction()"
								class="btn btn-primary btn-sm">선택 테이블 출력</button>
						</div>
					</div>
				</div>

				<!-- 페이지 네비게이션 -->
				<div class="pagenavigation">
					<div class="page_buttoms text-center">
						<ul class="pagination pagination-sm">
							<li><a href="#">«</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">»</a></li>
						</ul>
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

/* 내 가게 테이블 목록 출력 자바스크립트 */
	function AllQRFunction() {
		confirm("『가게 전체 테이블 출력』을 선택하시면 해당 가게의 모든 테이블의 QR코드가 출력됩니다.");
	}

	function PartQRFunction() {
		confirm("『선택 테이블 출력』을 선택하시면 해당 페이지에서 선택하신 테이블의 QR코드만 출력됩니다.");
	}
	
</script>