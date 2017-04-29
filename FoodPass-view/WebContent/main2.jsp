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


<style>

/* 캐러셀 컨트롤 위치 설정 코드 */
.control {
	position: inherit;
	top: 50%;
	z-index: 5;
	display: inline-block;
	right: 50%;
}

#funArea {
	margin-left: -7px;
	
}

footer.prodcthead {
	margin-top: 8%;
}

</style>

<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

<BR>

<!-- body -->

<!-- 캐러셀 시작 -->
<div id="carousel-generic" class="carousel slide">
	<!-- 캐러셀 Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
		<li data-target="#carousel-generic" data-slide-to="1"></li>
		<li data-target="#carousel-generic" data-slide-to="2"></li>
		<li data-target="#carousel-generic" data-slide-to="3"></li>
	</ol>
	
	<!-- 캐러셀(Carousel) items -->
	<div class="carousel-inner">
		<div class="item active">
			<img src="./img/1.jpg" alt="First slide">
		</div>
		<div class="item">
			<img src="./img/2.jpg" alt="Second slide">
		</div>
		<div class="item">
			<img src="./img/3.jpg" alt="Third slide">
		</div>
		<div class="item">
			<img src="./img/4.jpg" alt="Third slide">
		</div>
	</div>

	<!-- 캐러셀 Controls -->
	<a class="left carousel-control" href="#carousel-generic"
		data-slide="prev"> <img src="./img/left.png" class="control">
	</a> <a class="right carousel-control" href="#carousel-generic"
		data-slide="next"> <img src="./img/right.png" class="control">
	</a>
</div>
<!--// 캐러셀 부분 끝  -->

<br>

<!-- MAIN 하단 메뉴-->
<div id="funArea" class="row">
	<div class="col-md-4">
		<h2>
			<b>내 가게 관리</b>
		</h2>
		<p>
			<b>FOOD-PASS에 등록된 사장님이 운영하시는 매장의 등록부터 정보조회까지 가능한 서비스 입니다. 지금 바로
				클릭하시면 매장의 모든 관리를 내 손 안에서 해결할 수 있습니다. </b>
		</p>
		<p>
			<a class="btn btn-primary" href="myShopList.jsp">바로가기 &raquo;</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>
			<b>내 가게 테이블 관리</b>
		</h2>
		<p>
			<b>FOOD-PASS에 등록된 가게의 테이블을 생성, 조회, 수정 할 수 있는 메뉴입니다. 지금 바로 클릭하시면
				매장의 모든 테이블 관리를 내 손 안에서 해결할 수 있습니다. </b>
		</p>
		<p>
			<a class="btn btn-primary" href="tableList.jsp">바로가기 &raquo;</a>
		</p>
	</div>
	<div class="col-md-4">
		<h2>
			<b>내 가게 메뉴 관리</b>
		</h2>
		<p>
			<b>FOOD-PASS에 등록된 사장님 가게의 메뉴를 등록, 조회, 수정 할 수 있는 메뉴입니다. 지금 바로
				클릭하시면 매장의 모든 메뉴 관리를 내 손 안에서 해결할 수 있습니다.</b>
		</p>
		<p>
			<a class="btn btn-primary" href="foodMenuList.jsp">바로가기 &raquo;</a>
		</p>
	</div>
		
</div>


<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>