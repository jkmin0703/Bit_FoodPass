<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../com/header.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 리스트</title>



<script type="text/javascript">
	window.onload = function() {
		var buttonSearch = document.getElementById('search');
		var buttonSearchSupply = document.getElementById('service_supply');
		var checkFoodSupply = document.getElementsByName('foodSupply');
		var hiddenIsSupply = document.getElementsByName('isSupply');
		
		buttonSearch.onclick = function() {
			alert(checkFoodSupply[0].checked);				
		};
		
		buttonSearchSupply.onclick = function() {
			for (var i = 0; i < checkFoodSupply.length; i++) {
//				alert(checkFoodSupply[i].checked);
				if (checkFoodSupply[i].checked) {
					hiddenIsSupply[i].value='o';
				} else {
					hiddenIsSupply[i].value='x';
				}
			} 
			document.getElementsByName("orderList")[0].submit();
		};
		
	};
</script>

</head>
<body>
	<h1>${orders.restaurantName} 주문 리스트</h1>
		
	<!-- <input type="button" value="조회" />
	<input type="button" value="서비스 제공" /><br /><br /> -->
	<button id="search">조회</button>
	<button id="service_supply">서비스 제공</button>
	<br /><br />
	<form name="orderList" action="${pageContext.request.contextPath}/order/orderList/${orders.shopNo}" method="post">
		<table border="1">
			<tr>
				<th>테이블 번호</th>
				<th>선택메뉴</th>
				<th>가격</th>
				<th>수량</th>
				<th>주문날짜</th>
				<th>주문시간</th>
				<th>대기순번</th>
				<th>서비스 제공</th>
			</tr>
			<tr>
				<c:if test="${empty orders.pOrderInfos}">
					<tr>
						<td colspan="6" align="center">
							주문 리스트가 존재하지 않습니다.
						</td>
					</tr>
				</c:if>
				<c:if test="${not empty orders.pOrderInfos}">
					<c:forEach var="order" items="${orders.pOrderInfos}">
						<tr>
							<td>${order.tableNo}</td>
							<td>${order.orderFoodName}</td>
							<td>${order.pay}</td>
							<td>${order.orderQuantity}</td>
							<td>${order.orderDay}</td>
							<td>${order.orderTime}</td>
							<td>${order.orderStanby}</td>
							<td><input type="checkbox" id="foodSupply" name="foodSupply" /></td>
							<input type="hidden" id="isSupply" name="isSupply" />
							<input type="hidden" id="orderId" name="orderId" value="${order.orderId}"/>
							<input type="hidden" id="num" name="num" value="${order.num}"/>
						</tr>
					</c:forEach>
				</c:if>
			</tr>
		</table>
	</form>
	<br /><br /><br /><br />
</body>
</html>
<jsp:include page="../com/footer.jsp"/>