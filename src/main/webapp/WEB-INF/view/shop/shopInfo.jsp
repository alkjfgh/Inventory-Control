<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Info</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
 	a:link {text-decoration: underline; color:black; font-size: 20px; margin-left: 15px;}
	a:visited {text-decoration: underline; color:black; font-size: 20px; margin-left: 15px;}
	a:hover {text-decoration: underline; color:#58C9B9; font-size: 20px; margin-left: 15px;}
	table, th, td {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
		margin-left: 10px;
		padding-top: 5px;
        padding-right: 10px;
        padding-bottom: 5px;
        padding-left: 10px;
	}
	table {
		display: inline-block;
		padding-top: 0px;
        padding-right: 0px;
        padding-bottom: 0px;
        padding-left: 0px;
	}
	body {
		font-family: 'Do Hyeon', sans-serif;
		background-color: hsl(60, 100%, 98%);
	}	
	h1 { 
		font-size: 50px;
		text-align: center; 
	}
</style>
</head>
<body>
	<h1>Shop Info</h1>
	<br>
	<div>
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
		<tr>
			<td>Shop Count</td>
			<td>${shop.shopCount }</td>
		</tr>
	</table>
	<a href="graph.do">그래프</a>&nbsp;&nbsp;&nbsp;<a href="updateItem.do">상품 목록 수정</a>
	<br>
	</div>
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
	<c:set var="level" value="${user.userLevel }" />
	<c:if test="${level eq 1}">
		<br />
		<a href="check.do">결산</a>
		<br />
		<a href="../user/SignOut.do">로그아웃</a>
	</c:if>
</body>
</html>