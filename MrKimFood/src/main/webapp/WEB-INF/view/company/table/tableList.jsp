<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<%--
<jsp:include page="../../com/header.jsp"/>

<script type="text/javascript">
	function modifyTable(){
		location.href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/registerTable";
	}
</script>

<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"/>

	<div id="content">
	
		테이블 리스트 폼<br/><br/><br/>
		[no] &nbsp;/&nbsp; [QR코드]<br/>
		<c:forEach items="${models.tableList}" var="table">
			${table.no} &nbsp; / &nbsp; ${table.qrCode} <br/>
		</c:forEach>
		
		<br/>
		<input type="button" value="수정하기" onclick="modifyTable()"/>
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

.row1{
margin-left:-16px;
margin-bottom:45px; 
}

/*.table > thead > tr > .no-line {border-bottom: none;}*/
.table>tbody>tr>.thick-line {
	border-top: 2px solid #dddddd;
}

.table>tbody>tr>.no-line {
	border-top: none;
}

.tablecss{
top: 50%;
}

.gr {
	background-color: #F2F2F0
}

.panel-body1 {
	margin-top: -1px;
	margin-right: 20px;
	margin-left: 20px;
}

.pagenavigation {
	margin-top: -15px;
}

.buttomgroup1 {
	margin-top: -15px;
	margin-right: -138px;
}

footer.prodcthead {
	margin-top: 73%;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/qrcode.js"></script>

<script type="text/javascript">
	/* 내 가게 테이블 목록 출력 자바스크립트 */
	function AllQRFunction() {
		confirm("『가게 전체 테이블 출력』을 선택하시면 해당 가게의 모든 테이블의 QR코드가 출력됩니다.");
	}
	
	function PartQRFunction() {
		confirm("『선택 테이블 출력』을 선택하시면 해당 페이지에서 선택하신 테이블의 QR코드만 출력됩니다.");
	}

	$(document).ready(function(){
		$("select.shopInfoSideBar").change(function(){
			location.replace("${pageContext.request.contextPath}/company/table/tableList?shopNo="+$(this).val());
		})
	})
</script>

<!-- body -->

<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>


<!-- 내 가게 테이블 목록 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 테이블 목록</h3>
			<br>
		</div>

		<div class="panel-body1">
			<div class="table-responsive">
				<table class="table table-condensed">
					<br/>
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
					
					<div>
										<!-- 내 가게 테이블 칼럼 명-->
					<thead>
						<tr>
							<th class="text-center">내 가게 이름</th>
							<th class="text-center">내 가게 주소</th>
							<th class="text-center">내 가게 테이블 번호</th>
							<th class="text-center">QR 코드</th>
							<th class="text-center">선택</th>

						</tr>
					</thead>

					<!-- 내 가게 테이블 정보 -->

					<tbody>
						<c:forEach items="${models.tableList}" var="tableList">
							<tr>
								<td class="text-center">${models.shopInfo.restaurant_name}</td>
								<td class="text-center">${models.shopInfo.address}</td>
								<td class="text-center">${tableList.no}</td>
								<td class="text-center"><img src="https://chart.googleapis.com/chart?chs=100x100&cht=qr&chl=${tableList.qrCode}"
									width="45px" height="45px"></td>
								<td class="text-center"><input type="checkbox"></td>
							</tr>
						</c:forEach>

						<!-- 내 가게 테이블 목록 마지막 줄 코드 -->

						<tr>
							<td  colspan="5" class="thick-line"></td>
						</tr>

					</tbody>

				</table>

				<!-- 전체선택 및 출력하기 버튼 및 자바스크립트 confirm 메소드 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="col-md-6 col-md-offset-5">
							<button type="button" onclick="AllQRFunction()"
								class="btn btn-default btn-sm">전체 테이블 출력 신청하기</button>
							<button type="button" onclick="PartQRFunction()"
								class="btn btn-primary btn-sm">선택 테이블 출력 신청하기</button>
						</div>
					</div>
				</div>

				<!-- 페이지 네비게이션 -->
				<div class="pagenavigation">
					<div class="page_buttoms text-center">
						<ul class="pagination pagination-sm">
							<c:if test="${models.pagingInfo.blockNav != 1}">
								<li><a href="${pageContext.request.contextPath}/company/table/tableList?page=${((models.pagingInfo.blockNav -2) *models.pagingInfo.pageListCount) +1}">«</a></li>
							</c:if>
								
							<c:forEach var="pageNum" 
								 begin="${models.pagingInfo.startPage}" 
								 end="${models.pagingInfo.endPage}" 
								 step="1">
							<li><a href="${pageContext.request.contextPath}/company/table/tableList?page=${pageNum}">${pageNum}</a></li>
							</c:forEach>
	
							<c:if test="${models.pagingInfo.blockNav != models.pagingInfo.totalBlock}">
								<li><a  href="${pageContext.request.contextPath}/company/table/tableList?page=${(models.pagingInfo.blockNav *models.pagingInfo.pageListCount) +1}">»</a></li>
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

 