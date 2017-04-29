<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- SideBanner -->
<div class="tablebody">
	<div class="col-md-2" id="myScrollspy">

		<script type="text/javascript">
			var how_many_ads = 5; //배너 개수 
			var now = new Date()
			var sec = now.getSeconds()
			var ad = sec % how_many_ads;
			ad += 1;

			if (ad == 1) {
				url = "*"; //링크될 주소 
				banner = "http://iwmedia.dl.cdn.cloudn.co.kr/CID3821/160_600.swf"; //배너 위치(플래래 파일) 
				width = "160"; //가로 크기 
				height = "600"; //세로 크기 
			}
			if (ad == 2) {
				url = "*"; //링크될 주소 
				banner = "http://iwmedia.dl.cdn.cloudn.co.kr/CID3723/160_600.swf"; //배너 위치(플래래 파일) 
				width = "160"; //가로 크기 
				height = "600"; //세로 크기 
			}
			if (ad == 3) {
				url = "*"; //링크될 주소 
				banner = "http://iwmedia.dl.cdn.cloudn.co.kr/CID3791/A/160_600.swf"; //배너 위치(플래래 파일) 
				width = "160"; //가로 크기 
				height = "600"; //세로 크기 
			}
			if (ad == 4) {
				url = "*"; //링크될 주소 
				banner = "http://iwmedia.dl.cdn.cloudn.co.kr/CID3850/160_600.swf"; //배너 위치(플래래 파일) 
				width = "160"; //가로 크기 
				height = "600"; //세로 크기 
			}
			if (ad == 5) {
				url = "*"; //링크될 주소 
				banner = "http://iwmedia.dl.cdn.cloudn.co.kr/CID3849/160_600.swf"; //배너 위치(플래래 파일) 
				width = "160"; //가로 크기 
				height = "600"; //세로 크기 
			}

			document.write('<a href=\"' + url + '\" target=\"_blank\">');
			document
					.write('<OBJECT classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\"');
			document
					.write('codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0\" WIDTH=');
			document.write(width + ' HEIGHT=' + height + '>');
			document.write('<PARAM NAME=movie VALUE=\"' + banner + '\">');
			document.write('<PARAM NAME=quality VALUE=high>');
			document.write('<PARAM NAME=bgcolor VALUE=#FFFFFF>');
			document.write('<EMBED src=\"' + banner
					+ '\" quality=high bgcolor=#FFFFFF  WIDTH=');
			document.write(width + ' HEIGHT=' + height + ' ');
			document.write('TYPE=\"application/x-shockwave-flash\"');
			document
					.write('PLUGINSPAGE=\"http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash\">');
			document.write('</EMBED>');
			document.write('</OBJECT>');
		</script>
	</div>
</div>

