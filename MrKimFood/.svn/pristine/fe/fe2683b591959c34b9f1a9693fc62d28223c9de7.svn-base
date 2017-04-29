<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
<jsp:include page="../com/header.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지</title>
</head>
<body>
<br>
<table align="center">
		<tr>
			<td colspan="2">아이디</td>
			<td>${member.id}</td>
		</tr>
		<tr>
			<td colspan="2">사업자 등록 번호</td>
			<td>${member.licenseNum}</td>
		</tr>
		<tr>
			<td colspan="2">대표자명</td>
			<td>${member.presidant}</td>
		</tr>
		<tr>
			<td colspan="2">법인명</td>
			<td>${member.businessName}</td>
		</tr>
		<tr>
			<td colspan="2">가입일</td>
			<td>${member.regDate}</td>
		</tr>
	</table>
	
	<br/>
	
	<p align="right">
		<a href="${pageContext.request.contextPath}/modify">회원 정보 수정</a>
	</p>
</body>
</html>

<jsp:include page="../com/footer.jsp"/>
 --%>
 
 
<!-- header -->
<jsp:include page="../com/FPheader.jsp"></jsp:include>

<!-- mycss -->
<link href="${pageContext.request.contextPath}/css/mycss/body_container.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/mycss/header_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/mycss/footer_prodcthead.css" rel="stylesheet"
	type="text/css">

<link href="${pageContext.request.contextPath}/css/kfonts2.css" rel="stylesheet" type="text/css">

<style>
.memberInfo{
	padding-top: 7px;
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

.buttomgroup1 {
	margin-top: 25px;
}
</style>


<!-- body -->


<!-- SideBar -->
<jsp:include page="../com/FPsideBarMyInfo.jsp"></jsp:include>

<!-- 내 정보 확인 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 정보 확인</h3>
			<br>
		</div>

		<!-- 내 정보 확인 INPUT 폼 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">ID</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${member.id}" disabled>
					</div>
				</div>				
				<div class="form-group">
					<label for="text" class="col-md-3 control-label">법인명</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${member.businessName}" disabled>
					</div>
				</div>				
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">사업자 등록번호</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${member.licenseNum}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label for="text" class="col-md-3 control-label">대표자 명</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${member.presidant}" disabled>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- SideBanner -->
<jsp:include page="../com/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="../com/FPfooter.jsp"></jsp:include>