<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/qrcode.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var qrcode= null;
		$("#createQR").click(function(){
			qrcode = new QRCode(document.getElementById("qrcode"), {//QRCode의 데이터(String, URL, JSON 형식의 데이터가 들어갈수 있다.)
				text: "asdfasqw",
				width : 200,
				height : 200,
			 	colorDark : "#000000",
			    colorLight : "#ffffff",
				correctLevel : QRCode.CorrectLevel.H
			});
			console.log(qrcode);
		});
		
		$("#modifyQR").click(function(){
			qrcode.makeCode("http://naver.com");
		});
		
		$("#clearQR").click(function(){
			$("#qrcode").children("img:last").remove();
			$("#qrcode").children("canvas:last").remove();
		});
	});
</script>
</head>
<body>
	<input type="button" id="createQR" value="QR생성"/>
	<input type="button" id="modifyQR" value="QR수정"/>
	<input type="button" id="clearQR" value="qr삭제"/><br/>
	<div id="qrcode" style="margin-top:15px;"></div>
	
</body>
</html>