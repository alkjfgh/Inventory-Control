<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/user/signIn.css"/>">
<script src="<c:url value="/resources/js/user/signIn.js" />"></script>
</head>
<body>
	<section class="login-form">
		<h1>로그인</h1>
		<form action="SignIn.do" method="post">
			<div class="int-area">
				<input type="text" name="userId" id="id" autocomplete="off" required="required" value="">
				<label for="id">아이디</label>
			</div>
			<div class="int-area">
				<input type="password" name="userPassword" id="pwd" autocomplete="off" required="required" value="">
				<label for="id">패스워드</label>
			</div>
			<div class="checkbox">
				<input name="keepLogin" type="checkbox" id="keepLogin" class="inp_radio" >
				<label for="keepLogin">
				<span class="img_top ico_check"></span>
				<span class="txt_lab">로그인 상태 유지</span>
				</label>
			</div>
			<div class="btn-area">
				<input type="submit" id="btn" value="로그인"></input>
			</div>
		</form>
		<div class="caption">
			<a href="../home.do">뒤로가기</a>
		</div>
	</section>
</body>
</html>