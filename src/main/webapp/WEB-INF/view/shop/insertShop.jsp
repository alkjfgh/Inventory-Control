<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/shop/insertShop.css"/>">
<title>매장 개설</title>
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