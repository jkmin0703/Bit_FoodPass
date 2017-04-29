<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FOOD-PASS</title>

<script src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/respond.js"></script>
<script src="${pageContext.request.contextPath}/lib/jquery-1.11.2.min.js"></script>

<link rel="icon" href="${pageContext.request.contextPath}/css/mycss/food-PassFavicons.ico">

<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/css/nomalize.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/img/com/food-PassFavicons.ico" rel="icon">

<!-- 개인 작성 -->
<script src="${pageContext.request.contextPath}/lib/ajax/com_ajax.js"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">
	$(document).ready(function(){
		
		var hasId = false;
		
		//idCheck 변수를 클릭
		$("#ID").focusout(function(){
			// json 형태의 데이터를 담는다.
			if($("#ID").val() == ""){
				$("#IdStateInfo").empty();
				$("#IdStateInfo").html("<p style='color:red;'>아이디를 입력해 주시기 바랍니다.<p>");
			}else{
			
				var sendData = {
					id : $("#ID").val()
				};
				console.log(sendData);
				
				//데이터를 String 형태로 변환
				var json_data = JSON.stringify(sendData);
				console.log(json_data);
				
				//Jsonp로 Ajax 통신을 한다.
				$.ajax({
					type:"GET",
					url:"/ajax/member/IdCheck",
					dataType:"jsonp",
					data : {
						"data" : encodeURIComponent(json_data)
					},
					success : function(data) {
						// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
		                 console.log(data);
						if(data.hasId === true){
							console.log("아이디: O");
							$("#IdStateInfo").empty();
							$("#IdStateInfo").html("<p style='color:red;'>해당 아이디는 이미 사용중입니다.<p>");
							hasId = true;
						}else{
							console.log("아이디: X");
							$("#IdStateInfo").empty();
							$("#IdStateInfo").html("<p>사용 가능한 아이디 입니다.<p>");
							hasId = false;
						}
		           },
		           error : function(xhr, status, error) {
		                 alert("에러발생");
		           }
				});
			}
		})
		
		//회원가입 버튼을 클릭
		$("#signUp_saveBtn").click(function(){

			var licenseNumCheck = true;
			
			//사업자 등록번호에 숫자값만 들어가 있는지 체크
			if($("#licenseNum").val() !=""){ 
				for(var i=0;i<$("#licenseNum").val().length;i++){
					var l_char=$("#licenseNum").val().substr(i,1);
					if( !(l_char.charCodeAt(0)>47 && l_char.charCodeAt(0)<58) ){
						licenseNumCheck = false;
						break;
					}
				}
			}
			
			//조건문 실행 실행
			if($("#ID").val()==""){
				alert("아이디를 입력해 주시기 바랍니다.");
				$("#ID").focus();
			}else if(hasId == true){
				alert("이미 사용중인 아이디입니다.\n"+
					"다른 아이디를 입력해 주시기 바랍니다.");
				$("#ID").focus();
			}else if($("#Password").val() =="" || $("#PasswordCheck").val()=="" || $("#Password").val() !== $("#PasswordCheck").val()){
				alert("비밀번호가 일치하지 않습니다. \n"+
					"비밀번호를 올바르게 입력해 주십시오.");
				$("#Password").val("");
				$("#PasswordCheck").val("");
				$("#Password").focus();
			}else if($("#businessName").val()==""){
				alert("법인명을 입력하지 않았습니다. \n"+
					"법인명을 입력해 주세요.");
				$("#businessName").focus();
			}else if($("#licenseNum").val()=="" || $("#licenseNum").val().length!=10 || licenseNumCheck == false){
				alert("사업자 등록번호를 올바로 입력하지 않았습니다.\n"+
					"사업자 등록번호를 다시 입력해 주세요.");
				$("#licenseNum").focus();
			}else if( $("#presidant").val()==""){
				alert("대표자 명을 입력해 주세요.");
				$("#presidant").focus();
			}else{
				$("#signUpForm").submit();
			}
		})
	});
	
	function initRegMember(){
		$("#ID").val("");
		$("#IdStateInfo").empty();
		$("#Password").val("");
		$("#PasswordCheck").val("");
		$("#businessName").val("");
		$("#licenseNum").val("");
		$("#presidant").val("");
	}
</script>

</head>
<body>
	<div class="container">
		<header class="prodcthead">
		<h1>
			<b><a href="${pageContext.request.contextPath}/">FOOD-PASS</a></b>
		</h1>
		<div class="sns pull-right">
			<ul>
				<li><a href="${pageContext.request.contextPath}/" class="foodpass">홈</a></li>
				<c:if test="${ empty member.id }">
				<li><a href="${pageContext.request.contextPath}/login" class="foodpass">로그인</a></li>
				<li><a href="#signUpModal" class="foodpass" data-toggle="modal" onclick="initRegMember()">회원가입</a></li>
				</c:if>
				<c:if test="${ not empty member.id }">
				<li><a href="${pageContext.request.contextPath}/logout" class="foodpass">로그아웃</a></li>
				<li><a href="${pageContext.request.contextPath}/company/myShopList" class="foodpass">내 가게</a></li>
				<li><a href="${pageContext.request.contextPath}/myPage" class="foodpass">내 정보</a></li>
				</c:if>
				<li><a href="${pageContext.request.contextPath}/company/customerCenter/FAQ" class="foodpass">고객센터</a></li>
			</ul>
		</div>
		</header>
		<br>
		
		 <div class="modal fade" id="signUpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		        <h4 class="modal-title"><b>Membership Join</b></h4>
		      </div>
		      <div class="modal-body">
		      		<br/><br/>
					<div class="row" style="margin-left:-15px;">
					
						<form id="signUpForm" class="form-horizontal" role="form" action="${pageContext.request.contextPath}/signUp" method="post">
							<div class="form-group">
								<label for="ID" class="col-lg-3 control-label">ID</label>
								<div class="col-lg-8">
									<input type="text" id="ID" class="form-control" name="id" placeholder="ID" maxlength="10">
								</div>
							</div>
							<div class="form-group">
								<label for="IdStateInfo" class="col-lg-3 control-label"></label>
								<div	class="col-lg-9" id="IdStateInfo"></div>
							</div>
							<div class="form-group">
								<label for="Password" class="col-lg-3 control-label">Password</label>
								<div class="col-lg-8">
									<input type="password" id="Password" class="form-control" name="pw" placeholder="Password" maxlength="10">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-8 col-md-offset-3">
									<input type="password" id="PasswordCheck" class="form-control" placeholder="Password 확인" maxlength="10">
								</div>
							</div>
							<div class="form-group">
								<label for="businessName" class="col-lg-3 control-label">법인 명</label>
								<div class="col-lg-8">
									<input type="text" id="businessName" class="form-control" name="businessName" placeholder="법인명" maxlength="20">
								</div>
							</div>
							<div class="form-group">
								<label for="licenseNum" class="col-lg-3 control-label">사업자 등록번호</label>
								<div class="col-lg-8">
									<input type="text" id="licenseNum" class="form-control" name="licenseNum" placeholder="사업자 등록번호 10자리 ( - 생략)" maxlength="10">
								</div>
							</div>
							<div class="form-group">
								<label for="presidant" class="col-lg-3 control-label">대표자 명</label>
								<div class="col-lg-8">
									<input type="text" id="presidant" class="form-control" name="presidant" placeholder="대표자 명" maxlength="20">
								</div>
							</div>
						</form>
						
					</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" id="signUp_saveBtn" class="btn btn-primary">Save changes</button>
		        <button type="button" id="signUp_closeBtn" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->