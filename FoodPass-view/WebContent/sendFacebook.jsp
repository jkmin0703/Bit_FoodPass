<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="commonView/FPheader.jsp"></jsp:include>

<script src="http://connect.facebook.net/en_US/all.js"></script>
<!-- mycss -->
<link href="./css/mycss/body_container.css" rel="stylesheet"
	type="text/css">
<link href="./css/mycss/header_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="./css/mycss/footer_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="./css/kfonts2.css" rel="stylesheet" type="text/css">



<style>
.buttomgroup2 {
	margin-top: -25px;
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

.row2 {
	margin-top: -25px;
	margin-left: -16px;
	margin-right: 7px;
}

.buttomgroup2{
	margin-top: -15px;
}

footer.prodcthead {
	margin-top: 83%;
}

</style>


<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarChart.jsp"></jsp:include>




<div class="col-md-8">

	<!-- 내 가게 정보 -->
	<jsp:include page="commonView/myShopInfo.jsp"></jsp:include>

	<!-- 내 가게 sns 홍보 박스  -->
	<div class="panel panel-danger">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 SNS 홍보</h3>
			<br>
		</div>
		<div class="panel-body">
		
		

			<!-- SNS 홍보 INPUT 박스 -->

			<div class="panel-body">
				<div class="col-md-12">

<br>

			<!-- 탭형 네비게이션 class="active" -->  
					<ul class="nav nav-tabs">
						<li><a href="./sendCacao.jsp"><img alt="" src="./imgs/cacaoStory.jpg"> 카카오스토리</a></li>
						<li><a href="./sendTwitter.jsp"><img alt="" src="./imgs/twitter.jpg"> 트위터</a></li>
						<li class="active"><a href="./sendFacebook.jsp"><img alt="" src="./imgs/facebook.jpg"> 페이스북</a></li>
						<li><a href="./OneTimeAllSend.jsp"><img alt="" src="./imgs/onetime_logo.jpg"> One Time SNS</a></li>
					</ul>


					<br>


					<div class="table-responsive">
						<table class="table table-condensed">
							<form class="form-horizontal" role="form" id="ajax-contact-form">

								
								<div class="form-group">
									<textarea name=fb_message class="form-control required"
										id="message" title="Message" placeholder="원하시는 홍보 메시지를 입력하세요." rows=10 ></textarea>
								</div>
															
								<!-- 내 가게 테이블 등록, 취소 버튼 그룹 -->
								<div class="buttomgroup2">
									<div class="form-group">
										<div class="row2">
											<div class="col-md-3">
												<br>

												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-camera"></span>
												</button>
												<button type="button" class="btn btn-default">
													<span class="glyphicon glyphicon-paperclip"></span>
												</button>

											</div>



											<div class="col-md-2 col-md-offset-7">
												<br>
												<button type="button" class="btn btn-primary"
												onClick="post_on_wall();">게시글 전송</button>
												<br>
											</div>


											</div>
										</div>
							

							</form>
						</table>


<div id="fb-root"></div>
						<!-- SNS 홍보 INPUT 박스 끝 -->

					</div>
				</div>
			</div>


		</div>
	</div>
</div>

<script type="text/javascript">
function post_on_wall()
{
    FB.login(function(response)
    {
        if (response.authResponse)
        {
            alert('Logged in!');
            var access_token =   FB.getAuthResponse()['accessToken'];
 
            // Post message to your wall
 
            var opts = {
                message : document.getElementById('fb_message').value,
                /* name : 'Post Title',
                link : 'www.postlink.com',
                description : 'post description',
                picture : 'http://2.gravatar.com/avatar/8a13ef9d2ad87de23c6962b216f8e9f4?s=128&amp;d=mm&amp;r=G' */
            };
 
            var posting = FB.api('/me/feed', 'post', opts, function(response){
            	
                if (!response || response.error)
                {
                	alert(opts.message);
                    alert('Posting error occured');
                }
                else
                {
                    alert('Success - Post ID: ' + response.id);
                }
            });
        }
        else
        {
            alert('Not logged in');
        }
    }, { scope : 'publish_stream' });
}
	
	//facebook 초기화
    FB.init({
        appId: '740503992684785',
        status: true, // check login status
        cookie: true, // enable cookies to allow the server to access the session
        xfbml: true, // parse XFBML
        //version : 'v2.0',     // Version flag chooses version for the SDK
        oauth : true // Enable oauth authentication
    });
	
    FB.Event.subscribe('auth.authResponseChange', function (response) {
    	  if (response.status === 'connected') {
    	    alert("Successfully connected to Facebook!");
    	  }
    	  else if (response.status === 'not_authorized') {
    	    alert("Login failed!");
    	  } else {
    	    alert("Unknown error!");
    	  }
    	});
    
    FB.getLoginStatus(function(response) {
    	  if (response.status === 'connected') {
    	    // the user is logged in and has authenticated your
    	    // app, and response.authResponse supplies
    	    // the user's ID, a valid access token, a signed
    	    // request, and the time the access token 
    	    // and signed request each expire
    	    alert("login success");
    	    var uid = response.authResponse.userID;
    	    var accessToken = response.authResponse.accessToken;
    	  } else if (response.status === 'not_authorized') {
    	    // the user is logged in to Facebook, 
    	    // but has not authenticated your app
    	  } else {
    	    // the user isn't logged in to Facebook.
    	  }
    	 });
    
    
  /*   function handleSessionResponse(response) { 
     if (!response.session) { 
      // Open login dialog box
      alert("로그인이 필요합니다.")
      FB.login(handleSessionResponse);
      return; 
     } else{
      // already logged in
      alert("로그인 되어 있습니다.")
     }
    } */
    
    function ShowMyName() {
        FB.api("/me",
                function (response) {
                    alert('Name is ' + response.name);
                });
    }
    
   /*  (function(d, s, id) {
    	var js, fjs = d.getElementsByTagName(s)[0];
    	if (d.getElementById(id)) return;
    	js = d.createElement(s); js.id = id;
    	js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1&status=0";
    	fjs.parentNode.insertBefore(js, fjs);
    	}(document, 'script', 'facebook-jssdk')); */
    	
    	(function() {
    	    var e = document.createElement('script');
    	    // replacing with an older version until FB fixes the cancel-login bug
    	    e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
    	    //e.src = 'scripts/all.js';
    	    e.async = true;
    	    document.getElementById('fb-root').appendChild(e);
    	}());





</script>




<!-- SideBanner -->
<jsp:include page="commonView/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>