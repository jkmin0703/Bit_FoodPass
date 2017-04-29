<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

/* 캐러셀 컨트롤 위치 설정 코드 */
.control {
	position: inherit;
	top: 50%;
	z-index: 5;
	display: inline-block;
	right: 50%;
}

/*.table > thead > tr > .no-line {border-bottom: none;}*/
.table>tbody>tr>.thick-line {
	border-top: 2px solid #dddddd;;
}

.table>tbody>tr>.no-line {
	border-top: none;
}

.sideimage {
	margin-top: 3px;
	margin-left: -2px;
}

.row2 {
	margin-top: -20px;
	margin-bottom: -20px;
	margin-left: -40px;
}
</style>


<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

<!-- body -->


<!-- SideBar -->
<jsp:include page="../../com/FPsideBarCustomer.jsp"></jsp:include>

<!-- contact_form -->
<div class="tablebody">
	<div class="col-md-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">푸드패스 문의하기</h3>
				<br>
			</div>
			<br> <br>
			<div class="panel-body">
				<div class="col-md-10 col-md-offset-1">
					<div class="table-responsive">
						<table class="table table-condensed">
							<form class="form-horizontal" role="form" id="ajax-contact-form">
								<div class="form-group">
									<input type="text" class="form-control required" name="name"
										placeholder="이름" title="Name">
								</div>
								<div class="form-group">
									<input type="text" class="form-control required" name="email"
										placeholder="이메일" title="Email">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="subject"
										placeholder="제목" title="Subject">
								</div>
								<div class="form-group">
									<textarea name="message" class="form-control required"
										id="message" title="Message" placeholder="내용" rows=5></textarea>
								</div>
								<!-- 내 가게 테이블 등록, 취소 버튼 그룹 -->
								<div class="buttomgroup2">
									<div class="form-group">
										<div class="row2">
											<div class="col-md-8 col-md-offset-5">
												<br> <br>
												<button type="button" class="btn btn-primary">전송</button>
												<button type="button" class="btn btn-default">취소</button>
												<br>
											</div>
										</div>
									</div>
								</div>
							</form>
						</table>
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