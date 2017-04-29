<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//1번 Get
		$("#oneDataGetClick").click(function(){
			console.log("apfhjdkjkldsa");
			var getData_One = $("#ajax_getData").val();
			console.log(getData_One);
			$.ajax({
				type:"GET",
				url:"/test/AjaxGetUp",
				data : {
					id : getData_One
				},
				success : function(data) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 console.log(data);
	           },
	           complete : function(data) {
	                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					console.log(data);
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
			});
		})
		
		//2번
		$("#oneDataPostClick").click(function(){
			$.ajax({
				type:"POST",
				url:"/test/AjaxPostUp",
				data : {
					id : $("#ajax_postData").val()
				},
				success : function(data) {
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 console.log(data);
	           },
	           complete : function(data) {
	                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
					console.log(data);
	           },
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           }
			});
		})
		
		//3번
		$("#jsonpClick").click(function(){
			//var sendData ='나진수';
			var sendData={
					id:10,
					voObj:{
						foodClassifyId: 1,
						foodClassifyName : "jinsu가가가",
						restaurantId : 2
					}
			};
			console.log(sendData);
			var json_data = JSON.stringify(sendData);
			console.log(json_data);
			
			$.ajax({
				type:"GET",
				url:"/test/jsonpUp",
				dataType : "jsonp",
			    jsonp : "callback",
				data:{
					data : json_data
				},
				success: function(data){
					// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.
	                 alert("성공");
					console.log(data);
				},
	           error : function(xhr, status, error) {
	                 alert("에러발생");
	           },
	           complete : function(data) {
	                 // 통신이 실패했어도 완료가 되었을 때 이 함수를 타게 된다.
	           }
			});
			
		})
		
	});
</script>

</head>
<body>
	1번 예제) 단일데이터, Get/Post 업로드<br/>
	<input type="text" id="ajax_getData"/>
	<input type="button" id="oneDataGetClick" value="Get전송">
	<br/><br/>
		
	<input type="text" id="ajax_postData"/>
	<input type="button" id="oneDataPostClick" value="Post전송">
	<br/><br/>
	
	<input type="button" id="jsonpClick" value="jsonp전송"><br/>
	
	<hr/><br/>
	
</body>
</html>