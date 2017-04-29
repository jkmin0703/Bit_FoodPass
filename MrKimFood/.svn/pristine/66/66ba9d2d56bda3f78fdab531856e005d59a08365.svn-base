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

<!-- highCharts 선언 -->
<script src="${pageContext.request.contextPath}/js/highChart/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/js/highChart/modules/data.js"></script>
<script src="${pageContext.request.contextPath}/js/highChart/modules/drilldown.js"></script>

<style>
${demo.css}

.row {
	padding-left: 15px;
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
	margin-left: -10px;
	margin-right: -5px;
}

footer.prodcthead {
	margin-top: 83%;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		
		$("select.shopInfoSideBar").change(function(){
			var salesBarData = $("select.salesOptionBar").val();
			location.replace("${pageContext.request.contextPath}/company/sales/day/"+salesBarData+"?shopNo="+$(this).val());
		})
		
		$("select.salesOptionBar").change(function(){
			var shopInfoBarData = $("select.shopInfoSideBar").val();
			location.replace("${pageContext.request.contextPath}/company/sales/day/"+$(this).val()+"?shopNo="+shopInfoBarData);
		})
		
		 Highcharts.data({
		        csv: document.getElementById('tsv').innerHTML,
		        itemDelimiter: '\t',
		        parsed: function (columns) {
		
		            var brands = {},
		                brandsData = [],
		                versions = {},
		                drilldownSeries = [];
		            
		            $.each(columns[0], function (i, name) {
		                var brand,
		                    version;
		
		                if (i > 0) {
		
		                    // '-' 이전의 문자열을 name 변수에 저장
		                    name = name.split(' -')[0];
		
		                    // name에서 version과 brand의 데이터를 분리한다.
		                    version = name.split('/')[1];
		                    brand = name.split('/')[0];
		
		                    // brand 배열이 없다면 brand 배열을 생성하여 칼럼을 추가하고,
		                    // 배열이 있다면 생성된 배열안에 데이터를 추가한다.
		                    if (!brands[brand]) {
		                        brands[brand] = columns[1][i];
		                    } else {
		                        brands[brand] += columns[1][i];
		                    }
		
		                    // 버전을 생성시킨다.
		                    if ( !(version=="" || typeof version=="undefined") ) {
		                        if (!versions[brand]) {
		                            versions[brand] = [];
		                        }
		                        versions[brand].push([version, columns[1][i]]);
		                    }
		                }
		            });
		
		            $.each(brands, function (name, y) {
		                brandsData.push({
		                    name: name,
		                    y: y,
		                    drilldown: versions[name] ? name : null
		                });
		            });
		            $.each(versions, function (key, value) {
		                drilldownSeries.push({
		                    name: key,
		                    id: key,
		                    data: value
		                });
		            });
		            
		            //색상설정
		            Highcharts.setOptions({
					 	//데이터 관련 칼라 설정
				        colors: ['#7cb5ec', '#434348', '#90ed7d', '#f7a35c', '#8085e9', '#f15c80', '#e4d354', '#8085e8', '#8d4653', '#91e8e1']
				    });
		            
		            // Create the chart
		            $('#container').highcharts({
		                chart: {
		                    type: 'pie'
		                },
		                title: {
		                    text: ''
		                },
		                plotOptions: {
		                    series: {
		                        dataLabels: {
		                            enabled: true,
		                            format: '{point.name}: {point.percentage:.1f}%'
		                        }
		                    }
		                },
		
		                tooltip: {
		                    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
		                    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b>원<br/>'
		                },
		
		                series: [{
		                    name: 'Category',
		                    colorByPoint: true,
		                    data: brandsData
		                }],
		                drilldown: {
		                    series: drilldownSeries
		                }
		            });
		        }
		    });
		
	});
</script>

<!-- body -->

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
		<div class="row">
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

	<!-- 내 가게 일일 매출 현황 박스  -->
	<div class="panel panel-danger">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 매출 현황</h3>
			<br>
		</div>
		<div class="panel-body">
			<br>

			<!-- 내 가게 일일 매출 현황 총합 -->
			<div class="row">
				<div class="col-md-4">
					<span>총 매출액: ${models.totalSalesPay}원</span>
				</div>

				<!-- 내 가게 일일 매출 현황 SELECT 폼 -->
				<div class="col-md-3 col-md-offset-5">
					<select class="form-control salesOptionBar">
					<c:forEach items="${models.salesBarList}" var="salesBarInfo">
						<c:choose>
							<c:when test="${models.salesVal == salesBarInfo.salesBarVal}">
								<option value="${salesBarInfo.salesBarVal}" selected="selected">
									${salesBarInfo.salesBarText} </option>
							</c:when>
							<c:otherwise>
								<option value="${salesBarInfo.salesBarVal}">
									${salesBarInfo.salesBarText} </option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</select>
				</div>
			</div>
			<br/>
			<!-- 내 가게 일일 매출 현황 CHART -->
			<div id="container" style="min-width: 310px; max-width: 600px; height: 400px; margin: 0 auto"></div>

<pre id="tsv" style="display:none">[카테고리 / 메뉴]	[총 금액]
${models.salesPieChartData}
</pre>
			<!-- 차트 끝 -->
		</div>
	</div>
</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>