<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../com/header.jsp"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
	
	function checkForm() {
		if (document.signUp.id.value == "") {
			alert("아이디를 입력해 주세요");
			document.signUp.id.focus();
			return false;
		}
		if (document.signUp.pw.value == "") {
			alert("비밀번호를 입력해 주세요");
			document.signUp.pw.focus();
			return false;
		}
		if (document.signUp.pwConfirm.value == "") {
			alert("비밀번호를 동일하게 한번 더 입력해주세요");
			document.signUp.pwConfirm.focus();
			return false;
		}
		if (document.signUp.pw.value != document.signUp.pwConfirm.value) {
			alert("비밀번호가 일치하지 않습니다");
			document.signUp.pwConfirm.focus();
			return false;
		}
		if (document.signUp.licenseNum.value == "") {
			alert("사업자 등록번호를 입력해 주세요")
			document.signUp.licenseNum.focus();
			return false;
		}
		if (document.signUp.presidant.value == "") {
			alert("대표자 이름을 입력해 주세요") 
			document.signUp.presidant.focus();
			return false;
		}
		if (document.signUp.businessName.value == "") {
			alert("법인명을 입력해 주세요") 
			document.signUp.businessName.focus();
			return false;
		}
		
		
		return true;
	}
	
	
	
</script>
</head>
<body>

	<form name="signUp" action="${pageContext.request.contextPath}/signUp" method="post" onsubmit="return checkForm()">
		<br/><br/>
		<table align="center">
		<h3 align="center">회원 정보 입력</h3>
		<br/>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" /></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="pwConfirm" /></td>
			</tr>
			<tr>
				<td>법인 명</td>
				<td><input type="text" name="businessName" /></td>
			</tr>
			<tr>
				<td>사업자 등록 번호</td>
				<td><input type="text" name="licenseNum" size="10" maxlength="10"/></td>
			</tr>
			<tr>
				<td>대표자 명</td>
				<td><input type="text" name="presidant" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="가입신청" /> 
				<input type="reset" value="입력초기화" /> 
				<input type="button" value="신청취소" /></td>
			</tr>
		</table>

	</form>

</body>

<br/><br/>
<jsp:include page="../com/footer.jsp"/>
</html>

