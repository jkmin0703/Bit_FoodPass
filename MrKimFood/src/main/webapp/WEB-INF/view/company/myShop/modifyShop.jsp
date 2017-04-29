<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<%--
<jsp:include page="../../com/header.jsp"></jsp:include>

<!-- open 시간 분할 -->
<c:set var="openingTime"  value="${models.shopInfo.openingTime}" />
<c:set var="strOpenHour" value="${fn:substringBefore(openingTime,':')}"/>
<c:set var="strOpenMin" value="${fn:substringAfter(openingTime,':')}"/>
<fmt:parseNumber var="openHour" type="number" value="${strOpenHour}"/>
<!-- close 시간 분할 -->
<c:set var="closingTime"  value="${models.shopInfo.closingTime}" />
<c:set var="strCloseHour" value="${fn:substringBefore(closingTime,':')}"/>
<c:set var="strCloseMin" value="${fn:substringAfter(closingTime,':')}"/>
<fmt:parseNumber var="closeHour" type="number" value="${strCloseHour}"/>
<!-- 매장 번호 분할 -->
<c:set var="phoneNumber" value="${fn:split(models.shopInfo.res_phone,'-')}"/>


<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script type="text/javascript">
	function modifyShopSubmit(){
		var opinHour=Number(document.getElementById('openHour').value);
		if(document.getElementById('openingDayNight').value=="PM"){
			opinHour+= 12;
		}
		document.getElementsByName('openingTime')[0].value = opinHour +':'+
		document.getElementById('openMin').value;
		//alert(document.getElementsByName('openingTime')[0].value);
		
		var closeHour=Number(document.getElementById('closeHour').value);
		if(document.getElementById('closingDayNight').value=="PM"){
			closeHour+= 12;
		}
		document.getElementsByName('closingTime')[0].value = closeHour +':'+
		document.getElementById('closeMin').value;
		//alert(document.getElementsByName('closingTime')[0].value);

		document.getElementsByName('res_phone')[0].value = 
			document.getElementById('telAreaCode').value+"-"+
			document.getElementById('tel1').value+"-"+
			document.getElementById('tel2').value;
		
		//alert(document.getElementsByName('res_phone')[0].value);
		document.getElementsByName("modifyShopForm")[0].submit();
	}
</script>


<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"></jsp:include>


	<div id="content">
		Modify페이지<br/><br/>
		<form name="modifyShopForm" action="${pageContext.request.contextPath}/company/modifyShop/${models.shopNo}" method="post">
		
		<!-- 서버로 넘어가는 정보 -->
		<input type="hidden" name="restaurant_ID"/>
		<input type="hidden" name="openingTime"/>
		<input type="hidden" name="closingTime"/>
		<input type="hidden" name="res_phone">
		
		음식점 이름:<input type="text" name="restaurant_name" value="${models.shopInfo.restaurant_name}"/><br/>
		음식점 주소:<input type="text" name="address" value="${models.shopInfo.address}"/><br/>
		
		업종 분류:
		<select name="restaurant_type">
			<option value="koreanFood" <c:if test="${models.shopInfo.restaurant_type=='koreanFood'}">selected="selected"</c:if>>한식</option>
			<option value="americanFood" <c:if test="${models.shopInfo.restaurant_type=='americanFood'}">selected="selected"</c:if>>양식</option>
			<option value="japaneseFood" <c:if test="${models.shopInfo.restaurant_type=='japaneseFood'}">selected="selected"</c:if>>일식</option>
			<option value="fastFood" <c:if test="${models.shopInfo.restaurant_type=='fastFood'}">selected="selected"</c:if>>페스트푸드</option>
		</select><br/>
		
		영업 시간:
		<select id="openingDayNight">
			<option value="AM" <c:if test="${!(openHour>12)}">selected="selected"</c:if> >AM</option>
			<option value="PM" <c:if test="${openHour>12}">selected="selected"</c:if> >PM</option>
		</select>&nbsp;
		<input type="text" id="openHour" size="2" maxlength="2" value="${openHour>12 ? openHour-12 : openHour }"/> : 
		<input type="text" id="openMin" size="2" maxlength="2" value="${strOpenMin}"/><br/>
		
		마감 시간:
		<select id="closingDayNight">
			<option value="AM" <c:if test="${!(closeHour>12)}">selected="selected"</c:if> >AM</option>
			<option value="PM" <c:if test="${closeHour>12}">selected="selected"</c:if> >PM</option>
		</select>&nbsp;
		<input type="text" id="closeHour" size="2" maxlength="2" value="${closeHour>12 ? closeHour-12 : closeHour }"/> :
		<input type="text" id="closeMin" size="2" maxlength="2" value="${strCloseMin}"/><br/>
		
		전화번호:<select id="telAreaCode">
			<option value="02" <c:if test="${phoneNumber[0]=='02'}">selected="selected"</c:if> >02</option>
			<option value="031" <c:if test="${phoneNumber[0]=='031'}">selected="selected"</c:if> >031</option>
			<option value="033" <c:if test="${phoneNumber[0]=='033'}">selected="selected"</c:if> >033</option>
		</select> - 
		<input type="text" id="tel1" size="3" maxlength="4" value="${phoneNumber[1]}" /> - 
		<input type="text" id="tel2" size="3" maxlength="4" value="${phoneNumber[2]}"/>
		<br/><br/><br/>
		
		<input type="button" value="수정" onclick="modifyShopSubmit()"/>
		<input type="button" value="취소" onclick="location.href='${pageContext.request.contextPath}/company/myShop/${models.shopNo}'"/>
		</form>
	</div>
</div>

<jsp:include page="../../com/footer.jsp"></jsp:include>
 --%>
 
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
.row {
	padding-left: 30px;
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

.buttomgroup1 {
	margin-top: 25px;
}

footer.prodcthead {
	margin-top: 72%;
}

.row1 {
	margin-bottom: 28px;
}


</style>

<!-- 스크립트 -->
<script type="text/javascript">
	$(document).ready(function(){
		
		//form 데이터 초기화
		$("input[name=restaurant_name]").val("");
		$("input[name=address]").val("");
		$("select[name=restaurant_type]").val("");
		$("input[name=openingTime]").val("");
		$("input[name=closingTime]").val("");
		$("#phoneNumber").val("");
		
		//가계정보 selectBar변화가 일어날 경우 발생하는 이벤트
		$("select.shopInfoSideBar").change(function(e){
			//기존페이지를 새로운 페이지로 변경
			location.replace("${pageContext.request.contextPath}/company/modifyShop?shopNo="+$(this).val());

			//[test] select 태그의 문자열만 선택
			//var a = document.getElementsByTagName('option');
			//for(var i=0; i<a.length; i++) {
			//	if(a[i].value ==  $(this).val()){
			//		console.log(a[i].text);
			//	}
			//}
		});
		
		
		$("#modifyShopSaveBtn").click(function(){
			
			$("input[name=res_phone]").val("");
			
			//데이터가  하나도 입력되지 않을 경우.
			if($("input[name=restaurant_name]").val()=="" && $("input[name=address]").val()=="" &&
					$("select[name=restaurant_type]").val()=="" && $("input[name=openingTime]").val()=="" &&
					$("input[name=closingTime]").val()=="" && $("#phoneNumber").val()==""){
				alert("수정할 데이터를 하나 이상 입력하여 주십시오.");
			
			}else{
				
				var phoneNumCheck = true;
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
				
				if(!( $("#phoneNumber").val()=="" || ( 
						( $("#phoneNumber").val().substr(0,2) == "02" && $("#phoneNumber").val().length > 8 && $("#phoneNumber").val().length < 11 && phoneNumCheck==true ) ||
						( $("#phoneNumber").val().substr(0,2) != "02" && $("#phoneNumber").val().length > 9 && $("#phoneNumber").val().length < 12 && phoneNumCheck==true ) )
					) ){
						alert("전화번호를 올바르게 입력하지 않습니다.\n"+
						"다시 입력해 주세요.");
						$("#phoneNumber").focus();
				}else{
					$("form[name=modifyShopForm]").submit();
				}
				
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

<div class="col-md-8">

	<!-- 내 가게 정보 -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 정보</h3>
		</div>
		<br>

		<!-- 내 가게 목록 SELECT 박스 -->
		<div class="row1">
			<div class="col-md-3">
				<select class="form-control shopInfoSideBar">
					<!-- 회원이 관리하는 shop 개수만큼 반복문 실행 -->
					<c:forEach items="${models.selectBarList}" var="shopSelectBarList">
						<!-- 해당 shop이 선택되어지도록 처리 -->
						<c:choose>
							<c:when	test="${models.shopNo == shopSelectBarList.restaurant_ID}">
								<option value="${shopSelectBarList.restaurant_ID}"
									selected="selected">
									${shopSelectBarList.restaurant_name }</option>
							</c:when>
							<c:otherwise>
								<option value="${shopSelectBarList.restaurant_ID}">
									${shopSelectBarList.restaurant_name }</option>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</select>
			</div>
		</div>

		<!-- 내 가게 목록 테이블 -->
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-bordered">
					<tbody>
						<tr>
							<td class="text-center gr"><strong>내 가게 이름</strong></td>
							<td>${models.shopInfo.restaurant_name }</td>
							<td class="text-center gr"><strong>전화번호</strong></td>
							<td>${models.shopInfo.res_phone}</td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>내 가게 분류</strong></td>
							<td>${models.shopInfo.restaurant_type}</td>
							<td class="text-center gr"><strong>오픈 시간</strong></td>
							<td>${models.shopInfo.openingTime}</td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>내 가게 주소</strong></td>
							<td>${models.shopInfo.address}</td>
							<td class="text-center gr"><strong>종료 시간</strong></td>
							<td>${models.shopInfo.closingTime}</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- 내 가게 정보 수정 박스 -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 정보 수정</h3>
			<br>
		</div>

		<!-- 내 가게 정보 수정 INPUT 폼 그룹 -->
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form" name="modifyShopForm" action="${pageContext.request.contextPath}/company/modifyShop" method="post">
				<input type="hidden" name="shopNo" value="${models.shopNo}" />
				
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

				<!-- 내 가게 업종 분류 SELECT 폼 -->
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
							<button type="button" class="btn btn-primary" id="modifyShopSaveBtn">수정</button>
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
