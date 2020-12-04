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
	<form action="check.do" method="post">
	<table>
		<tr>
			<th>카테고리</th>
			<th>상품 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>상품 총개수</th>
			<th>상품 남은갯수</th>
			<th>자동적으로 변화할 총 개수</th>
		</tr>
		<c:forEach items="${categoryList }" var="categoryItem">
			<tr>
			<td rowspan="${categoryItem.size }">${categoryItem.category.categoryName }</td>
			<c:forEach items="${categoryItem.itemList }" var="item">
				<td>${item.itemSeq }</td>
				<td>${item.itemName }</td>
				<td>${item.itemPrice }</td>
				<td>${item.total }</td>
				<td>${item.remain }</td>
				<td>${item.autoSup }</td>
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
	<input type="submit" value="적용">
	<a href="#" onclick="window.history.back()">취소</a>
	</form>
</body>
</html>