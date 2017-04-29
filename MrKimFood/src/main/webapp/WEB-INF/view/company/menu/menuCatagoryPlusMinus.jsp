<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
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

.buttomgroup2 {
	margin-top: -25px;
	s
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

.row1 {
	
	margin-bottom: 28px;
}

footer.prodcthead {
	margin-top: 74%;
}
</style>

<!-- body -->
<script type="text/javascript">
	$(document).ready(function(){
		//console.log($("input:text[name=foodClassifyName]"));
		
		//select바가 변할 경우 가계정보 변환
		$("select.shopInfoSideBar").change(function(){
			location.replace("${pageContext.request.contextPath}/company/foodMenu/catagory?shopNo="+$(this).val());
		})
		
		
		
		//inputBox에서 enter을 안먹게 하는 이벤트
		$("input:text[name=foodClassifyName]").bind("keypress", function (e) {
			if (e.keyCode == 13) {
		        return false;
		    }
		})
		
		//가게 추가 버튼을 누를 때
		$("#registerMenuCatagiryBtn").click(function(){
			if($("input:text[name=foodClassifyName]").val() == ""){
				alert("추가하실 메뉴 카테고리 내용을 입력해 주세요.");
				$("input:text[name=foodClassifyName]").focus();
			}else{
				$("form[name=registerMenuCatagoryForm]").submit();
			}
		})
		
		//select바를 사용하여 삭제할 카테고리를 선택 할때
		$("#deleteMenuCatagoryBtn").click(function(){
			
			if($("select[name=foodClassifyId]").val()=="selectGo"){
				alert("삭제할 카테고리를 선택하여 주세요.");
				$("select[name=foodClassifyId]").focus();
			}else{
				if(confirm("선택한 메뉴를 삭제하시겠습니까?")) {
				    $("form[name=deleteMenuCatagoryForm]").submit();
				} else {
				    // Do nothing!
				}
			}
		})
		
		//취소 버튼 누를때 이벤트
		$(".cancelBtn").click(function(){
			window.history.go(-1);
		})
	});
</script>

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

<!-- 내 가게 메뉴 카테고리 추가  -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 카테고리 추가</h3>
			<br>
		</div>

		<!-- 내 가게 메뉴 카테고리 추가 INPUT 폼 그룹 -->
		<form class="form-horizontal" role="form" name="registerMenuCatagoryForm" action="${pageContext.request.contextPath}/company/foodMenu/catagory/register" method="post">
			<input type="hidden" name="shopNo" value="${models.shopNo}"/>
			<div class="panel-body">
				<br>
					<div class="form-group">
						<label for="ID" class="col-md-3 control-label">메뉴 카테고리 추가</label>
						<div class="col-md-8">
							<input type="text" class="form-control" name="foodClassifyName"
								placeholder="원하시는 메뉴 카테고리를 입력하세요.">
						</div>
					</div>
	
				<!-- 내 가게 메뉴 카테고리 추가, 취소 버튼 그룹 -->
				<div class="buttomgroup2">
					<div class="form-group">
						<div class="row2">
							<div class="col-md-8 col-md-offset-5">
								<br><br>
								<button type="button" id="registerMenuCatagiryBtn" class="btn btn-primary">추가</button>
								<button type="button" class="btn btn-default cancelBtn">취소</button>
								<br><br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
	</div>


	<!-- 내 가게 메뉴 카테고리 삭제 SELECT 폼 -->

	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 카테고리 삭제</h3>
			<br>
		</div>
		<form class="form-horizontal" role="form" name="deleteMenuCatagoryForm" action="${pageContext.request.contextPath}/company/foodMenu/catagory/delete" method="post">
			<input type="hidden" name="shopNo" value="${models.shopNo}"/>
			<div class="panel-body">
				<br>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">메뉴 카테고리 삭제</label>
					<div class="col-md-8">
						<select class="form-control menuCatagoryBar" name="foodClassifyId">
							<option value="selectGo">삭제할 카테고리를 선택하세요.</option>
							<c:forEach items="${models.menuCatagoryList}" var="menuCatagoryBarList">
								<option value="${menuCatagoryBarList.foodClassifyId}">${menuCatagoryBarList.foodClassifyName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
	
				<!-- 내 가게 메뉴 카테고리 삭제, 취소 버튼 그룹 -->
				<div class="buttomgroup2">
					<div class="form-group">
						<div class="row2">
							<div class="col-md-8 col-md-offset-5">
								<br><br>
								<button type="button" id="deleteMenuCatagoryBtn" class="btn btn-primary">삭제</button>
								<button type="button" class="btn btn-default cancelBtn">취소</button>
								<br><br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
	</div>
</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>