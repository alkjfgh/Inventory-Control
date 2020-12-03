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
<h1>매장 리스트</h1>
	<table>
		<tr>
			<th>Shop Seq</th>
			<th>Shop Name</th>
			<th>Shop Phone</th>
			<th>Shop Address</th>
			<th>Shop RegDate</th>
			<th>상세보기</th>
		</tr>
		<form action="shopInfo.do">
		<tr>
			<c:forEach items="${shopList }" var="shop">
				<td>${shop.shopSeq }</td>
				<td>${shop.shopName }</td>
				<td>${shop.shopPhone }</td>
				<td>${shop.shopAddress }</td>
				<td>${shop.shopRegdate }</td>
				<td><input type="submit" value="상세보기" /></td>
			</c:forEach>
		</tr>
		</form>
	</table>
</body>
</html>