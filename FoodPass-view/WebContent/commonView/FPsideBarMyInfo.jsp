<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.sideimage {
	margin-top: 3px;
	margin-left: -2px;
}
</style>


<div class="tablebody">
	<div class="col-md-2" id="myScrollspy">


		<!-- 푸드패스 마이페이지 사이드 바 -->
			
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseFour"> 푸드패스 내 정보 </a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse in">
					<div class="panel-body">
						<p>
							<a href="./myInfo.jsp">내 정보 확인</a>
						</p>
						<p>
							<a href="./modifyMyInfo.jsp">내 정보 수정</a>							
						</p>						
						<p>
							<a href="./passwordChange.jsp">내 비밀번호 변경</a>							
						</p>
						<p>
							<a href="./MembershipOut.jsp">회원탈퇴</a>
						</p>
					</div>
				</div>
			</div>			
			
			<!-- 왼쪽 구글 앱 스토어, 애플 앱 스토어, 윈도우 이미지 -->
			<img class="sideimage" alt="" src="./img/AndroidApp.jpg">
			<img class="sideimage" alt="" src="./img/AppStore.jpg"> 
			<img class="sideimage" alt="" src="./img/window8.jpg">
	
		</div>
	</div>
