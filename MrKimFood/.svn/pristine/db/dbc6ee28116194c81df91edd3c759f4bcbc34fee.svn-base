<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
		<style type="text/css">
			${demo.css}
		</style>
		<script type="text/javascript">
			$(document).ready(function () {
			
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
			
			                    // name에서 version과 brand의 데이터를 분리한다.
			                    version = name.split(' / ')[1];
			                    brand = name.split(' / ')[0];
			
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
			                    type: 'bar'
			                },
			                title: {
			                    text: '<b>Bar Chart DrillDown</b>'
			                },
			                xAxis: {
			                    type: 'category'
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
				                     return parseInt(this.value/10000); //y축 단위 계산 방법
				                    }
					            }
			                },
			                legend: {
			                    enabled: false
			                },
			                plotOptions: {
			                    series: {
			                        dataLabels: {
			                            enabled: true,
			                            format: '{point.y:,.0f}원'
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
	</head>
	<body>
<script src="${pageContext.request.contextPath}/js/highChart/highcharts.js"></script>
<script src="${pageContext.request.contextPath}/js/highChart/modules/data.js"></script>
<script src="${pageContext.request.contextPath}/js/highChart/modules/drilldown.js"></script>

<div id="container" style="min-width: 310px; max-width: 700px; height: 400px; margin: 0 auto"></div>

<pre id="tsv" style="display:none">기간/ 카테고리명	총 금액
2014년 1월 1주 / 세트메뉴	45650
2014년 1월 1주 / 커피	23500
2014년 1월 1주 / 버거	786750
2014년 1월 1주 / 기타	786750
2014년 1월 2주 / 세트메뉴	31050
2014년 1월 2주 / 커피	23310
2014년 1월 2주 / 버거	576750
2014년 1월 2주 / 기타	126750
</pre>

	</body>
</html>