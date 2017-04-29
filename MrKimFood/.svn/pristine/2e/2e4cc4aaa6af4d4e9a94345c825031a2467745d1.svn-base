<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="../../com/FPheader.jsp"></jsp:include>

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
	border-top: 2px solid #dddddd;
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
		//form 데이터 초기화
		$("input[name=restaurant_name]").val("");
		$("input[name=address]").val("");
		$("select[name=restaurant_type]").val("");
		$("input[name=openingTime]").val("");
		$("input[name=closingTime]").val("");
		$("#phoneNumber").val("");
		
		//등록버튼 클릭
		$("#registerShopSaveBtn").click(function(){
		
			var phoneNumCheck = true;
			$("input[name=res_phone]").val("");
			
			//사업자 등록번호에 숫자값만 들어가 있는지 체크
			if($("#phoneNumber").val() !=""){
				for(var i=0;i<$("#phoneNumber").val().length;i++){
					var l_char=$("#phoneNumber").val().substr(i,1);
					if( !(l_char.charCodeAt(0)>47 && l_char.charCodeAt(0)<58) ){
						phoneNumCheck = false;
						break;
					}
				}
			}
			
			//전화번호 자리수를 계산하여 중간중간에 '-' 입력
			if( $("#phoneNumber").val() !="" && $("#phoneNumber").val().length > 8 && phoneNumCheck == true){

				if($("#phoneNumber").val().substr(0,2) == "02"){	//지역번호가 02인가??
					if($("#phoneNumber").val().length == 9){
						$("input[name=res_phone]").val($("#phoneNumber").val().substr(0,2)+"-"+
								$("#phoneNumber").val().substr(2,3)+"-"+$("#phoneNumber").val().substr(5,4));
					}else if($("#phoneNumber").val().length == 10){
						$("input[name=res_phone]").val($("#phoneNumber").val().substr(0,2)+"-"+
								$("#phoneNumber").val().substr(2,4)+"-"+$("#phoneNumber").val().substr(6,4));
					}
				
				}else{	// 02외의 지역번호인가??
					if($("#phoneNumber").val().length == 10){
						$("input[name=res_phone]").val($("#phoneNumber").val().substr(0,3)+"-"+
								$("#phoneNumber").val().substr(3,3)+"-"+$("#phoneNumber").val().substr(6,4));
					}else if($("#phoneNumber").val().length == 11){
						$("input[name=res_phone]").val($("#phoneNumber").val().substr(0,3)+"-"+
								$("#phoneNumber").val().substr(3,4)+"-"+$("#phoneNumber").val().substr(7,4));
					}
				}
			}
			console.log($("input[name=res_phone]").val());
			console.log(phoneNumCheck);
			
			if($("input[name=restaurant_name]").val()==""){
				alert("가계이름을 등록해 주세요");
				$("input[name=restaurant_name]").focus();
			}else if($("input[name=address]").val()==""){
				alert("가계 주소를 등록해 주세요.");
				$("input[name=address]").focus();
			}else if($("input[name=restaurant_type]").val()==""){
				alert("업종을 등록하지않았습니다.\n"+
						"업종을 입력해 주세요");
				$("input[name=restaurant_type]").focus();
			}else if($("input[name=openingTime]").val()==""){
				alert("오픈시간을 등록하지않았습니다.\n"+
				"시간을 입력해 주세요");
				$("input[name=openingTime]").focus();
			}else if($("input[name=closingTime]").val()==""){
				alert("마감시간을 등록하지않았습니다.\n"+
				"시간을 입력해 주세요");
				$("input[name=closingTime]").focus();
			}else if($("#phoneNumber").val()=="" || $("#phoneNumber").val().length < 8 || phoneNumCheck==false ){
				alert("전화번호를 올바르게 입력하지 않습니다.\n"+
				"다시 입력해 주세요.");
				$("#phoneNumber").focus();
			}else{
				$("form[name=registerShopForm]").submit();
			}
			
		})
		
		//취소버튼 클릭
		$(".cansoleShopBtn").click(function(){
			window.history.back();
		})
		
	})
</script>

<!-- body -->


<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>

<!-- 내 가게 등록 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 등록</h3>
			<br>
		</div>

		<!-- 내 가게 등록 INPUT 폼 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" name="registerShopForm" role="form" action="${pageContext.request.contextPath}/company/registerShop" method="post">
				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">내 가게 이름</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="restaurant_name">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">내 가게
						주소</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="address">
					</div>
				</div>

				<!-- 업종 분류 SELECT 박스 -->
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">업종 분류</label>
					<div class="col-md-8">
						<select class="form-control" name="restaurant_type" placeholder="업종을 선택해 주세요.">
							<option value=""></option>
							<option value="koreanFood">한식</option>
							<option value="chineseFood">중식</option>
							<option value="japaneseFood">일식</option>
							<option value="americanFood">양식</option>
							<option value="fastFood">패스트푸드</option>
							<option value="etcFood">기타</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">오픈 시간</label>
					<div class="col-md-8">
						<input type="time" class="form-control" name="openingTime">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">마감 시간</label>
					<div class="col-md-8">
						<input type="time" class="form-control" name="closingTime">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">전화번호</label>
					<div class="col-md-8">
						<input type="text" id="phoneNumber" class="form-control" maxlength="11" placeholder="'-' 없이 입력해 주세요.">
						<input type="hidden" name="res_phone">
					</div>
				</div>
				<!-- 수정, 취소 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-8 col-md-offset-5">
							<button type="button" class="btn btn-primary" id="registerShopSaveBtn">등록</button>
							<button type="button" class="btn btn-default cansoleShopBtn">취소</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>
