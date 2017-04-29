<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- header -->
<jsp:include page="commonView/FPheader.jsp"></jsp:include>

<!-- mycss -->
<link href="./css/mycss/body_container.css" rel="stylesheet"
	type="text/css">
<link href="./css/mycss/header_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="./css/mycss/footer_prodcthead.css" rel="stylesheet"
	type="text/css">
<link href="./css/kfonts2.css" rel="stylesheet" type="text/css">

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
</style>


<script type="text/javascript">
	$(document).ready(function() {

	});
</script>

<!-- body -->


<!-- SideBar -->
<jsp:include page="commonView/FPsideBarCustomer.jsp"></jsp:include>

<!-- contact_form -->
<div class="tablebody">
	<div class="col-md-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">푸드패스 자주 묻는 질문</h3>
				<br>
			</div>
			<br>
			<br>
			<div class="panel-body">
				<div class="col-md-10 col-md-offset-1">
					<div class="table-responsive">
						<table class="table table-condensed">
							<form class="form-horizontal" role="form" id="ajax-contact-form"
								action="#">
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
								<div class="form-group">
									<button class="send_btn" type="submit">전 송</button>
									<button type="reset" class="send_btn">재설정</button>
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
<jsp:include page="commonView/FPbanner.jsp"></jsp:include>

<!-- footer -->
<jsp:include page="commonView/FPfooter.jsp"></jsp:include>