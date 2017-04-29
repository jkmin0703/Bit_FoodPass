<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QR_Reader</title>

<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/qrcodeReader.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		qrcode.callback = read;
		
		$("input[name='imgCamera']").change(function(e){
			var fileList = this.files;
			for(var i=0; i<fileList.length ; i++){
				var reader = new FileReader();
				reader.onload =(function(theFile){
					return function(e){
						var gCanvas = document.getElementById("qr-canvas");
						var gCtx = gCanvas.getContext("2d");
						gCtx.clearRect(0, 0, gCanvas.width, gCanvas.height);
						qrcode.decode(e.target.result);
					};
				})(fileList[i]);
				reader.readAsDataURL(fileList[i]);
			}
		})
		
		function htmlEntities(str) {
		    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
		}
		
		function read(a)
		{
		    var str="";
		    if(a.indexOf("http://") === 0 || a.indexOf("https://") === 0){
		        str+="<a href='"+a+"'>"+a+"</a><br>";
		    }else{
			    str+="<b>"+htmlEntities(a)+"</b>";
		    }
		    $("#result").html(str);
		}
		
		
		
	});
</script>
</head>
<body>
	<div id="container">
		<div id="cam">
			카메라 :<br/>
			<input type="file" accept="image/*" capture="camera" name="imgCamera"><br/>
		</div>
		<br/>
	
		<div id="outdiv" style="width:320px; height:240px; border: solid;">
			<div id="qrfile">
				<canvas id="out-canvas" width="320" height="240"></canvas>
			</div>
		</div>
		<br/>
		
		<div id="result" style="border: solid; border-width: 1px 1px 1px 1px; padding:20px; width:70%;"></div>
	</div>
	
	<canvas id="qr-canvas" width="800" height="600" style="visibility: hidden;"></canvas>
	
</body>
</html>