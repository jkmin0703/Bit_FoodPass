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
.row1 {
	margin-top: 15px;
	margin-left: -1px;
}

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

.row2 {
	margin-top: 20px;
	margin-left: -14px;
}

.form-group{
margin-left: -15px;
}



</style>

<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarTable.jsp"></jsp:include>




<!-- 내 가게 테이블 등록 INPUT 박스 및  테이블 등록 확인 자바스크립트 -->
		
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 테이블 등록</h3>
			<br>
		</div>

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
		<br> <br>

		<!-- 내 가게 목록 테이블 -->
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
<br>

				<!-- 내 가게 테이블 수정 INPUT 박스 및  테이블 등록 확인 자바스크립트 -->

				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">내 가게 테이블 수정</label>
					<br>
					<div class="col-md-11">
						<input type="text" class="form-control"
							placeholder="가게 테이블 개수를 입력하세요.">
					</div>

					<div class="col-md-1">
						<button type="button" onclick="tableRegisterFunction()"
							class="btn btn-primary btn-sm">등록</button>
							

						<br> <br><br>

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
	/* 내 가게 테이블 등록 확인 자바스크립트 */
	function tableRegisterFunction() {
		confirm("내 가게 테이블 개수를 등록합니다.");
	}
</script>
