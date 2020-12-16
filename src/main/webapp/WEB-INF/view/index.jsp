<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고자동관리</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
a {
	text-decoration: none;
}
a:nth-child(2){
	margin-left: 50px;
}
a:nth-child(3){
	margin-left: 50px;
}

.signin {
	font-family: 'Do Hyeon', sans-serif;
	width: 800px;
	height: 500px;
	margin: auto;
	background-color: hsl(60, 100%, 98%);
	text-align: center;
	line-height: 100px;
}

div a:link {
	color: black;
}

div a:visited {
	color: black;
}
h1{
	margin: 50px;
	text-align: center;  
	font-size: 42px;
}
</style>
</head>
<body class="signin">
	<h1>재고자동관리</h1>
	<div>
		<a href="user/SignIn.do">로그인</a>
		<a href="user/SignUp.do">회원가입</a>
		<a href="buy/buy.do">구매페이지</a>
	</div>
</body>
</html>