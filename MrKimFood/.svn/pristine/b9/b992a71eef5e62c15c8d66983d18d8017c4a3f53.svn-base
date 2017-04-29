<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 

<style>

.sideimage {
	margin-top: 3px;
	margin-left: -2px;
}

</style>

<script type="text/javascript">
$(document).ready(function(){

	//sideBar 표시 관련 jquery 처리
	var showSideBar = "${models.checkSideBar}";
	switch (showSideBar) {
		case "myShop":
			$("#collapseOne").addClass("in");
			break;
		case "myTable":
			$("#collapseTwo").addClass("in");
			break;
		case "myFoodMenu":
			$("#collapseThree").addClass("in");
			break;
		case "myOrder":
			$("#collapseFour").addClass("in");
			break;
		case "mySales":
			$("#collapseFive").addClass("in");
			break;
		default:
			break;
	}

})
</script>


<div class="tablebody">
	<div class="col-md-2" id="myScrollspy">

		<div class="panel-group" id="accordion">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne"> 내 가게 관리 </a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse">
					<div class="panel-body">
						<p>
							<a href="${pageContext.request.contextPath}/company/myShopList">내 가게 목록</a>
						</p>
						<p>
							<a href="${pageContext.request.contextPath}/company/registerShop">내 가게 등록</a>
						</p>
						<p>
							<a href="${pageContext.request.contextPath}/company/deleteShop">내 가게 삭제</a>
						</p>
						<p>
							<a href="${pageContext.request.contextPath}/company/modifyShop">내 가게 정보 수정</a>
						</p>
					</div>
				</div>
			</div>


			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo"> 내 가게 테이블 관리 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<p>
							<a href="${pageContext.request.contextPath}/company/table/tableList">내 가게 테이블 목록</a>
						</p>
						<p>
							<a href="${pageContext.request.contextPath}/company/table/registerTable">테이블 등록 / 수정</a>
						</p>
					</div>
				</div>
			</div>


			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseThree"> 내 가게 메뉴 관리 </a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse">
					<div class="panel-body">
						<p>
							<a href="${pageContext.request.contextPath}/company/foodMenu/registerMenu"> 내 가게 메뉴 등록</a>							
						</p>
						<p>
							<a href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList"> 내 가게 메뉴 목록</a>
						</p>					
						<p>
							<a href="${pageContext.request.contextPath}/company/foodMenu/catagory">내 가게 메뉴 카테고리 추가 및 수정</a>
						</p>
					</div>
				</div>
			</div>

			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseFour"> 내 가게 주문 관리 </a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse ">
					<div class="panel-body">
						<p>
							<a href="${pageContext.request.contextPath}/order/orderList">내 가게 주문내역 조회</a>
						</p>
					</div>
				</div>
			</div>
			
			<!-- 내 가게 매출 관리 -->
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseFive"> 내 가게 매출 관리 </a>
					</h4>
				</div>
				<div id="collapseFive" class="panel-collapse collapse">
					<div class="panel-body">
						<p>
							<a href="${pageContext.request.contextPath}/company/sales/day/total">내 가계 일일 매출 현황</a>
						</p>
						<p>
							<a href="chartMonth.jsp">내 가계 기간별 매출 현황</a>
						</p>
					</div>
				</div>
			</div>
			
			<!-- 내 가게 SNS 홍보하기 -->
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseSix"> 내 가게 SNS 홍보</a>
					</h4>
				</div>
				<div id="collapseSix" class="panel-collapse collapse  ">
					<div class="panel-body">
						<p>
							<a href="sendCacao.jsp">SNS 문자 보내기</a>
						</p>						
					</div>
				</div>
			</div>
			<br> 
			
			<img class="sideimage" alt="" src="${pageContext.request.contextPath}/img/AndroidApp.jpg">
			<img class="sideimage" alt="" src="${pageContext.request.contextPath}/img/AppStore.jpg">
			<img class="sideimage" alt="" src="${pageContext.request.contextPath}/img/window8.jpg">
		</div>
	</div>
</div>