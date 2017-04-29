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
</style>

<!-- body -->


<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>


<!-- 내 가게 목록 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 목록</h3>
			<br>
		</div>

		<div class="panel-body">
			<div class="table-responsive">

				<table class="table table-condensed">
					<!-- 내 가게 목록 table 칼럼명-->
					<thead>
						<tr>
							<th>내 가게 이름</th>
							<th class="text-center">내 가게 주소</th>
							<th class="text-center">내 가게 분류</th>
							<th class="text-right">오픈 시간</th>
							<th class="text-right">종료 시간</th>
						</tr>
					</thead>

					<!-- 내 가게 정보 -->

					<tbody>
					
						<c:forEach items="${models.shopList}" var="shopList">
							<tr>
								<td><a href="${pageContext.request.contextPath}/order/orderList?shopNo=${shopList.restaurant_ID}">${shopList.restaurant_name}</a></td>
								<td class="text-center">${shopList.address }</td>
								<td class="text-center">${shopList.restaurant_type }</td>
								<td class="text-right">${shopList.openingTime}</td>
								<td class="text-right">${shopList.closingTime}</td>
							</tr>
						</c:forEach>
						
						<!-- 내 가게 목록 테이블 맨 아래 줄 부분 -->
						<tr>
							<td colspan="5" class="thick-line"></td>
						</tr>

					</tbody>
				</table>

				<!-- 페이지 네비게이션 -->
				<div class="pagenavigation">
					<div class="page_buttoms text-center">
						<ul class="pagination pagination-sm">
							<c:if test="${models.pagingInfo.blockNav != 1}">
								<li><a href="${pageContext.request.contextPath}/company/myShopList?page=${((models.pagingInfo.blockNav -2) *models.pagingInfo.pageListCount) +1}">«</a></li>
							</c:if>
								
							<c:forEach var="pageNum" 
								 begin="${models.pagingInfo.startPage}" 
								 end="${models.pagingInfo.endPage}" 
								 step="1">
							<li><a href="${pageContext.request.contextPath}/company/myShopList?page=${pageNum}">${pageNum}</a></li>
							</c:forEach>
	
							<c:if test="${models.pagingInfo.blockNav != models.pagingInfo.totalBlock}">
								<li><a  href="${pageContext.request.contextPath}/company/myShopList?page=${(models.pagingInfo.blockNav *models.pagingInfo.pageListCount) +1}">»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
 	
 			
			</div>
		</div>
		
	</div>	
</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>