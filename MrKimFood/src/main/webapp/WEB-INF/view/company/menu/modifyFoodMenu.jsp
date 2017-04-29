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
			
			var fileTypeArr=this.files[0].type.split('/');	//파일의 타입을 조사한다.
	    	
			if(fileTypeArr[0]!="image"){	//이미지 파일이 아닐경우 delete한 것과 같이 적용
				alert("이미지파일만 입력할 수 있습니다.");		//경고창을 날려준 다음
				
				//파일 초기화
				var str = navigator.userAgent.toLowerCase();
				if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
				    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
				} else {		// other browser 일때 input[type=file] init.
				    $("input[name=uploadFileImg]").val("");
				}
				
				//썸네일이미지를 변경시켜주고
				$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
				
				//input(hidden/hasImageType)의 value를 'd'로 변경
				$("input[name=hasImageType]").val("d");
				
			}else{//이미지 파일일 경우
				console.log("이미지파일일 때");
	    		var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	            reader.onload = function (e) {//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            	console.log("이미지 체인지");
	                $('#blah').attr('src', e.target.result);
	                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
	                //(아래 코드에서 읽어들인 dataURL형식)
	            }
	            //File내용을 읽어 dataURL형식의 문자열로 저장
	            reader.readAsDataURL(this.files[0]);
	            
	            //input(hidden/hasImageType)의 value를 'm'으로 변경
	            $("input[name=hasImageType]").val("m");
			}
    	}else{	//파일이 없을 때
    		
    		//썸네일이미지를 변경시켜주고
			$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
    	
			//input(hidden/hasImageType)의 value를 'd'로 변경
			$("input[name=hasImageType]").val("d");
    	}
    });
    
    //이미지 삭제를 눌렀을 때
    $("a#deleteImg").click(function(){
    	//썸네일 이미지를 제거
    	$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
    	
		//input(file)의 값을 초기화
		var str = navigator.userAgent.toLowerCase();
		if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
		} else {		// other browser 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").val("");
		}
    	
		//input(hidden/hasImageType)의 value를 'd'로 변경
    	$("input[name=hasImageType]").val("d");
		
    })
    
    //이미지 초기화를 눌렀을 때
    $("a#imageInit").click(function(){
    	//썸네일 이미지를 처음 이미지로 변경
    	<c:choose>
			<c:when test="${not empty models.foodImageList}">
	    		$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/${models.foodImageList[0].save_imageName}");
	    	</c:when>
	    	<c:otherwise>
	    		$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
	    	</c:otherwise>
    	</c:choose>	
    	
		//input(file)의 값을 초기화
    	var str = navigator.userAgent.toLowerCase();
		if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
		} else {		// other browser 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").val("");
		}
    	
		//input(hidden/hasImageType)의 value를 'n'로 변경
    	$("input[name=hasImageType]").val("n");
    })
});

</script>


<div class="main">
<jsp:include page="../../com/mainSideBar.jsp"/>

	<div id="content">
	
		[수정페이지]<br/>
		<form name="modifyMenuForm" action="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${models.foodNo}/modifyMenu" enctype="multipart/form-data" method="post">
		<div id="foodMenuInfo">
			메뉴이름: <input type="text" name="food_name" value="${models.foodMenuInfo.food_name}"/><br/>
			가격: <input type="text" name="pay" value="${models.foodMenuInfo.pay }"/><br/>
			칼로리:<input type="text" name="calory" value="${models.foodMenuInfo.calory }"/><br/>
			타입:<input type="text" name="food_type" value="${models.foodMenuInfo.food_type}"/> <br/>
		</div>
		
		<div id="foodMenuImage">
			<!-- 이미지 상태 판별자: 수정되지 않았을때('n'), 수정되었을 때('m'), 삭제되었을 때('d') -->
			<input type="hidden" name="hasImageType" value="n"/>
			
			음식 이미지:<br/>
			<input type="file" name="uploadFileImg" accept="image/*"/><br/>
			<a id="deleteImg">삭제</a>/<a id="imageInit">초기화</a>
			<div id="preview">
				<c:choose>
					<c:when test="${not empty models.foodImageList}">
						<img id="blah" width="250" height="200" src="${pageContext.request.contextPath}/img/menu/${models.foodImageList[0].save_imageName}">
					</c:when>
					<c:otherwise>
						<img id="blah" width="250" height="200" src="${pageContext.request.contextPath}/img/menu/No_image.png">
					</c:otherwise>
				</c:choose>
			</div>
   		</div>

	<hr>
		<input type="submit" value="수정하기"/>
		<input type="button" value="취소" onclick="javascript:window.history.back();"/>
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
$( document ).ready(function() {
    //파일 체인지 이벤트가 일어날 경우.
    $("input[type='file']").change(function(){
    	var file = null;
    	file = this.files[0];	//파일이 있을경우 [ object File ](= object.toString())을 반환, 없을경우 undefined(=null)를 반환
    	if(file){	//파일이 있는가?
	    	console.log("이미지 체인지");
	    	console.log(this.files[0]);
			
			var fileTypeArr=this.files[0].type.split('/');	//파일의 타입을 조사한다.
	    	
			if(fileTypeArr[0]!="image"){	//이미지 파일이 아닐경우 delete한 것과 같이 적용
				alert("이미지파일만 입력할 수 있습니다.");		//경고창을 날려준 다음
				
				//파일 초기화
				var str = navigator.userAgent.toLowerCase();
				if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
				    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
				} else {		// other browser 일때 input[type=file] init.
				    $("input[name=uploadFileImg]").val("");
				}
				
				//썸네일이미지를 변경시켜주고
				$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
				
				//input(hidden/hasImageType)의 value를 'd'로 변경
				$("input[name=hasImageType]").val("d");
				
			}else{//이미지 파일일 경우
				console.log("이미지파일일 때");
	    		var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	            reader.onload = function (e) {//파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            	console.log("이미지 체인지");
	                $('#blah').attr('src', e.target.result);
	                //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
	                //(아래 코드에서 읽어들인 dataURL형식)
	            }
	            //File내용을 읽어 dataURL형식의 문자열로 저장
	            reader.readAsDataURL(this.files[0]);
	            
	            //input(hidden/hasImageType)의 value를 'm'으로 변경
	            $("input[name=hasImageType]").val("m");
			}
    	}else{	//파일이 없을 때
    		
    		//썸네일이미지를 변경시켜주고
			$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
    	
			//input(hidden/hasImageType)의 value를 'd'로 변경
			$("input[name=hasImageType]").val("d");
    	}
    });
    
    //이미지 삭제를 눌렀을 때
    $("a#deleteImg").click(function(){
    	//썸네일 이미지를 제거
    	$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
    	
		//input(file)의 값을 초기화
		var str = navigator.userAgent.toLowerCase();
		if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
		} else {		// other browser 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").val("");
		}
    	
		//input(hidden/hasImageType)의 value를 'd'로 변경
    	$("input[name=hasImageType]").val("d");
		
    })
    
    //이미지 초기화를 눌렀을 때
    $("a#imageInit").click(function(){
    	//썸네일 이미지를 처음 이미지로 변경
    	<c:choose>
			<c:when test="${not empty models.foodImageList}">
	    		$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/${models.foodImageList[0].save_imageName}");
	    	</c:when>
	    	<c:otherwise>
	    		$('#blah').attr('src', "${pageContext.request.contextPath}/img/menu/No_image.png");
	    	</c:otherwise>
    	</c:choose>	
    	
		//input(file)의 값을 초기화
    	var str = navigator.userAgent.toLowerCase();
		if ( -1 != str.indexOf('msie') ){	// ie 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").replaceWith( $("input[name=uploadFileImg]").clone(true) );
		} else {		// other browser 일때 input[type=file] init.
		    $("input[name=uploadFileImg]").val("");
		}
    	
		//input(hidden/hasImageType)의 value를 'n'로 변경
    	$("input[name=hasImageType]").val("n");
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
		$("#modifyFoodMenuBtn").click(function(){
			if($("input[name=food_name]").val()==""){
				alert("메뉴 이름을 입력하세요");
				$("input[name=food_name]").focus();
			}else if($("input[name=pay]").val()==""){
				alert("가격을 입력해 주세요");
				$("input[name=pay]").focus();
			}else{
				$("form[name=modifyMenuForm]").submit();
			}
		})
		
});
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
	<form class="form-horizontal" role="form" name="modifyMenuForm" 
		action="${pageContext.request.contextPath}/company/myShop/${models.shopNo}/foodMenuInfo/${models.foodNo}/modifyMenu" 
		enctype="multipart/form-data" method="post">
		<div class="panel-body">
			<br>
				<!-- 내 가게 메뉴 카테고리 SELECT 폼 -->
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">메뉴
						카테고리</label>
					<div class="col-md-8">
						<select class="form-control" name="food_classify_id">
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
						<input type="text" class="form-control" name="food_name" value="${models.foodMenuInfo.food_name}">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">가격</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="pay" value="${models.foodMenuInfo.pay}">
					</div>
				</div>
				<div class="form-group">
					<label for="Password" class="col-md-3 control-label">칼로리</label>
					<div class="col-md-8">
						<input type="text" class="form-control" name="calory" value="${models.foodMenuInfo.calory}">
					</div>
				</div>
				<br>

				<!-- 내 가게 메뉴 사진 이미지 등록 INPUT 그룹 -->
				<div class="row1">
					<div  id="preview" class="col-md-4 col-md-offset-3">
						<c:choose>
							<c:when test="${not empty models.foodImageList}">
								<img id="blah" width="200px" height="200px" src="${pageContext.request.contextPath}/img/menu/${models.foodImageList[0].save_imageName}">
							</c:when>
							<c:otherwise>
								<img id="blah" width="200px" height="200px" src="${pageContext.request.contextPath}/img/menu/No_image.png">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-md-4">
						<div class="form-group">
						<!-- 이미지 상태 판별자: 수정되지 않았을때('n'), 수정되었을 때('m'), 삭제되었을 때('d') -->
						<input type="hidden" name="hasImageType" value="n"/>
						
							<label for="exampleInputFile">음식 이미지</label>&nbsp;&nbsp;&nbsp;<a id="deleteImg">삭제</a> , <a id="imageInit">초기화</a><br> 
							<input type="file" id="foodImageInputFile" name="uploadFileImg" accept="image/*">
							<p class="help-block">음식 이미지를 jpg 파일 형식으로 첨부하여 주십시오.</p>
						</div>
					</div>
				</div>


				<!-- 내 가게 수정, 확인 버튼 그룹 -->
				<div class="buttomgroup1">
					<div class="form-group">
						<div class="row2">
							<div class="col-md-8 col-md-offset-5">
								<br> <br>
								<button type="button" id="modifyFoodMenuBtn" class="btn btn-primary">수정</button>
								<button type="button" class="btn btn-default cansoleBtn">취소</button>
								<br> <br>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		
	</div>

</div>

<!-- SideBanner -->
<jsp:include page="../../com/FPbanner.jsp"></jsp:include>


<!-- footer -->
<jsp:include page="../../com/FPfooter.jsp"></jsp:include>