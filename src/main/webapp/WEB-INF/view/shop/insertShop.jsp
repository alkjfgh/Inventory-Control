<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>매장 개설</title>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		body {
			font-family: 'Do Hyeon', sans-serif;
			display: flex;
			justify-content: center;
			align-items: center;
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
			margin-bottom: 60px;
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
	</style>
</head>
<body>
	<section class="login-form">
		<h1>매장 개설</h1>
		<form action="insertShop.do" name=fr  method="post" onsubmit="return fun1()">
			<div class="int-area">
				<input type="text" name="shopName" id="shopName" autocomplete="off" required="required" value="">
				<label for="shopName">매장이름</label>
			</div>
			<div class="int-area">
				<input type="text" name="shopAddress" id="shopAddress" autocomplete="off" required="required" value="">
				<label for="shopAddress">매장주소</label>
			</div>
			<div class="int-area">
				<input type="text" name="shopPhone" id="shopPhone" autocomplete="off" required="required" value="" onkeyup="fun2()">
				<label for="shopPhone">전화번호</label>
				<span id="alert_phone"><span style="color: #777">예)010-0000-0000</span></span>
			</div>
			<div class="btn-area">
				<input type="submit" id="btn" value="Registered" class="caption"></input>
			</div>
		</form>
		<div class="caption">
			<a href="../user/cancelInsertUser.do">취소</a>
		</div>
	</section>
</body>
<script>
	var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
	function fun1(){
		if(obj.shopPhone.value == '') {
		    alert('전화번호를 입력해주세요');
		    obj.userPhone.focus();
		    return false;
		}
		if(phoneRegExp.test(obj.shopPhone.value)==false) {
		    alert('전화번호를 알맞게 입력해주세요.');
		    obj.userPhone.focus();
		    return false;
		}
		obj.submit();
	    obj.reset();
	}
	function fun2() {
	    var obj = document.fr;
	    if(phoneRegExp.test(obj.shopPhone.value)==false) {
	        document.getElementById("alert_phone").innerHTML=('<span style="color: red;">전화번호 형식이 맞지않습니다.</span>');            
	        return false;
	    } else {
	        document.getElementById("alert_phone").innerHTML=('<span style="color: green;">전화번호가 정상적으로 입력되었습니다.</span>');    
	    }
	}
</script>
</html>