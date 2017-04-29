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


		<!-- 내 가게 관리 사이드 바 -->
		<div class="panel-group" id="accordion">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne"> 내 가게 관리 </a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse">
					<div class="panel-body">
						<p>
							<a href="./myShopList.jsp">내 가게 목록</a>
						</p>
						<p>
							<a href="./registerShop.jsp">내 가게 등록</a>
						</p>
						<p>
							<a href="./modifyShop11.jsp">내 가게 정보 수정</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 내 가게 테이블 관리 -->
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo"> 내 가게 테이블 관리 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<p>
							<a href="tableList.jsp">내 가게 테이블 목록</a>
						</p>
						<p>
							<a href="registerTable.jsp">내 가게 테이블 등록</a>
						</p>
						<p>
							<a href="modifyTable.jsp">내 가게 테이블 수정</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 내 가게 메뉴 관리 -->
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseThree"> 내 가게 메뉴 관리 </a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse">
					<div class="panel-body">
						<p>
							<a href="foodMenuList.jsp"> 내 가게 메뉴 조회</a>
						</p>
						<p>
							<a href="registerMenu.jsp"> 내 가게 메뉴 등록</a>
						</p>
						<p>
							<a href="modifyMenu.jsp">내 가게 메뉴 수정</a>
						</p>
						<p>
							<a href="menuCatagoryPlusMinus.jsp">내 가게 메뉴 카테고리 추가 및 수정</a>
						</p>
					</div>
				</div>
			</div>

			<!-- 내 가게 주문 관리 -->
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseFour"> 내 가게 주문 관리 </a>
					</h4>
				</div>
				<div id="collapseFour" class="panel-collapse collapse ">
					<div class="panel-body">
						<p>
							<a href="OrderList11.jsp">내 가게 주문내역 조회</a>
						</p>
					</div>
				</div>
			</div>
			<br> 
			
			<!-- 내 가게 매출 관리 -->
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseFive"> 내 가게 매출 관리 </a>
					</h4>
				</div>
				<div id="collapseFive" class="panel-collapse collapse  in">
					<div class="panel-body">
						<p>
							<a href="chartDay.jsp">내 가게 일일 매출 현황</a>
						</p>
						<p>
							<a href="chartMonth.jsp">내 가게 기간 별 매출 현황</a>
						</p>
					</div>
				</div>
			</div>
			<br> 
			
			<!-- 내 가게 SNS 홍보하기 -->
			<div class="panel panel-danger">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseSix"> 내 가게 SNS 홍보</a>
					</h4>
				</div>
				<div id="collapseSix" class="panel-collapse collapse  ">
					<div class="panel-body">
						<p>
							<a href="sendCacao.jsp">SNS 문자 보내기</a>
						</p>						
					</div>
				</div>
			</div>
			<br> 
			
			<!-- 왼쪽 구글 앱 스토어, 애플 앱 스토어, 윈도우 이미지 -->
			<img class="sideimage" alt="" src="./img/AndroidApp.jpg">
			<img class="sideimage" alt="" src="./img/AppStore.jpg"> 
			<img class="sideimage" alt="" src="./img/window8.jpg">
		</div>

	</div>
</div>