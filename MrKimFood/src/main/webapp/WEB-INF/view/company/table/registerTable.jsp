<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<%--
<jsp:include page="../../com/header.jsp"/>

<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"/>

	<div id="content">
		<form name="registerTableForm" action="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/registerTable" method="post">
			테이블 개수 입력: <input type="text" name="tableCount"/><br/><br/>
			<input type="submit" value="테이블 등록">
		</form>
	</div>

</div>
<jsp:include page="../../com/footer.jsp"/>
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
.row1 {
	margin-top: 15px;
	margin-left: -1px;
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

.pagenavigation {
	margin-top: -15px;
}

.row2 {
	margin-top: 20px;
	margin-left: -14px;
}

.form-group{
margin-left: -15px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$("select.shopInfoSideBar").change(function(){
			location.replace("${pageContext.request.contextPath}/company/table/registerTable?shopNo="+$(this).val());
		})
		
		//테이블수정 inputBox에서 Enter Key입력 -> form이 동작하는 현상이 발생
		//: 테이블수정 InputBox에서 Enter Key가 입력되지 않도록 수정
		$("input[name=tableCount]").bind("keypress", function (e) {
		    if (e.keyCode == 13) {
		        return false;
		    }
		}); 
		
		$("#registerTableBtn").click(function(){

			var tableCountNumCheck = true;
			if($("input[name=tableCount]").val() !=""){
				for(var i=0;i<$("input[name=tableCount]").val().length;i++){
					var l_char=$("input[name=tableCount]").val().substr(i,1);
					if( !(l_char.charCodeAt(0)>47 && l_char.charCodeAt(0)<58) ){
						tableCountNumCheck = false;
						break;
					}
				}
			}
			
			if($("input[name=tableCount]").val() ==""){
				alert("테이블 개수를 입력해 주세요.");
				$("input[name=tableCount]").focus();
			}else if(tableCountNumCheck == false){
				alert("테이블 개수를 잘못 입력하셨습니다.\n"+
						"다시 입력해 주세요.");
				$("input[name=tableCount]").focus();
			}else{
				$("form[name=registerTbaleForm]").submit();
			}
		})
	});
</script>

<!-- body -->

<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>

<!-- 내 가게 테이블 등록 INPUT 박스 및  테이블 등록 확인 자바스크립트 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 테이블 등록 / 수정</h3>
			<br>
		</div>

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
		<br> <br>

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
			<br>

				<!-- 내 가게 테이블 수정 INPUT 박스 및  테이블 등록 확인 자바스크립트 -->

				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">내 가게 테이블 등록/수정</label>
					<br>
					<form class="form-horizontal" name="registerTbaleForm" role="form" action="${pageContext.request.contextPath}/company/table/registerTable" method="post">
						<input type="hidden" name="shopNo" value="${models.shopNo}"/>
						<div class="col-md-10">
							<input type="text" class="form-control" name="tableCount"
								placeholder="가게 테이블 개수를 입력하세요.">
						</div>
	
						<div class="col-md-2">
							<button type="button"  id="registerTableBtn"
								class="btn btn-primary btn-sm">등록/수정</button>
							<br> <br><br>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>