<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
			${demo.css}
		</style>
		<script type="text/javascript">
			$(function () {

				Highcharts.setOptions({
					 	//데이터 관련 칼라 설정
				        colors: ['#7cb5ec', '#434348', '#90ed7d', '#f7a35c', '#8085e9', '#f15c80', '#e4d354', '#8085e8', '#8d4653', '#91e8e1']
				    });

			    $('#container').highcharts({
			        chart: {
			            type: 'bar'
			        },
			        title: {
			            text: "일일 매출 현황"		//타이틀
			        },
			        xAxis: {
			            categories: ['메뉴1', '메뉴2', '메뉴3', '메뉴4','세트메뉴1', '커피1','커피2'],	//메뉴명 배열처리
			            title: {
			                text: null
			            }
			        },
			        yAxis: {
			            min: 0,
			            title: {
			                text: '만원',	//금액단위
			                align: 'high'
			            },
			            labels: {
			               enabled: true,
		                   formatter: function() {
		                     return parseInt((this.value / 10000)); //y축 단위 계산 방법
		                    }
			            }
			        },
			        tooltip: {
			            valueSuffix: '원'
			        },
			        plotOptions: {
			            bar: {
			            	dataLabels: {
	                            enabled: true,
	                            format: '{point.y:,.0f}원'
	                        }
			            }
			        },
			        legend: {
			            layout: 'vertical',
			            align: 'right',
			            verticalAlign: 'top',
			            x: -15,
			            y: 60,
			            floating: true,
			            borderWidth: 1,
			            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
			            shadow: true
			        },
			        credits: {
			            enabled: false
			        },
			        series: [{
			            name: '2014년 1월 5일',
			            data:  [30900, 45090, 24010, 70000,45030, 30000,80900]
			        }]
			    });
			});
		</script>
	</head>
	<body>

<script src="${pageContext.request.contextPath}/js/highChart/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/js/highChart/modules/exporting.js"></script>

<div id="container" style="min-width: 310px; max-width: 700px; height: 400px; margin: 0 auto"></div>

	</body>
</html>