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
<jsp:include page="commonView/FPsideBarChart.jsp"></jsp:include>




<div class="col-md-8">

	<!-- 내 가게 정보 -->
	<jsp:include page="commonView/myShopInfo.jsp"></jsp:include>

	<!-- 내 가게 일일 매출 현황 박스  -->
	<div class="panel panel-danger">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 일일 매출 현황</h3>
			<br>
		</div>
		<div class="panel-body">
			<br>


			<!-- 내 가게 일일 매출 현황 총합 -->
			<div class="row">
				<div class="col-md-3">총 매출액: 1,000,000원</div>


				<!-- 내 가게 일일 매출 현황 SELECT 폼 -->
				<div class="col-md-3 col-md-offset-6">
					<select class="form-control">
						<option>총 매출</option>
						<option>카테고리</option>
					</select>
				</div>
			</div>




			<!-- 내 가게 일일 매출 현황 CHART -->
			<div class="col-md-12">
			
			진수 차트 자리!!!
			
			</div>


			<!-- 차트 끝 -->





		</div>
	</div>



</div>

<!-- SideBanner -->
<jsp:include page="commonView/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>