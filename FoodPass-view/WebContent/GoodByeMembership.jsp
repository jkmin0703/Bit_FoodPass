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

footer.prodcthead {
	margin-top: 58%;
}

.height{
margin-top: 100px
}

</style>

<!-- body -->



<div class="height">
<!--  회원 가입 축하 메세지 그리드 -->
<div class="col-md-8 col-md-offset-3">

	<!-- 회원 가입 축하 메세지 이미지 파일-->

	<img src="./img/outMembership.jpg" width="480px" height="209px">
	<br>
	<br>

	<!-- 회원 가입 확인 버튼 -->

	<div class="col-md-6 col-md-offset-1">

		<a href="main2.jsp"><button type="button"
				class="btn btn-primary btn-md btn-block">확 인</button></a>
	</div>
</div>
</div>


<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>