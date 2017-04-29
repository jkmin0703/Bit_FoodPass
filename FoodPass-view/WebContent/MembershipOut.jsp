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
<jsp:include page="commonView/FPsideBarMyInfo.jsp"></jsp:include>

<!-- 푸드패스 회원탈퇴 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">회원탈퇴</h3>
			<br>
		</div>

		<!-- 회원정보 INPUT 폼 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">ID</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>				
				<div class="form-group">
					<label for="text" class="col-md-3 control-label">법인명</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>				
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">사업자 등록번호</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="text" class="col-md-3 control-label">대표자 명</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>
				
				<!-- 수정, 취소 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" class="btn btn-primary" onclick="MembershipOutFunction()">회원탈퇴</button>
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

<script>
	/* 내 가게 테이블 등록 확인 자바스크립트 */
	function MembershipOutFunction() {
		confirm("내 정보를 수정합니다.");
	}
</script>
