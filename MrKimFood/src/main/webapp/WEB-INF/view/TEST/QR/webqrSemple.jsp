<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/qrcodeReader.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/webqr.js"></script>
<style type="text/css">
body{
    width:100%;
    text-align:center;
}
img{
    border:0;
}
#main{
    margin: 15px auto;
    background:white;
    overflow: auto;
	width: 100%;
}
#header{
    background:white;
    margin-bottom:15px;
}
#mainbody{
    background: white;
    width:100%;
	display:none;
}
#footer{
    background:white;
}
#v{
    width:320px;
    height:240px;
}
#qr-canvas{
    display:none;
}
#qrfile{
    width:320px;
    height:240px;
}
#mp1{
    text-align:center;
    font-size:35px;
}
#imghelp{
    position:relative;
    left:0px;
    top:-160px;
    z-index:100;
    font:18px arial,sans-serif;
    background:#f0f0f0;
	margin-left:35px;
	margin-right:35px;
	padding-top:10px;
	padding-bottom:10px;
	border-radius:20px;
}
.selector{
    margin:0;
    padding:0;
    cursor:pointer;
    margin-bottom:-5px;
}
#outdiv
{
    width:320px;
    height:240px;
	border: solid;
	border-width: 3px 3px 3px 3px;
}
#result{
    border: solid;
	border-width: 1px 1px 1px 1px;
	padding:20px;
	width:70%;
}

ul{
    margin-bottom:0;
    margin-right:40px;
}
li{
    display:inline;
    padding-right: 0.5em;
    padding-left: 0.5em;
    font-weight: bold;
    border-right: 1px solid #333333;
}
li a{
    text-decoration: none;
    color: black;
}

#footer a{
	color: black;
}
.tsel{
    padding:0;
}

</style>

</head>
<body>
	<div id="main">
		<div id="header">
			<p id="mp1">QR Code scanner</p>
		</div>
		<div id="mainbody">
			<table class="tsel" border="0" width="100%">
				<tr>
					<td valign="top" align="center" width="50%">
						<table class="tsel" border="0">
							<tr>
								<td><img class="selector" id="webcamimg" src="vid.png"
									onclick="setwebcam()" align="left" /></td>
								<td><img class="selector" id="qrimg" src="cam.png"
									onclick="setimg()" align="right" /></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<div id="outdiv"></div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center"><img src="down.png" /></td>
				</tr>
				<tr>
					<td colspan="3" align="center">
						<div id="result"></div>
					</td>
				</tr>
			</table>
		</div>
		&nbsp;
		<div id="footer">
			<br>
			<h5 align="center">
				Copyright &copy; 2011 <a target="_blank"
					href="http://www.lazarsoft.info">Lazar Laszlo</a>
			</h5>
		</div>
	</div>
	<canvas id="qr-canvas" width="800" height="600"></canvas>
	<script type="text/javascript">load();</script>
</body>
</html>