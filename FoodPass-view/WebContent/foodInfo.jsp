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
	margin-top: 83%;
}
</style>

<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarMenu.jsp"></jsp:include>




<div class="col-md-8">

<!-- 내 가게 정보 -->
	<jsp:include page="commonView/myShopInfo.jsp"></jsp:include>

<!-- 내 가게 메뉴 정보 박스  -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 정보</h3>
			<br>
		</div>
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<!-- 내 가게 메뉴 카테고리 SELECT 폼 -->
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">메뉴
						카테고리</label>
					<div class="col-md-8">
						<select class="form-control">
							<option>전체메뉴</option>
							<option>세트메뉴</option>
							<option>햄버거</option>
							<option>디저트</option>
							<option>음료수</option>
							<option value="myModal">기타</option>
						</select>
					</div>
				</div>

				<!-- 내 가게 메뉴 등록 INPUT 폼 그룹 -->

				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">메뉴 이름</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">가격</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">칼로리</label>
					<div class="col-md-8">
						<input type="text" class="form-control">
					</div>
				</div>
				<br>

				<!-- 내 가게 메뉴 사진 이미지 등록 INPUT 그룹 -->
				<div class="row1">
					<div class="col-md-4 col-md-offset-3">
						<img src="./img/Mc_donald.jpg" width="200px" height="200px">
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputFile">음식 이미지</label> <br> <input
								type="file" id="foodImageInputFile">
							<p class="help-block">음식 이미지를 jpg 파일 형식으로 첨부하여 주십시오.</p>
						</div>
					</div>
				</div>

			</form>

			<!-- 내 가게 수정, 확인 버튼 그룹 -->
			<div class="buttomgroup1">
				<div class="form-group">
					<div class="row2">
						<div class="col-md-8 col-md-offset-5">
							<br> <br>
							<button type="button" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-default">확인</button>
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