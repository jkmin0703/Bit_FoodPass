<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
<jsp:include page="../com/header.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
</head>
<body>

<form name="modify" action="${pageContext.request.contextPath}/modify"
	method="post">

	<input type="hidden" name="memberId" value="${member.memberId}" />
	<input type="hidden" name="regDate" value="${member.regDate}" />	

	<br>
	<table align="center">
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="${member.id}" readonly="readonly" /></td>
		</tr>
		<tr>
			<td>법인명</td>
			<td><input type="text" name="businessName" value="${member.businessName}" /></td>
		</tr>
		
		<tr>
			<td>대표자명</td>
			<td><input type="text" name="presidant" value="${member.presidant}" /></td>
		</tr>
		<tr>
			<td>사업자등록번호</td>
			<td><input type="text" name="licenseNum" value="${member.licenseNum}" size="10" maxlength="10" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="pw" value="${member.pw}" /></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			<td><input type="password" name="pwConfirm" value="${member.pw}" /></td>
		</tr>
		<br>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="정보 수정" />
				<input type="reset" value="입력 초기화" />
				<input type="button" value="수정 취소" onclick="history.back();" />
			</td>
		</tr>
	</table>
	<br>
</form>

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

<script type="text/javascript">
	$(document).ready(function(){
		
		$("#memberModifyBtn").click(function(){
			
			var licenseNumCheck = true;
			
			//사업자 등록번호에 숫자값만 들어가 있는지 체크
			if($("#modify_licenseNum").val() !=""){ 
				for(var i=0;i<$("#modify_licenseNum").val().length;i++){
					var l_char=$("#modify_licenseNum").val().substr(i,1);
					if( !(l_char.charCodeAt(0)>47 && l_char.charCodeAt(0)<58) ){
						licenseNumCheck = false;
						break;
					}
				}
			}
			
			if($("#modify_businessName").val()==""){
				alert("법인명을 입력하지 않았습니다. \n"+
					"법인명을 입력해 주세요.");
				$("#modify_businessName").focus();
			}else if($("#modify_licenseNum").val()=="" || $("#modify_licenseNum").val().length!=10 || licenseNumCheck == false){
				alert("사업자 등록번호를 올바로 입력하지 않았습니다.\n"+
					"사업자 등록번호를 다시 입력해 주세요.");
				$("#modify_licenseNum").focus();
			}else if( $("#modify_presidant").val()==""){
				alert("대표자 명을 입력해 주세요.");
				$("#modify_presidant").focus();
			}else{
				$("form[name=modify]").eq(0).submit();
			}
		})
		
		$("button.closeBtn").click(function(){
			window.history.go(-2); //2번 뒤로 가도록
		})
	});
</script>

<!-- body -->


<!-- SideBar -->
<jsp:include page="../com/FPsideBarMyInfo.jsp"></jsp:include>

<!-- 내 정보 수정 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 정보 수정</h3>
			<br>
		</div>

		<!-- 회원정보 INPUT 폼 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form" name="modify" 
				action="${pageContext.request.contextPath}/modify" method="post">
				
				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">ID</label>
					<div class="col-md-8">
						<input type="text" id="modify_id" class="form-control" name="id" value="${member.id}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label for="text" class="col-md-3 control-label">법인명</label>
					<div class="col-md-8">
						<input type="text" id="modify_businessName" class="form-control" name="businessName" value="${member.businessName}">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">사업자 등록번호</label>
					<div class="col-md-8">
						<input type="text" id="modify_licenseNum" class="form-control" name="licenseNum" value="${member.licenseNum}" maxlength="10">
					</div>
				</div>
				<div class="form-group">
					<label for="text" class="col-md-3 control-label">대표자 명</label>
					<div class="col-md-8">
						<input type="text" id="modify_presidant" class="form-control" name="presidant" value="${member.presidant}">
					</div>
				</div>
				
				<!-- 수정, 확인 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" id="memberModifyBtn" class="btn btn-primary">수정</button>
							<button type="button" class="btn btn-default closeBtn">취소</button>
						</div>
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