<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="./com/FPheader.jsp"></jsp:include>

<!-- mycss -->
<link href="${pageContext.request.contextPath}/css/mycss/body_container.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/mycss/header_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/mycss/footer_prodcthead.css" rel="stylesheet"
	type="text/css">

<style>
	header.prodcthead h1 {
		font-size: 28px;
		display: inline;
	}

	/* 캐러셀 컨트롤 위치 설정 코드 */
  .control { position: inherit; top: 50%; z-index: 5; display: inline-block; right: 50%;}
  
  #funArea{margin-left: -15px;}
  
  footer.prodcthead {
	margin-top: 2%;
}
  
  
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
	});
</script>

<BR>

<!-- body -->
		<div id="carousel-generic" class="carousel slide">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-generic" data-slide-to="1"></li>
				<li data-target="#carousel-generic" data-slide-to="2"></li>
				<li data-target="#carousel-generic" data-slide-to="3"></li>
			</ol>
			<!-- Carousel items -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/img/1.jpg" alt="First slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/img/2.jpg" alt="Second slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/img/3.jpg" alt="Third slide">
				</div>
				<div class="item">
					<img src="${pageContext.request.contextPath}/img/4.jpg" alt="Third slide">
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-generic"
				data-slide="prev"> <img src="${pageContext.request.contextPath}/img/left.png" class="control">
			</a> <a class="right carousel-control" href="#carousel-generic"
				data-slide="next"> <img src="${pageContext.request.contextPath}/img/right.png" class="control">
			</a>
		</div>
		<!--// 캐러셀 부분 끝  -->

<br>

			<!-- Example row of columns -->
			<div id="funArea" class="row">
				<div class="col-lg-4">
					<h2><b>내 가게 관리</h2>
					<p>FOOD-PASS에 등록된 사장님이 운영하시는 매장정보 및 조회까지 가능한 서비스 입니다. 지금 바로 클릭하시면 매장의 모든 관리를 내 손 안에서 해결할 수 있습니다. 
					</p>
					<p>
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/company/myShopList">바로가기 &raquo;</a>
					</p>
				</div>
				<div class="col-lg-4">
					<h2><b>내 가게 테이블 관리</h2>
					<p>FOOD-PASS에 등록된 가게의 테이블을 생성, 조회, 수정 할 수 있는 메뉴입니다. 지금 바로 클릭하시면 매장의 모든 테이블 관리를 내 손 안에서 해결할 수 있습니다. 
					</p>
					<p>
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/company/table/tableList">바로가기 &raquo;</a>
					</p>
				</div>
				<div class="col-lg-4">
					<h2><b>내 가게 메뉴 관리</h2>
					<p>FOOD-PASS에 등록된 사장님 가게의 메뉴를 등록, 조회, 수정 할 수 있는 메뉴입니다. 지금 바로 클릭하시면 매장의 모든 메뉴 관리를 내 손 안에서 해결할 수 있습니다.</p>
					<p>
						<a class="btn btn-primary" href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList">바로가기 &raquo;</a>
					</p>
				</div>
			</div>
			<br>
			<br>

<!-- footer -->
<jsp:include page="./com/FPfooter.jsp"></jsp:include>