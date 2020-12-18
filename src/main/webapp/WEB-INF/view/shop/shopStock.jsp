<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 재고</title>
</head>
<body>
<h1>상품 재고</h1>

		<table id="stockList">
			<tr>
				<th>카테고리</th>
				<th>상품 번호</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>상품 총개수</th>
				<th>상품 현재개수</th>
				<th>상품 주문할갯수</th>
			</tr>
			<c:forEach items="${itemInfoList }" var="itemInfo">
			<tr>
				<td>${itemInfo.categoryName  }</td>
				<td>${itemInfo.itemSeq }</td>
				<td>${itemInfo.itemName }</td>
				<td>${itemInfo.itemPrice }</td>
				<td>${itemInfo.total }</td>
				<td>${itemInfo.remain }</td>
				<td>${itemInfo.necessity }</td>
			</tr>
			</c:forEach>
        </table>
</body>
</html>