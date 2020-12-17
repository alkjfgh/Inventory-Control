<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>총재고 이동현황</title>
</head>
<body>
	<h1>총재고 이동현황</h1>
	<div class="search">
		<form action="itemMovement.do" method="get">
			<input type="number" placeholder="shopCount입력" name="shopCount" />
			<input type="number" name="shopCount" value="${itemMovement.shopCount }" hidden="" />
			<input type="number" name="categorySeq" value="${itemMovement.categorySeq }" hidden="" />
			<input type="number" name="itemSeq" value="${itemMovement.itemSeq }" hidden="" />
			<input type="submit" value="검색" />
		</form>
	</div>
	<table>
		<tr>
			<th>상점이름</th>
			<th>카테고리이름</th>
			<th>아이템이름</th>
			<th>개수</th>
		</tr>
		<c:forEach items="${itemMovementList}" var="movement">
			<tr>
				<td>${ movement.shopName }</td>
				<td>${ movement.categoryName }</td>
				<td>${ movement.itemName }</td>
				<td>${ movement.stockMove }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>