<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원(점주) 리스트 </h1>


	<table>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>핸드폰번호</th>
			<th>매장번호</th>
			<th>회원생성일</th>
			<th>회원이름</th>
			<th>회원주소</th>
			<th>등급(level)</th>
			
		</tr>
		<c:forEach items="${userList }" var="user">
		<tr>
			<td>${user.userId }</td>
			<td>${user.userPassword }</td>
			<td>${user.userEmail }</td>
			<td>${user.userPhone }</td>
			<td>${user.shopSeq }</td>
			<td>${user.userRegdate }</td>
			<td>${user.userName }</td>
			<td>${user.userAddress }</td>
			<td>${user.userLevel }</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>