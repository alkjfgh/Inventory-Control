<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Info</title>
<style>
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
table{
	display: inline-block;
}
</style>
</head>
<body>
	<h1>Shop Info</h1>
	<table>
		<tr>
			<td>Shop Seq</td>
			<td>${shop.shopSeq }</td>
		</tr>
		<tr>
			<td>Shop Name</td>
			<td>${shop.shopName }</td>
		</tr>
		<tr>
			<td>Shop Phone</td>
			<td>${shop.shopPhone }</td>
		</tr>
		<tr>
			<td>Shop Address</td>
			<td>${shop.shopAddress }</td>
		</tr>
		<tr>
			<td>Shop RegDate</td>
			<td>${shop.shopRegdate }</td>
		</tr>
	</table>
	<a href="graph.do">그래프</a>&nbsp;&nbsp;&nbsp;<a href="updateItem.do">상품 목록 수정</a>
	<form action="updateShop.do" method="post">
		<table>
			<tr>
				<th>카테고리</th>
				<th>상품 번호</th>
				<th>상품 이름</th>
				<th>상품 가격</th>
				<th>상품 총개수</th>
				<th>상품 현재개수</th>
				<th>상품 주문할갯수</th>
				<th>상품 주문할 갯수 수정</th>
			</tr>
			<c:forEach items="${categoryList }" var="categoryItem">
				<tr>
					<td rowspan="${categoryItem.size }">${categoryItem.category.categoryName  }</td>
					<c:forEach items="${categoryItem.itemList }" var="item">
						<td>${item.itemSeq }</td>
						<td>${item.itemName }</td>
						<td>${item.itemPrice }</td>
						<td>${item.total }</td>
						<td>${item.remain }</td>
						<td>${item.necessity }</td>
						<td><input type="number" name="need.${item.itemSeq }"
							value="${item.necessity }" /></td>
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
			<td hidden=""></td>
			</tr>
			</c:forEach>
		</table>
		<input type="submit" value="수정 확인" /><br />
	</form>
	<a href="check.do">결산</a>
	<br />
	<a href="singOut.do">로그아웃</a>
</body>
</html>