<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	body {
		font-family: 'Do Hyeon', sans-serif;
		background-color: hsl(60, 100%, 98%);
	}
	h1{
		font-size: 42px;
		margin-top: 50px;
	}
	a {
		text-decoration: none;
		margin: 30px;
		font-size: 24px;
	}

	.signin {
		width: 500px;
		height: 500px;
		margin: auto;
		text-align: center;
		line-height: 100px;
	}

	div a:link {
		color: black;
	}

	div a:visited {
		color: black;
	}
	
</style>
</head>
<body class="signin">
	<h1>Index</h1>
	<div>
		<a href="user/SignIn.do">Sign in</a>
		<a href="user/SignUp.do">Sign up</a>
		<a href="buy/buy.do">buy</a>
	</div>
</body>
</html>