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

.buttomgroup1 {
	margin-top: 25px;
}
</style>


<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarMyShop.jsp"></jsp:include>

<!-- 내 가게 등록 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 등록</h3>
			<br>
		</div>

		<!-- 내 가게 등록 INPUT 폼 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">내 가게 이름</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">내 가게
						주소</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>

				<!-- 업종 분류 SELECT 박스 -->
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">업종 분류</label>
					<div class="col-md-8">
						<select class="form-control" placeholder="업종을 선택해 주세요.">
							<option></option>
							<option>한식</option>
							<option>중식</option>
							<option>일식</option>
							<option>양식</option>
							<option>패스트푸드</option>
							<option>기타</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">오픈 시간</label>
					<div class="col-md-8">
						<input type="time" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">마감 시간</label>
					<div class="col-md-8">
						<input type="time" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">전화번호</label>
					<div class="col-md-8">
						<input type="phone" class="form-control"
							placeholder="'-' 없이 입력해 주세요.">
					</div>
				</div>
				<!-- 수정, 취소 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" class="btn btn-primary">등록</button>
							<button type="button" class="btn btn-default">취소</button>
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