<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<!-- header -->
<jsp:include page="../../com/FPheader.jsp"></jsp:include>

<!-- mycss -->
<link href="${pageContext.request.contextPath}/css/mycss/body_container.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/mycss/header_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/mycss/footer_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="${pageContext.request.contextPath}/css/kfonts2.css" rel="stylesheet" type="text/css">


<style>
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

.buttomgroup1{
	margin-bottom:65px;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		var currentPage = parseInt("${models.pagingInfo.pageNav}"); // 현재 페이지
		console.log("현재 페이지:"+currentPage);
		
		// 페이징 버튼을 클릭 했을때
		$(".pagingBtn").click(function(){
			console.log("현재 페이지 체크리스트 개수: "+$("input:checkbox[name='deleteCheck']").length);
			
			//1. 서버에서 받은 checkList값을 배열에 저장한다.
			var checkListArr = new Array();
			if($("input:hidden[name='checkList']").val() != ""){
				checkListArr = $("input:hidden[name='checkList']").val().split(",");
			}
			console.log("초기checkList: "+checkListArr);
			
			//2. 배열의 값들중 현제페이지의 shopNo에 해당하는 값들을 삭제한다.
			for(var i=0;i<checkListArr.length;i++){
				for(var j=0; j<$("input:checkbox[name='deleteCheck']").length;j++){
					if( checkListArr[i] == $("input:checkbox[name='deleteCheck']").eq(j).val() ){
						checkListArr.splice(i, 1);
					}
				}
			}
			console.log("1차:"+checkListArr);
			
			//3. 체크된 shopNo의 값을 배열에 저장한다.
			for(var i=0; i<$("input:checkbox[name='deleteCheck']").length;i++){
				var checkBox = $("input:checkbox[name='deleteCheck']").eq(i);
				console.log(i+"체크박스:");
				console.log(checkBox.is(":checked")==true);
				if(checkBox.is(":checked")==true){
					console.log("박스의 값: "+checkBox.val());
					checkListArr.push(checkBox.val());
				}
			}
			console.log("최종 checkList 배열 값: "+checkListArr);
			
			//4. 선택한 페이지의 pageNum을 얻어온다.
			var pageNum = $(this).attr("pageNum");
			
			//5. 선택한 페이지로 이동한다.(javascript의 'location.href')
			//$(location).attr("href","${pageContext.request.contextPath}/company/deleteShop?page="+pageNum+"&checkListStr="+checkListArr);
			location.replace("${pageContext.request.contextPath}/company/deleteShop?page="+pageNum+"&checkListStr="+checkListArr);
		});
		
		//삭제버튼 클릭
		$("#deleteShopBtn").click(function(){
			//1. 서버에서 받은 checkList값을 배열에 저장한다.
			var checkListArr = new Array();
			if($("input:hidden[name='checkList']").val() != ""){
				checkListArr = $("input:hidden[name='checkList']").val().split(",");
			}
			console.log("초기checkList: "+checkListArr);
			
			//2. 배열의 값들중 현제페이지의 shopNo에 해당하는 값들을 삭제한다.
			for(var i=0;i<checkListArr.length;i++){
				for(var j=0; j<$("input:checkbox[name='deleteCheck']").length;j++){
					if( checkListArr[i] == $("input:checkbox[name='deleteCheck']").eq(j).val() ){
						checkListArr.splice(i, 1);
					}
				}
			}
			console.log("현제page에 해당하는 shopNo 제거 후:"+checkListArr);
			
			//3. 체크된 shopNo의 값을 배열에 저장한다.
			for(var i=0; i<$("input:checkbox[name='deleteCheck']").length;i++){
				var checkBox = $("input:checkbox[name='deleteCheck']").eq(i);
				console.log(i+"체크박스:");
				console.log(checkBox.is(":checked")==true);
				if(checkBox.is(":checked")==true){
					console.log("박스의 값: "+checkBox.val());
					checkListArr.push(checkBox.val());
				}
			}
			console.log("최종 checkList 배열 값: "+checkListArr);
			if(checkListArr.length == 0){
				alert("삭제할 매장이 없습니다.\n"+"하나 이상의 매장을 선택해 주세요.");
			}else{
				//4. 배열의 값을 다시 String로 바꾸어 hidden 태그에 저장한다.
				$("input:hidden[name='checkList']").val(checkListArr.toString());
				
				//5. form을 submit 시킨다.
				$("form[name='deleteShopForm']").submit();
			}
		})
		
		//취소버튼 클릭
		$(".cancelBtn").click(function(){
			window.history.back();
		})
	})
</script>

<!-- body -->

<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>

<!-- 내 가게 삭제 목록 박스 -->
<div class="col-md-8">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 삭제</h3>
			<br>
		</div>

		<div class="panel-body">
			<div class="table-responsive">
				
				<table class="table table-condensed">
					<!-- 내 가게 목록 table 칼럼명-->
					<thead>
						<tr>

							<th>내 가게 이름</th>
							<th class="text-center">내 가게 주소</th>
							<th class="text-center">내 가게 분류</th>
							<th class="text-right">오픈 시간</th>
							<th class="text-right">종료 시간</th>
							<th class="text-right">선택</th>

						</tr>
					</thead>

					<!-- 내 가게 정보 -->
					<tbody>
						
						<c:forEach items="${models.shopList}" var="shopList">
							<tr>
								<td>${shopList.restaurant_name}</td>
								<td class="text-center">${shopList.address }</td>
								<td class="text-center">${shopList.restaurant_type }</td>
								<td class="text-right">${shopList.openingTime}</td>
								<td class="text-right">${shopList.closingTime}</td>
								<td class="text-right">
									<input type="checkbox" class="deleteCheck" name="deleteCheck" value="${shopList.restaurant_ID}"
										<c:forEach items="${models.checkListInfo.checkList}" var="checkList">
											<c:if test="${shopList.restaurant_ID == checkList}">
												checked="checked"
											</c:if>
										</c:forEach>
									/>
								</td>
							</tr>
						</c:forEach>
						
						<!-- 내 가게 목록 테이블 맨 아래 줄 부분 코드 -->
						<tr>
							<td colspan="6" class="thick-line"></td>
						</tr>

					</tbody>
				</table>
				
				<!-- 페이지 네비게이션 -->
				<div class="pagenavigation">
					<div class="page_buttoms text-center">
						<ul class="pagination pagination-sm">
							<c:if test="${models.pagingInfo.blockNav != 1}">
								<li><a href="javascript:void(0);" class="pagingBtn" pageNum="${((models.pagingInfo.blockNav -2) *models.pagingInfo.pageListCount) +1}">«</a></li>
							</c:if>
								
							<c:forEach var="pageNum" 
								 begin="${models.pagingInfo.startPage}" 
								 end="${models.pagingInfo.endPage}" 
								 step="1">
							<li><a href="javascript:void(0);" class="pagingBtn" pageNum="${pageNum}">${pageNum}</a></li>
							</c:forEach>
	
							<c:if test="${models.pagingInfo.blockNav != models.pagingInfo.totalBlock}">
								<li><a  href="javascript:void(0);" class="pagingBtn" pageNum="${(models.pagingInfo.blockNav *models.pagingInfo.pageListCount) +1}">»</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				
				<form class="form-horizontal" role="form" name="deleteShopForm" action="${pageContext.request.contextPath}/company/deleteShop" method="post">
					<input type="hidden" name="checkList" value="${models.checkListInfo.checkListStr}"/>
				
					<!-- 내 가게 삭제 및 취소 -->
					<div class="buttomgroup1">
						<div class="form-group">
							<div class="col-md-8 col-md-offset-5">
								<button type="button" id="deleteShopBtn" class="btn btn-primary">삭제</button>
								<button type="button" class="btn btn-default cancelBtn">취소</button>
							</div>
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>