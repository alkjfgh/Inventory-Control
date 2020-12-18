<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>Sign In</title>

	<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		body {
			font-family: 'Do Hyeon', sans-serif;
			margin: auto;
			padding: auto;
			width: 400px;
			text-align: center;
			height: 100vh;
			background-color: hsl(60, 100%, 98%);
			background-size: cover;
		}
		

		.login-form {
			position: relative;
			z-index: 2;
		}

		.login-form h1 {
			font-size: 42px;
			color: black;
			text-align: center;
			margin: 50px;
		}

		.int-area {
			width: 400px;
			position: relative;
			margin-top: 20px;
		}

		.int-area:first-child {
			margin-top: 0;
		}

		.int-area input {
			width: 100%;
			padding: 20px 10px 10px;
			background-color: transparent;
			border: none;
			border-bottom: 1px solid black;
			font-size: 18px;
			color: black;
			outline: none;
		}

		.int-area label {
			position: absolute;
			left: 10px;
			top: 15px;
			font-size: 18px;
			color: black;
			transition: all .5s ease;

		}

		.int-area label.warning {
			color: red !important;
			animation: warning.3s ease;
			animation-iteration-count: 3;
		}

		@keyframes warning {
			0% {
				transform: translateX(-8px);
			}

			25% {
				transform: translateX(8px);
			}

			50% {
				transform: translateX(-8px);
			}

			70% {
				transform: translateX(8px);
			}
		}

		.int-area input:focus+label,
		.int-area input:valid+label {
			top: -2px;
			font-size: 13px;
			color: #166cea;
		}

		.btn-area {
			margin-top: 30px;
		}

		.btn-area input {
			width: 100%;
			height: 50px;
			background: #58C9B9;
			color: black;
			font-size: 18px;
			border: none;
			border-radius: 25px;
			cursor: pointer;
			;
		}

		.caption {
			margin-top: 20px;
			text-align: center;
		}

		.caption a {
			font-size: 18px;
			color: black;
			text-decoration: none;
		}
		.checkbox{
			margin: 10px;
		}
		.login_append{
			display: inline-block
		}
		a{
			text-decoration: none;
		}
		a:link {
			color: black;
			text-decoration: none;
		}
		a:visited {
			color: black;
			text-decoration: none;
		}
		a:hover {
			color: black;
			text-decoration: underline;
		}
		#btn{
			font-family: 'Do Hyeon', sans-serif;
		}
	</style>
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
				&nbsp;&nbsp;&nbsp;
				<a href="" class="link_find">아이디</a>/ <a href="" class="link_find">비밀번호 찾기</a>
			</div>
			<div class="btn-area">
				<input type="submit" id="btn" value="로그인"></input>
			</div>
		</form>
		<div class="caption">
			<a href="../home.do">뒤로가기</a>
		</div>
	</section>
	<script>
		let id = $('#id');
		let pw = $('#pwd');
		let btn = $('#btn');
		$(btn).on('click', function () {
			if ($(id).val() == "") {
				$(id).next('label').addClass('warning');
				setTimeout(function () {
					$('label').removeClass('warning');
				}, 1500);
			}
			else if ($(pw).val() == "") {
				$(pw).next('label').addClass('warning');
			} setTimeout(function () {
				$('label').removeClass('warning');
			}, 1500);
		});
	</script>
</body>
</html>