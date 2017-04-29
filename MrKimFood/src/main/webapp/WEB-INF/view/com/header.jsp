<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/common.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/company.css"/>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>Insert title here</title>

</head>

<body>


 
	<div class="header">

		<div class="logo">
			<img style="width:200px; height:100px;" src="http://placehold.it/200x100"/>
		</div>
		<div class="navigation">
		<img src="http://placehold.it/20x20"/>
				<div>
					<a id="home" href="${pageContext.request.contextPath}/mainPage">홈 | </a>
					<c:if test="${ not empty member.id }">
						<a href="${pageContext.request.contextPath}/logout">로그아웃 | </a>
					</c:if>
					<c:if test="${ not empty member.id }">
						<a href="${pageContext.request.contextPath}/myPage">마이페이지 | </a>
					</c:if>
					
					<c:if test="${ empty member.id }">
						<a id="login" href="${pageContext.request.contextPath}/login">로그인 | </a>
						<a id="signUp" href="${pageContext.request.contextPath}/signUp">회원가입 |</a></c:if> 고객센터
				</div>
				<!-- <input align="right" type="button" value="뒤로" onclick="window.history.back()" />
				<input align="right" type="button" value="앞으로" onclick="window.history.forward()" /> -->
		</div>

	</div>
	
	<div class="member_profile">
		<div class="member_profile_header"></div>
		<div class="member_profile_img">
			<img src="http://placehold.it/80x80"/>
		</div>
		<div class="member_profile_info">
			<div>
				홍길동 &nbsp;&nbsp; <input type="button" value="로그아웃"/>
			</div>
			<div>
				XXX@naver.com
			</div>
			<div>
				프로필 수정
			</div>
		</div>
	</div>
	

	<div class="profile_modify">
		<div class="profile_modify_img">
			<img src="http://placehold.it/110x110"/>
			<div>
				<input type="button" value="수정"/>&nbsp;
				<input type="button" value="취소"/>
			</div>
		</div>
		<div class="profile_modify_info">
			<table>
				<tr>
					<td>닉네임 :</td>
					<td>
						<input type="text">
					</td>
				</tr>
			</table>
		</div>
		<div class="profile_modify_btn">
			<input type="button" value="저장"/>&nbsp;
			<input type="button" value="취소"/>
		</div>
	</div>

