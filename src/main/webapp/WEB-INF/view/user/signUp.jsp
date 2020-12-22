<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<c:url value="/resources/css/user/signUp.css"/>">
<script src="<c:url value="/resources/js/user/signUp.js" />"></script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="SignUp.do" name=fr method="post" onsubmit="return fun2()">
		<table width=750 border="1px" align=center>
			<tr>
				<th colspan="2" bgcolor="#E4F7BA">Sign Up</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="userId" onkeyup="fun3()">
					<span id="alert_text"><span style="color: #777">아이디를 입력해주세요</span></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPassword" onkeyup="fun4()" oncopy="return false" oncut="return false" onpaste="return false"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" name="userPassword1" onkeyup="fun4()" oncopy="return false" oncut="return false" onpaste="return false">
					<span id="alert_pwd"><span style="color: #777">패스워드를 한번 더 입력해주세요</span></span>
				</td>
			</tr>
			<tr>
				<td>메일주소</td>
				<td>
					<input type="text" name="userEmail" onkeyup="fun5()">
					<span id="alert_email"><span style="color: #777">예)rmsdn@naver.com</span></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="userAddress"></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
					<input type="text" name="userPhone" onkeyup="fun6()">
					<span id="alert_phone"><span style="color: #777">예)010-0000-0000</span></span>
				</td>
			</tr>
		</table>
		<div class="submit">
			<input type="submit" class="button" value="회원 가입">
			<input type="reset" class="button" name="reset" value="다시 입력"/>
			<button class="button" type="button" onclick="location.href='../home.do'">뒤로가기</button>
		</div>
	</form>
	<script>
	</script>
</body>
</html>