<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>총재고 이동현황</h1>
	<table>
		<tr>
			<th>상점번호</th>
			<th>shop_count</th>
			<th>카테고리이름</th>
			<th>아이템이름</th>
			<th>개수</th>
		</tr>
		<c:forEach items="${itemMovement}" var="movement">
			<tr>
				<td>${ movement.shopSeq }</td>
				<td>${ movement.shopCount }</td>
				<td>${ movement.categoryName }</td>
				<td>${ movement.itemName }</td>
				<td>${ movement.stockMove }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>