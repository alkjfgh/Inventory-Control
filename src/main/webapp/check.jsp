<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>check</title>
<style>	
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
	.bold{
		font-weight: bold;
	}
</style>
</head>
<body>
	<form action="" method="post"></form>
	<table>
		<tr>
			<th>카테고리</th>
			<th>상품 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>상품 총개수</th>
			<th>상품 현재개수</th>
			<th>상품 주문할갯수</th>
		</tr>
		<c:forEach items="${categoryList }" var="category">
			<tr>
			<td rowspan="${category.size }">${category.name }</td>
			<c:forEach items="${category.itemList }" var="item">
				<td>${item.seq }</td>
				<td>${item.name }</td>
				<td>${item.price }</td>
				<td>${item.total }</td>
				<td>${item.remain }</td>
				<td class="bold">${item.total - item.remain }</td>
			</tr>
			<tr>
			</c:forEach>
				<td hidden=""></td>
				<td hidden=""></td>
				<td hidden=""></td>
				<td hidden=""></td>
				<td hidden=""></td>
				<td hidden=""></td>
				<td hidden=""></td>
			</tr>
		</c:forEach>
	</table>
	<a href="check.do">결산</a>
	<a href="shopInfo.jsp">뒤로가기</a>
</body>
</html>