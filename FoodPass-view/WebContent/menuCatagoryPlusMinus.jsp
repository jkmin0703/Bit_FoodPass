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
	s
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

footer.prodcthead {
	margin-top: 70%;
}
</style>

<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarMenu.jsp"></jsp:include>


<div class="col-md-8">
<!-- 내 가게 정보 -->
<jsp:include page="commonView/myShopInfo.jsp"></jsp:include>

<!-- 내 가게 메뉴 카테고리 추가  -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 카테고리 추가</h3>
			<br>
		</div>

		<!-- 내 가게 메뉴 카테고리 추가 INPUT 폼 그룹 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">메뉴 카테고리 추가</label>
					<div class="col-md-8">
						<input type="text" class="form-control"
							placeholder="원하시는 메뉴 카테고리를 입력하세요.">
					</div>
				</div>
			</form>

			<!-- 내 가게 메뉴 카테고리 추가, 취소 버튼 그룹 -->
			<div class="buttomgroup2">
				<div class="form-group">
					<div class="row2">
						<div class="col-md-8 col-md-offset-5">
							<br> <br>
							<button type="button" class="btn btn-primary">추가</button>
							<button type="button" class="btn btn-default">취소</button>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 내 가게 메뉴 카테고리 삭제 SELECT 폼 -->

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 카테고리 삭제</h3>
			<br>
		</div>
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">메뉴
						카테고리 삭제</label>
					<div class="col-md-8">
						<select class="form-control">
							<option>삭제하시고 싶은 메뉴 카테고리를 선택하세요.</option>
							<option>전체메뉴</option>
							<option>세트메뉴</option>
							<option>햄버거</option>
							<option>디저트</option>
							<option>음료수</option>
							<option value="myModal">기타</option>
						</select>
					</div>
			</form>
		</div>


		<!-- 내 가게 메뉴 카테고리 삭제, 취소 버튼 그룹 -->
		<div class="buttomgroup2">
			<div class="form-group">
				<div class="row2">
					<div class="col-md-8 col-md-offset-5">
						<br> <br>
						<button type="button" class="btn btn-primary" onclick="minusCatagoryFunction()">삭제</button>
						<button type="button" class="btn btn-default">취소</button>
						<br> <br>
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
	/* 내 가게 테이블 등록 확인 자바스크립트 */
	function minusCatagoryFunction() {
		confirm("내 가게 카테고리를 삭제합니다.");
	}
</script>