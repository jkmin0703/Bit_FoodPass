<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		$("#passwordChangeBtn").click(function(){
			
			$("#pwChange_OriginalPw").nextAll().remove();
			$("#pwChange_CheckPw").nextAll().remove();
			
			if($("#pwChange_OriginalPw").val()==""){ //기존 password가 null인지 체크
				$("#pwChange_OriginalPw").after("<br/><p style='color:red;'>비밀번호를 입력해 주시기 바랍니다.</p>");
				$("#pwChange_OriginalPw").focus();
				
			}else{
					var sendData ={
						pw: $("#pwChange_OriginalPw").val()
					};
					console.log(sendData);
					
					//데이터를 String 형태로 변환
					var json_data = JSON.stringify(sendData);
					console.log(json_data);
					
					//Jsonp로 Ajax 통신을 한다.
					$.ajax({
						type:"GET",
						url:"/ajax/loginMember/PwCheck",
						dataType:"jsonp",
						data : {
							"data" : encodeURIComponent(json_data)
						},
						success : function(data) {
							// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
			                 console.log(data);
							if(data.hasPw === true){
								console.log("password 일치: O");
								
								if($("#pwChange_ChangePw").val()=="" && $("#pwChange_CheckPw").val()==""){ //변경 password가 null인지 체크
									$("#pwChange_CheckPw").after("<br/><p style='color:red;'>변경하실 비밀번호를 입력해 주세요.</p>");
									$("#pwChange_ChangePw").focus();
									
								}else if($("#pwChange_ChangePw").val()=="" || $("#pwChange_CheckPw").val()=="" || 
										$("#pwChange_ChangePw").val() != $("#pwChange_CheckPw").val()){ //변경 password 값이 다른지 체크
									$("#pwChange_ChangePw").val("");
									$("#pwChange_CheckPw").val("");
									$("#pwChange_CheckPw").after("<br/><p style='color:red;'>비밀번호가 일치하지 않습니다. 비밀번호를 올바르게 입력해 주십시오.</p>");
									$("#pwChange_ChangePw").focus();
									
								}else{
									$("form[name=pwChangeForm]").eq(0).submit();
								}

							}else{
								console.log("password 일치: X");
								$("#pwChange_OriginalPw").after("<br/><p style='color:red;'>비밀번호가 일치하지 않습니다.</p>");
								$("#pwChange_OriginalPw").focus();
							}
			           },
			           error : function(xhr, status, error) {
			                 alert("에러발생");
			           }
					});
				}
		})
		
		$(".closeBtn").click(function(){
			window.history.go(-1);
		})
	});
</script>
<!-- body -->


<!-- SideBar -->
<jsp:include page="../com/FPsideBarMyInfo.jsp"></jsp:include>

<!-- 내 비밀번호 변경하기 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 비밀번호 변경</h3>
			<br>
		</div>

		<!-- 내 정보 확인 INPUT 폼 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form"  name="pwChangeForm" 
				action="${pageContext.request.contextPath}/passwordChange" method="post">
				<div class="form-group">
					<label for="password" class="col-md-3 control-label">기존의 비밀번호</label>
					<div class="col-md-8">
						<input type="password" id="pwChange_OriginalPw" class="form-control" placeholder="비밀번호를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-md-3 control-label" >변경 된 비밀번호</label>
					<div class="col-md-8">
						<input type="password" id="pwChange_ChangePw" class="form-control" name="pw" placeholder="변경된 비밀번호를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-md-3 control-label" >비밀번호 확인</label>
					<div class="col-md-8">
						<input type="password" id="pwChange_CheckPw" class="form-control" placeholder="변경된 비밀번호를 다시 한번 입력하세요.">
					</div>
				</div>
								
				<!-- 확인, 취소 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" id="passwordChangeBtn" class="btn btn-primary">변경</button>
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