<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
<jsp:include page="../../com/header.jsp"/>


<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"/>

	<div id="content">
		
		<ul>
			<li>메뉴 리스트</li>
			<ul>
				<c:forEach items="${models.foodMenuList}" var="foodMenu">
					<li><a href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${foodMenu.food_ID}">${foodMenu.food_name}</a></li>
				</c:forEach>
			</ul>
		</ul>
		
	</div>

</div>
<jsp:include page="../../com/footer.jsp"/>
 --%>


<!-- header -->
<jsp:include page="../../com/FPheader.jsp"></jsp:include>

<!-- mycss -->
<link
	href="${pageContext.request.contextPath}/css/mycss/body_container.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/mycss/header_prodcthead.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/css/mycss/footer_prodcthead.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/kfonts2.css"
	rel="stylesheet" type="text/css">

<style>
ul {
	list-style: none;
	padding-left: 0;
}

.product .thumbnail {
	border: none;
}

div.page_buttoms {
	text-align: center;
}

footer.prodcthead {
	margin-top: 90%;
}

.pagenavigation {
	margin-top: 550px;
	margin-bottom: -20px;
}

.a {
	text-decoration: none
}

.row1 {
	margin-bottom: 28px;
}
</style>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						//내가게를 변경했을 때
						$("select.shopInfoSideBar")
								.change(
										function() {
											location
													.replace("${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo="
															+ $(this).val());
										})
						//카테고리를 변경했을 때
						$("select.menuCatagoryBar")
								.change(
										function() {
											if ($("input:hidden[name=shopNo]")
													.val() == "") {
												location
														.replace("${pageContext.request.contextPath}/company/foodMenu/foodMenuList?catagoryNo="
																+ $(this).val());
											} else {
												location
														.replace("${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo="
																+ $(
																		"input:hidden[name=shopNo]")
																		.val()
																+ "&catagoryNo="
																+ $(this).val());
											}
										})
					});
</script>

<!-- body -->

<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>

<input type="hidden" name="shopNo" value="${models.shopNo}" />
<input type="hidden" name="catagoryNo" value="${models.catagoryNo}" />

<!-- 내 가게 메뉴 목록 박스-->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 목록</h3>
			<br>
		</div>

		<br>

		<!-- 내 가게 목록 선택 SELECT 폼 -->
		<div class="row1">
			<div class="col-md-3">
				<select class="form-control shopInfoSideBar">
					<!-- 회원이 관리하는 shop 개수만큼 반복문 실행 -->
					<c:forEach items="${models.selectBarList}" var="shopSelectBarList">
						<!-- 해당 shop이 선택되어지도록 처리 -->
						<c:choose>
							<c:when
								test="${models.shopNo == shopSelectBarList.restaurant_ID}">
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

		<!-- 내 가게 정보 테이블 -->
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

				<!-- 내 가게 메뉴 목록 SELECT 폼 -->
				<div class="row">
					<div class="col-md-3 col-md-offset-9">
						<select class="form-control menuCatagoryBar">

							<c:choose>
								<c:when test="${empty models.catagoryNo}">
									<option value="" selected="selected">전체메뉴</option>
								</c:when>
								<c:otherwise>
									<option value="">전체메뉴</option>
								</c:otherwise>
							</c:choose>
							<c:forEach items="${models.menuCatagoryList}"
								var="menuCatagoryBarList">
								<c:choose>
									<c:when
										test="${models.catagoryNo == menuCatagoryBarList.foodClassifyId}">
										<option value="${menuCatagoryBarList.foodClassifyId}"
											selected="selected">${menuCatagoryBarList.foodClassifyName}</option>
									</c:when>
									<c:otherwise>
										<option value="${menuCatagoryBarList.foodClassifyId}">${menuCatagoryBarList.foodClassifyName}</option>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<c:choose>
								<c:when test="${models.catagoryNo == -1}">
									<option value="-1" selected="selected">기타</option>
								</c:when>
								<c:otherwise>
									<option value="-1">기타</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>

				<br>

				<!-- 내 가게 메뉴리스트 시작 -->
				<c:forEach items="${models.foodMenuList}" var="foodMenuInfo">
					<div class="row5">
						<div class="col-md-3">
							<div class="thumbnail">
								<c:choose>
									<c:when test="${not empty foodMenuInfo.foodMenuImage}">
										<img
											src="${pageContext.request.contextPath}/img/menu/${foodMenuInfo.foodMenuImage.save_imageName}">
									</c:when>
									<c:otherwise>
										<img
											src="${pageContext.request.contextPath}/img/menu/No_image.png">
									</c:otherwise>
								</c:choose>


								<a
									href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${foodMenuInfo.food_ID}">
									<div class="caption">
										<ul class="list-unstyled block">
											<li><b>${foodMenuInfo.food_name}</b></li>
											<li><b> <c:choose>
														<c:when test="${empty foodMenuInfo.food_classify_id}">
												- 기타
											</c:when>
														<c:otherwise>
															<c:if test="${not empty foodMenuInfo.food_classify_id}">
																<c:forEach items="${models.menuCatagoryList}"
																	var="menuCatagory">
																	<c:if
																		test="${foodMenuInfo.food_classify_id == menuCatagory.foodClassifyId}">
															- ${menuCatagory.foodClassifyName}
														</c:if>
																</c:forEach>
															</c:if>
														</c:otherwise>
													</c:choose>
											</b></li>
										</ul>
										<dl>
											<dt>판매가</dt>
											<dd>${foodMenuInfo.pay}원</dd>
										</dl>
									</div>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>


				<!-- 페이지 네비게이션 -->
				<div class="pagenavigation">
					<div class="page_buttoms text-center">
						<ul class="pagination pagination-sm">
							<c:if test="${models.pagingInfo.blockNav != 1}">
								<c:choose>
									<c:when
										test="${not empty models.shopNo and not empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo=${models.shopNo}&catagoryNo=${models.catagoryNo}&page=${((models.pagingInfo.blockNav -2) *models.pagingInfo.pageListCount) +1}">«</a></li>
									</c:when>
									<c:when test="${not empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?catagoryNo=${models.catagoryNo}&page=${((models.pagingInfo.blockNav -2) *models.pagingInfo.pageListCount) +1}">«</a></li>
									</c:when>
									<c:when test="${not empty models.shopNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo=${models.shopNo}&page=${((models.pagingInfo.blockNav -2) *models.pagingInfo.pageListCount) +1}">«</a></li>
									</c:when>
									<c:when
										test="${empty models.shopNo and empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?page=${((models.pagingInfo.blockNav -2) *models.pagingInfo.pageListCount) +1}">«</a></li>
									</c:when>
								</c:choose>
							</c:if>
							<c:forEach var="pageNum" begin="${models.pagingInfo.startPage}"
								end="${models.pagingInfo.endPage}" step="1">
								<c:choose>
									<c:when
										test="${not empty models.shopNo and not empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo=${models.shopNo}&catagoryNo=${models.catagoryNo}&page=${pageNum}">${pageNum}</a></li>
									</c:when>
									<c:when test="${not empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?catagoryNo=${models.catagoryNo}&page=${pageNum}">${pageNum}</a></li>
									</c:when>
									<c:when test="${not empty models.shopNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo=${models.shopNo}&page=${pageNum}">${pageNum}</a></li>
									</c:when>
									<c:when
										test="${empty models.shopNo and empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?page=${pageNum}">${pageNum}</a></li>
									</c:when>
								</c:choose>
							</c:forEach>

							<c:if
								test="${models.pagingInfo.blockNav != models.pagingInfo.totalBlock}">
								<c:choose>
									<c:when
										test="${not empty models.shopNo and not empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo=${models.shopNo}&catagoryNo=${models.catagoryNo}&page=${(models.pagingInfo.blockNav *models.pagingInfo.pageListCount) +1}">»</a></li>
									</c:when>
									<c:when test="${not empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?catagoryNo=${models.catagoryNo}&page=${(models.pagingInfo.blockNav *models.pagingInfo.pageListCount) +1}">»</a></li>
									</c:when>
									<c:when test="${not empty models.shopNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?shopNo=${models.shopNo}&page=${(models.pagingInfo.blockNav *models.pagingInfo.pageListCount) +1}">»</a></li>
									</c:when>
									<c:when
										test="${empty models.shopNo and empty models.catagoryNo}">
										<li><a
											href="${pageContext.request.contextPath}/company/foodMenu/foodMenuList?page=${(models.pagingInfo.blockNav *models.pagingInfo.pageListCount) +1}">»</a></li>
									</c:when>
								</c:choose>
							</c:if>
						</ul>
					</div>
				</div>
			</div>


			<br>
		</div>
	</div>


</div>
<!-- 내 가게 메뉴 리스트 끝 -->


<!-- sideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>