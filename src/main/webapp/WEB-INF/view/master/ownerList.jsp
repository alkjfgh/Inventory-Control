<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/master/ownerList.css"/>">
</head>
<body>
	<h1><a href="master.do" id="top">회원 목록</a></h1>
	<section class="owner_list_wrap">
		<table class="owner_list">
			<thead>
				<tr>
					<th>Shop seq</th>
					<th>ID</th>
					<th>Password</th>
					<th>Email</th>
					<th>Phone number</th>
					<th>Sysdate</th>
					<th>Name</th>
					<th>Address</th>
					<th>Level</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList }" var="user">
					<form action="shopInfo.do">
						<tr>
							<td>${user.shopSeq }</td>
							<td>${user.userId }</td>
							<td>${user.userPassword }</td>
							<td>${user.userEmail }</td>
							<td>${user.userPhone }</td>
							<td>${user.userRegdate }</td>
							<td>${user.userName }</td>
							<td>${user.userAddress }</td>
							<td>${user.userLevel }</td>
						</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</section>
	<div class="indexPage_box">
		<span class="indexPage"></span>
	</div>
	<div id="back">
		<a href="master.do">뒤로가기</a>
	</div>
</body>
	<script>
	var pageBtn = Math.ceil(${userCount} / 20);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.indexPage').append("<a href="
			+"ownerList.do?pageIndex="+i+""
			+">"+i+"</a>");
	}
	</script>
</html>