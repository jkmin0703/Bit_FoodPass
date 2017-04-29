<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<%--
<jsp:include page="../../com/header.jsp"/>
<script type="text/javascript">
	function dropMenuBtnClick(){
		if(confirm("메뉴를 삭제하시겠 습니까?")){
			location.href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${models.foodNo}/deleteMenu";
			return true;
		}else{
			return false;
		}
	}
	function modifyMenuBtnClick(){
		location.href="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${models.foodNo}/modifyMenu";
	}
</script>

<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"/>

	<div id="content">
			<div id="foodMenuInfo">
			[메뉴정보]<br/><br/>
			
			메뉴명:${models.foodMenuInfo.food_name}<br/>
			가격:${models.foodMenuInfo.pay}<br/>
			칼로리:<c:if test="${not empty models.foodMenuInfo.calory}">
						${models.foodMenuInfo.calory}
				   </c:if> <br/>
			Food Type:<c:if test="${not empty models.foodMenuInfo.food_type}">
							${models.foodMenuInfo.food_type}
					  </c:if><br/><br/><br/>
			
			</div>
			<div id="foodMenuImage">
				<c:choose>
					<c:when test="${not empty models.foodImageList}">
						<c:forEach items="${models.foodImageList}" var="foodImage">
							<img width="250" height="200" src="${pageContext.request.contextPath}/img/menu/${foodImage.save_imageName}"><br/>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<img width="250" height="200" src="${pageContext.request.contextPath}/img/menu/No_image.png"><br/>
					</c:otherwise>
				</c:choose>
			</div>
			<hr/>
			
			<input type="button" value="수정" onclick="modifyMenuBtnClick()"/>
			<input type="button" value="삭제" onclick="dropMenuBtnClick()"/>
			
	</div>

</div>
<jsp:include page="../../com/footer.jsp"/>
 --%>
 
 
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
.buttomgroup2 {
	margin-top: -25px;
	s
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

footer.prodcthead {
	margin-top: 83%;
}
</style>

<script type="text/javascript">
	$(document).ready(function(){
		$(".cansoleBtn").click(function(){
			window.history.back();
		})
		
		$("#deleteMenuBtn").click(function(){
			if(confirm("메뉴를 삭제하시겠 습니까?")){
				$(location).attr('href',"${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${models.foodNo}/deleteMenu");
			}else{	}
		})
		
		$("#modifyMenuBtn").click(function(){
			$(location).attr('href',"${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${models.foodNo}/modifyMenu");
		})
	})
</script>
<!-- body -->


<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>

<div class="col-md-8">

<!-- 내 가게 메뉴 정보 박스  -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 정보</h3>
			<br>
		</div>
		<div class="panel-body">
			<br>
			<form class="form-horizontal" role="form">
				<!-- 내 가게 메뉴 카테고리 SELECT 폼 -->
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">메뉴
						카테고리</label>
					<div class="col-md-8">
						<select class="form-control" disabled>
							<c:forEach items="${models.menuCatagoryList}" var="menuCatagory">
								<c:choose>
									<c:when test="${models.foodMenuInfo.food_classify_id == menuCatagory.foodClassifyId}">
										<option value="${menuCatagory.foodClassifyId}" selected="selected">${menuCatagory.foodClassifyName}</option>
									</c:when>
									<c:otherwise>
										<option value="${menuCatagory.foodClassifyId}">${menuCatagory.foodClassifyName}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${empty models.foodMenuInfo.food_classify_id}">
									<option value="-1" selected="selected">기타</option>
								</c:when>
								<c:otherwise>
									<option value="-1">기타</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>

				<!-- 내 가게 메뉴 등록 INPUT 폼 그룹 -->

				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">메뉴 이름</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${models.foodMenuInfo.food_name}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">가격</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${models.foodMenuInfo.pay}" disabled>
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">칼로리</label>
					<div class="col-md-8">
						<input type="text" class="form-control" value="${models.foodMenuInfo.calory}" disabled>
					</div>
				</div>
				<br>

				<!-- 내 가게 메뉴 사진 이미지 등록 INPUT 그룹 -->
				<div class="row1">
					<div class="col-md-4 col-md-offset-4">
						<c:choose>
							<c:when test="${not empty models.foodImageList}">
								<c:forEach items="${models.foodImageList}" var="foodImage">
									<img width="200" height="200" src="${pageContext.request.contextPath}/img/menu/${foodImage.save_imageName}"><br/>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<img width="200" height="200" src="${pageContext.request.contextPath}/img/menu/No_image.png"><br/>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</form>

			<!-- 내 가게 수정, 확인 버튼 그룹 -->
			<div class="buttomgroup1">
				<div class="form-group">
					<div class="row2">
						<div class="col-md-8 col-md-offset-4">
							<br> <br>
							<button type="button" id="modifyMenuBtn" class="btn btn-primary">수정</button>
							<button type="button" id="deleteMenuBtn" class="btn btn-danger">삭제</button>
							<button type="button" class="btn btn-default cansoleBtn">취소</button>
							<br> <br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	

</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>