<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script type="text/javascript">
	function dropShopClick(){
		if(confirm("매장을 삭제하시겠 습니까?")){
			location.href="${pageContext.request.contextPath}/company/dropShop/${models.shopNo}";
			return true;
		}else{
			return false;
		}
	}
	
</script>
<div id="sideBar">
	<ul>
		<li>매장관리</li>
		<ul>
			<li><a href="${pageContext.request.contextPath}/company/modifyShop/${models.shopNo}">매장 정보 수정</a></li>
			<li><a href="javascript:void(0);" onclick=" dropShopClick();">매장 삭제</a></li>
		</ul>
		<li>테이블 관리</li>
		<ul>
			<li><a href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/registerTable">테이블 등록</a></li>
			<li><a href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/tableList">테이블 리스트 조회</a></li>
		</ul>
		<li>메뉴 관리</li>
		<ul>
			<li><a href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/registerMenu">메뉴 등록</a> </li>
			<li><a href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuList">메뉴 리스트 조회</a></li>
		</ul>
		<li>주문 관리</li>
		<ul>
			<li><a href="${pageContext.request.contextPath}/order/orderList/${models.shopNo}">실시간 주문내역</a></li>
		</ul>
	</ul>
</div>