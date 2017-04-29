<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../com/header.jsp"></jsp:include>

<div class="main">
	<ul>
		<li>매장 관리</li>
		<ul>
			<li><a href="${pageContext.request.contextPath}/company/registerShop">매장 등록</a></li>
			<li><a href="${pageContext.request.contextPath}/company/myShopList">매장 정보 조회</a></li> <!-- (>> 정보 수정, 삭제) -->
		</ul>
		<li>테이블 관리</li>
		<ul>
			<li>테이블 생성</li>
			<li>테이블 조회</li> <!-- (>> 정보 수정, 제거) -->
		</ul>
		<li>메뉴 관리</li>
		<ul>
			<li>메뉴 등록</li>
			<li>메뉴 조회</li> <!-- (>> 정보 수정, 삭제) -->
		</ul>
	</ul>
</div>

<jsp:include page="../com/footer.jsp"></jsp:include>
