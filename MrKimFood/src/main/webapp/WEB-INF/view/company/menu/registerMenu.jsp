<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %> 
<%--
<jsp:include page="../../com/header.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/jquery.js"></script>
<script type="text/javascript">

$( document ).ready(function() {
	
    //파일 체인지 이벤트가 일어날 경우.
    $("input[type='file']").change(function(){
    	var file = null;
    	file = this.files[0];	//파일이 있을경우 [ object File ](= object.toString())을 반환, 없을경우 undefined(=null)를 반환
    	if(file){	//파일이 있는가?
	    	console.log("이미지 체인지");
	    	console.log(this.files[0]);
	    	
			//file.type.match("image*");
			var fileType= this.files[0].type;
			var fileTypeArr=fileType.split('/');	//파일의 타입을 조사한다.
	    	
			if(fileTypeArr[0]!="image"){	//이미지 파일이 아닐경우 delete한 것과 같이 적용
				alert("이미지파일만 입력할 수 있습니다.");		//경고창을 날려준 다음
				
				//div#preview 하위에 들어있는 요소를 제거시킨다.
				$("div#preview").empty();
				
				//파일 초기화
				var str = navigator.userAgent.toLowerCase();
				if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
				    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
				} else {		// other browser 일때 input[type=file] init.
				    $("input[name=uploadFileImg]").val("");
				}
				
			}else{//이미지 파일일 경우
				//#preview하위에 image 엘리먼트를 생성시킨다.
				$("div#preview").html("<img id='blah' width='250' height='200'>");
			
	    		var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	            reader.onload = function (e) {//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	                $("#blah").attr("src", e.target.result);
	                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
	                //(아래 코드에서 읽어들인 dataURL형식)
	            }
	            //File내용을 읽어 dataURL형식의 문자열로 저장
	            reader.readAsDataURL(this.files[0]);
	            
			}
    	}else{	//파일이 없을 때
    		$("div#preview").empty();	//preview영역에 보여지는 이미지를 제거
    	}
    });
    
    //이미지 삭제를 눌렀을 때
    $("a#deleteImg").click(function(){
    	//썸네일 이미지를 제거
    	$("div#preview").empty();

    	//input(file)의 값을 초기화
		var str = navigator.userAgent.toLowerCase();
		if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
		} else {		// other browser 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").val("");
		}
    })
});
</script>

<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"/>
	
	<div id="content">
	[테스트코드]<br/>
	메뉴등록<br/>
	매장번호: ${models.shopNo}<br/>
	<hr>
	<form name="registerMenuForm" action="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/registerMenu" enctype="multipart/form-data" method="post">
		<div id="foodMenuInfo">
			메뉴이름: <input type="text" name="food_name"/><br/>
			가격: <input type="text" name="pay"/><br/>
			칼로리:<input type="text" name="calory"/><br/>
			타입: <select name="food_type">
				<option value="chicken">치킨</option>
				<option value="snack">안주</option>
				<option value="pizza">피자</option>
			</select><br/>
		</div>
		
		<div id="foodMenuImage">
			음식 이미지:<br/>
			<input type="file" name="uploadFileImg"/><br/>
			<a id="deleteImg">[삭제]</a><br/>
			<div id="preview"></div>
   		</div>

	<hr>
		<input type="submit" value="메뉴 등록"/>
	</form>
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
.row {
	padding-left: 30px;
}

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
	
	margin-bottom: 28px;
}

footer.prodcthead {
	margin-top: 76%;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		//select바가 변할 경우 가계정보 변환
		$("select.shopInfoSideBar").change(function(){
			location.replace("${pageContext.request.contextPath}/company/foodMenu/registerMenu?shopNo="+$(this).val());
		})
		
		//파일 체인지 이벤트가 일어날 경우.
	    $("input[type='file']").change(function(){
	    	var file = null;
	    	file = this.files[0];	//파일이 있을경우 [ object File ](= object.toString())을 반환, 없을경우 undefined(=null)를 반환
	    	if(file){	//파일이 있는가?
		    	console.log("이미지 체인지");
		    	console.log(this.files[0]);
		    	
				//file.type.match("image*");
				var fileType= this.files[0].type;
				var fileTypeArr=fileType.split('/');	//파일의 타입을 조사한다.
		    	
				if(fileTypeArr[0]!="image"){	//이미지 파일이 아닐경우 delete한 것과 같이 적용
					alert("이미지파일만 입력할 수 있습니다.");		//경고창을 날려준 다음
					
					//div#preview 하위에 들어있는 요소를 제거시킨다.
					$("div#preview").empty();
					
					//파일 초기화
					var str = navigator.userAgent.toLowerCase();
					if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
					    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
					} else {		// other browser 일때 input[type=file] init.
					    $("input[name=uploadFileImg]").val("");
					}
					
				}else{//이미지 파일일 경우
					//#preview하위에 image 엘리먼트를 생성시킨다.
					$("div#preview").html("<img id='blah' width='200' height='200'>");
				
		    		var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
		            reader.onload = function (e) {//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
		                $("#blah").attr("src", e.target.result);
		                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
		                //(아래 코드에서 읽어들인 dataURL형식)
		            }
		            //File내용을 읽어 dataURL형식의 문자열로 저장
		            reader.readAsDataURL(this.files[0]);
		            
				}
	    	}else{	//파일이 없을 때
	    		$("div#preview").empty();	//preview영역에 보여지는 이미지를 제거
	    	}
	    })
		
		 //이미지 삭제를 눌렀을 때
	    $("a#deleteImg").click(function(){
	    	//썸네일 이미지를 제거
	    	$("div#preview").empty();
	
	    	//input(file)의 값을 초기화
			var str = navigator.userAgent.toLowerCase();
			if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
			    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
			} else {		// other browser 일때 input[type=file] init.
			    $("input[name=uploadFileImg]").val("");
			}
	    })
    
		//가격과 칼로리는 숫자만 입력할 수 있도록 설정
		$("input[name=pay]").bind("keypress", function (e) {
		   if(e.keyCode >47 && e.keyCode < 58){
			   return true;
		   }else{
			   return false;
		   }
		})
		
		$("input[name=calory]").bind("keypress", function (e) {
		   if(e.keyCode >47 && e.keyCode < 58){
			   return true;
		   }else{
			   return false;
		   }
		})
		
		//취소버튼 클릭
		$(".cansoleBtn").click(function(){
			window.history.back();
		})
		
		//메뉴등록 선택 버튼을 누를때
		$("#registerFoodMenuBtn").click(function(){
			if($("select[name=foodCatagoryNo]").val() == "selectGo"){
				alert("메뉴 카테고리를 선택하여 주세요.");
				$("select[name=foodCatagoryNo]").focus();
			}else if($("input[name=food_name]").val()==""){
				alert("메뉴 이름을 입력하세요");
				$("input[name=food_name]").focus();
			}else if($("input[name=pay]").val()==""){
				alert("가격을 입력해 주세요");
				$("input[name=pay]").focus();
			}else{
				$("form[name=registerFoodMenuForm]").submit();
			}
		})
		
	}); 
</script>
<!-- body -->


<!-- SideBar -->
<jsp:include page="../../com/FPsideBar.jsp"></jsp:include>


<div class="col-md-8">

<!-- 내 가게 정보 -->
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">내 가게 정보</h3>
	</div>
	<br>

	<!-- 내 가게 목록 SELECT 박스 -->
	<div class="row1">
		<div class="col-md-3">
			<select class="form-control shopInfoSideBar">
					<!-- 회원이 관리하는 shop 개수만큼 반복문 실행 -->
					<c:forEach items="${models.selectBarList}" var="shopSelectBarList">
						<!-- 해당 shop이 선택되어지도록 처리 -->
						<c:choose>
							<c:when	test="${models.shopNo == shopSelectBarList.restaurant_ID}">
								<option value="${shopSelectBarList.restaurant_ID}"
									selected="selected">
									${shopSelectBarList.restaurant_name }</option>
							</c:when>
							<c:otherwise>
								<option value="${shopSelectBarList.restaurant_ID}">
									${shopSelectBarList.restaurant_name }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
		</div>
	</div>

	<!-- 내 가게 목록 테이블 -->
	<div class="panel-body">
		<div class="table-responsive">
			<table class="table table-bordered">
				<tbody>
						<tr>
							<td class="text-center gr"><strong>내 가게 이름</strong></td>
							<td>${models.shopInfo.restaurant_name }</td>
							<td class="text-center gr"><strong>전화번호</strong></td>
							<td>${models.shopInfo.res_phone}</td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>내 가게 분류</strong></td>
							<td>${models.shopInfo.restaurant_type}</td>
							<td class="text-center gr"><strong>오픈 시간</strong></td>
							<td>${models.shopInfo.openingTime}</td>
						</tr>
						<tr>
							<td class="text-center gr"><strong>내 가게 주소</strong></td>
							<td>${models.shopInfo.address}</td>
							<td class="text-center gr"><strong>종료 시간</strong></td>
							<td>${models.shopInfo.closingTime}</td>
						</tr>
					</tbody>
			</table>
		</div>
	</div>
</div>

<!-- 내 가게 메뉴 등록 박스  -->
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">내 가게 메뉴 등록</h3>
			<br>
		</div>
		<div class="panel-body">
			<br>
			<form class="form-horizontal" name="registerFoodMenuForm" role="form" action="${pageContext.request.contextPath}/company/foodMenu/registerMenu" enctype="multipart/form-data" method="post">
				
				<input type="hidden" name="shopNo" value="${models.shopNo}"/>
				
				<!-- 내 가게 메뉴 카테고리 SELECT 폼 -->
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">메뉴
						카테고리</label>
					<div class="col-md-8">
						<select class="form-control" name="food_classify_id">
							<option value="selectGo">메뉴 카테고리를 선택해 주세요.</option>
							<c:forEach items="${models.menuCatagoryList}" var="menuCatagoryBarList">
								<option value="${menuCatagoryBarList.foodClassifyId}">${menuCatagoryBarList.foodClassifyName}</option>
							</c:forEach>
							<option value="-1">기타</option>
						</select>
					</div>
				</div>

				<!-- 내 가게 메뉴 등록 INPUT 폼 그룹 -->

				<div class="form-group">
					<label for="ID" class="col-md-3 control-label">메뉴 이름</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="food_name">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">가격</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="pay">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">칼로리</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="calory">
					</div>
				</div>
				<br>

				<!-- 내 가게 메뉴 사진 이미지 등록 INPUT 그룹 -->
				<div class="row1">
					<div id="preview" class="col-md-4 col-md-offset-3">
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label for="exampleInputFile">음식 이미지</label> &nbsp;&nbsp;&nbsp; <a id="deleteImg">[파일 삭제]</a><br> 
							<input type="file" id="foodImageInputFile" name="uploadFileImg" accept="image/*"/>
							<p class="help-block">음식 이미지를 jpg 파일 형식으로 첨부하여 주십시오.</p>
						</div>
					</div>
				</div>
			</form>

			<!-- 내 가게 등록, 취소 버튼 그룹 -->
			<div class="buttomgroup1">
				<div class="form-group">
					<div class="row2">
						<div class="col-md-8 col-md-offset-5">
							<br> <br>
							<button type="button" id="registerFoodMenuBtn" class="btn btn-primary">등록</button>
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