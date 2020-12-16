<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 정보</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
 	a:link {text-decoration: underline; color:black; font-size: 20px; margin-left: 15px;}
	a:visited {text-decoration: underline; color:black; font-size: 20px; margin-left: 15px;}
	a:hover {text-decoration: underline; color:#58C9B9; font-size: 20px; margin-left: 15px;}
	table, th, td {
		border: 2px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	table {
		margin-left: auto;
		margin-right: auto;
	}
	body {
		font-family: 'Do Hyeon', sans-serif;
		background-color: hsl(60, 100%, 98%);
	}	
	h1 { 
		font-size: 50px;
		text-align: center; 
	}
	.modi { 
		height: 30px;
		background: #58C9B9;
		color: black;
		font-size: 20px;
		border: none;
		border-radius: 25px;
		cursor: pointer;
		font-family : 'Do Hyeon', sans-serif;
	}
	.modi:hover {
		color: white;
	}
	.requ { 
		height: 25px;
		background: hsl(60, 100%, 98%);
		color: black;
		font-size: 17px;			
		cursor: pointer;
		font-family : 'Do Hyeon', sans-serif;
}	
	.requ:hover {
		background-color: grey;
	}
	.requ:focus {
		background-color: grey;
		color: white;
	}
	.container{
		margin: 0 auto;
		width: 800px;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>매장 정보</h1>
	<br>
	<div class="container">
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
		<c:if test="${level eq 9}">
			<div id="back">
				<a href="../master/shopList.do" >뒤로가기</a>
			</div>
		</c:if>
	</div>
</body>
</html>