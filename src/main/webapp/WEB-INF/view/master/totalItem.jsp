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
<h1>재고 리스트 </h1>
	<table>
		<tr>
			<th>카테고리 </th>
			<th>물품 번호</th>
			<th>물품 이름</th>
			<th>물품 가격</th>
			<th>재고</th>
		</tr>
		<c:forEach items="${totalItemList }" var="totalItem">
		<tr>
			<td rowspan="${totalItem.size }">${totalItem.category.categoryName  }</td>
			<c:forEach items="${totalItem.itemList }" var="item">
			<td>${item.itemSeq }</td>
			<td>${item.itemName }</td>
			<td>${item.itemPrice }</td>
			<td>${item.remain }</td>
		</tr>
		<tr>
			</c:forEach>
			<td hidden=""></td>
			<td hidden=""></td>
			<td hidden=""></td>
			<td hidden=""></td>
			<td hidden=""></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>