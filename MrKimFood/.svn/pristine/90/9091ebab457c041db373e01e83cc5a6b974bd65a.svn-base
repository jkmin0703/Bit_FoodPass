<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="FPheader.jsp"></jsp:include>

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

/*20141231 - 나진수: sideBar 관련 css*/
.sideimage {
	margin-top: 3px;
	margin-left: -2px;
}

/* #hightSpace{
	height: 30px;
} */

</style>

<script type="text/javascript">
	$(document).ready(function(){

		$("#passwordCheckBtn").click(function(){
			if($("#inputPassword").val()==""){
				$("#inputPassword").nextAll().remove();
				$("#inputPassword").after("<br/><p>비밀번호를 입력해 주시기 바랍니다.</p>");
			}else{

				var sendData = {
						pw : $("#inputPassword").val()
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
								$("#inputPassword").nextAll().remove();
								location.href="${pageContext.request.contextPath}${models.goPath}";
							}else{
								console.log("password 일치: X");
								$("#inputPassword").nextAll().remove();
								$("#inputPassword").after("<br/><p style='color:red;'>Password가 일치하지 않습니다.</p>");
							}
			           },
			           error : function(xhr, status, error) {
			                 alert("에러발생");
			           }
					});
			}
		})
		
		$("button.closeBtn").click(function(){
			window.history.back();
		})
	})
</script>

<div class="tablebody">
	<div class="col-md-2" id="myScrollspy">
			<!-- 나진수: 상단에 공간을 만들기 위해 생성한 space용 DIV -->
			
			<!-- 왼쪽 구글 앱 스토어, 애플 앱 스토어, 윈도우 이미지 -->
			<img class="sideimage" alt="" src="${pageContext.request.contextPath}/img/AndroidApp.jpg">
			<img class="sideimage" alt="" src="${pageContext.request.contextPath}/img/AppStore.jpg"> 
			<img class="sideimage" alt="" src="${pageContext.request.contextPath}/img/window8.jpg">
		</div>
	</div>

<!-- body -->

<!-- 내 비밀번호 변경하기 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 비밀번호 확인</h3>
			<br>
		</div>

		<!-- 내 정보 확인 INPUT 폼 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<div class="form-group">
					<label for="password" class="col-md-3 control-label">비밀번호</label>
					<div class="col-md-8">
						<input type="password" class="form-control" id="inputPassword" placeholder="비밀번호를 입력하세요.">
					</div>
				</div>
				<!-- 확인, 취소 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" id="passwordCheckBtn" class="btn btn-primary">확인</button>
							<button type="button" class="btn btn-default closeBtn">취소</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- SideBanner -->
<jsp:include page="FPbanner.jsp"></jsp:include>
<!-- footer -->
<jsp:include page="FPfooter.jsp"></jsp:include>