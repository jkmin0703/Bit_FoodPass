<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- header -->
<jsp:include page="../com/FPheader.jsp"></jsp:include>

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
	margin-top: -10px;
	margin-bottom: 20px;
}

.pagenavigation {
	margin-top: -15px;
}

.row1 {
	margin-bottom: 28px;
}

footer.prodcthead {
	margin-top: 100%;
}

</style>

<!-- </style> -->

<!-- 스크립트 -->
<script src="${pageContext.request.contextPath}/js/webSock/sockjs-0.3.4.js"></script>
<script src="${pageContext.request.contextPath}/js/webSock/stomp.js"></script>
<script type="text/javascript">

	var stompClient = null; 
	
	function connect() {
	    var socket = new SockJS('/add');
		stompClient = Stomp.over(socket);
	    stompClient.connect({}, function(frame) {
	        console.log('Connected: ' + frame);
	        stompClient.subscribe('/topic/updateOrder', function(calResult){
//        		showResult(JSON.parse(calResult.body).result);
//				var test = JSON.stringify(calResult);
//				console.log('test = ' + test.orders.pOrderInfos[0].tableNo);
				console.log('콜백함수 호출');
				showResult('콜백함수 호출');
	        });
	    });
	}
	
	function disconnect() {
	    stompClient.disconnect();
	    console.log("Disconnected");
	}
	
	function showResult(message) {
/*         var response = document.getElementById('orderTable');
		var p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        p.appendChild(document.createTextNode(message));
        response.appendChild(p); */
        
        var content = 
        			"<tr>" +
        				"<td>" + "5" + "</td>" + 
        				"<td>" + "맛있는 햄버거" + "</td>" +
        				"<td class='text-center'>" + "3000" + "</td>" +
        				"<td class='text-center'>" + "4" + "</td>" +
        				"<td class='text-right'>" + "2015/01/17" + "</td>" +
        				"<td class='text-right'>" + "09:36" + "</td>" +
        				"<td class='text-right'>" + "5" + "</td>" +
        				"<td class='text-right'><input type='checkbox' id='foodSupply' name='foodSupply'></td>" +
        				"<input type='hidden' id='isSupply' name='isSupply' />" + 
        				"<input type='hidden' id='orderId' name='orderId' value='${order.orderId}'/>" + 
        				"<input type='hidden' id='num' name='num' value='${order.num}'/>" + 
        			"</tr>";
        
        $("#orderTable").append(content);
        
    }

	$(document).ready(function(){
		
		connect();
		
		//가계정보 selectBar변화가 일어날 경우 발생하는 이벤트
		$("select.shopInfoSideBar").change(function(e){
			//기존페이지를 새로운 페이지로 변경
			location.replace("${pageContext.request.contextPath}/order/orderList?shopNo="+$(this).val());

			//[test] select 태그의 문자열만 선택
			//var a = document.getElementsByTagName('option');
			//for(var i=0; i<a.length; i++) {
			//	if(a[i].value ==  $(this).val()){
			//		console.log(a[i].text);
			//	}
			//}
		});
		
		var buttonSearch = document.getElementById('search');
		var buttonSearchSupply = document.getElementById('service_supply');
		var checkFoodSupply = document.getElementsByName('foodSupply');
		var hiddenIsSupply = document.getElementsByName('isSupply');
		//$("태그명[name=속성값]")
		
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
			document.getElementsByName("_orderList")[0].submit();
		};
		
		/* 테스트 코드 */
		realTimeSearch.onclick = function() {
			stompClient.send("/showString/add", {}, JSON.stringify({ 'str1': 'hello', 'str2': 'world' }));
		}
		
	});
	
</script>

<!-- body -->
<!-- SideBar -->
<jsp:include page="../com/FPsideBar.jsp"></jsp:include>


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
	
	<!-- 내 가게 주문 내역 -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 주문 내역</h3>
			<br>
		</div>

		<!-- 내 가게 주문 내역 테이블 -->
		<div class="panel-body">
			<div class="table-responsive">
				<form id="_orderList" name="_orderList" action="${pageContext.request.contextPath}/order/orderList/${models.orders.shopNo}" method="post">
					<table class="table table-condensed">
						<!-- 주문내역 테이블의 타이틀 코드 -->
	
						<thead>
							<tr>
								<th>테이블 번호</th>
								<th>선택메뉴</th>
								<th class="text-center">가격</th>
								<th class="text-center">수량</th>
								<th class="text-right">주문날짜</th>
								<th class="text-right">주문시간</th>
								<th class="text-right">대기순번</th>
								<th class="text-right">서비스 제공</th>
							</tr>
						</thead>
	
						<!-- 주문내역 테이블의 부분 요소 -->
	
						<tbody id="orderTable">
							<c:if test="${empty models.orders.pOrderInfos}">
								<tr>
									<td colspan="8" align="center">
										주문 리스트가 존재하지 않습니다.
									</td>
								</tr>
							</c:if>
							<c:if test="${not empty models.orders.pOrderInfos}">
								<c:forEach var="order" items="${models.orders.pOrderInfos}">
									<tr>
										<td>${order.tableNo}</td>
										<td>${order.orderFoodName}</td>
										<td class="text-center">${order.pay}</td>
										<td class="text-center">${order.orderQuantity}</td>
										<td class="text-right">${order.orderDay}</td>
										<td class="text-right">${order.orderTime}</td>
										<td class="text-right">${order.orderStanby}</td>
										<td class="text-right"><input type="checkbox" id="foodSupply" name="foodSupply"></td>
										<input type="hidden" id="isSupply" name="isSupply" />
										<input type="hidden" id="orderId" name="orderId" value="${order.orderId}"/>
										<input type="hidden" id="num" name="num" value="${order.num}"/>
									</tr>
								</c:forEach>
							</c:if>
	
							<!-- 주문내역 테이블의 마지막 줄 코드 -->
	
							<tr>
								<td class="thick-line"></td>
								<td class="thick-line"></td>
								<td class="thick-line"></td>
								<td class="thick-line"></td>
								<td class="thick-line"></td>
								<td class="thick-line"></td>
								<td class="thick-line"></td>
								<td class="thick-line"></td>
							</tr>
						</tbody>
					</table>
	
	
					<!-- 페이지 네비게이션 -->
					<%-- <jsp:include page="../com/pageNavi.jsp"></jsp:include> --%>
	
					<!-- 주문 내역 조회, 서비스 버튼 그룹 -->
					<div class="buttomgroup1">
						<div class="form-group">
							<div class="col-md-9 col-md-offset-3">
								<button id="realTimeSearch" type="button" class="btn btn-primary">실시간 주문 내역 조회</button>
								<button id="search" type="button" class="btn btn-primary">조회</button>
								<button id="service_supply" type="button" class="btn btn-default">서비스 제공</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</div>

<!-- sideBanner -->
<jsp:include page="../com/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="../com/FPfooter.jsp"></jsp:include>