<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 재고</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	body {
		font-family: 'Do Hyeon', sans-serif;
		padding: 0;
		background: hsl(60, 100%, 98%);
		padding: 40px;
		text-align: center;
	}
	h1{
		margin: 50px;
		text-align: center;  
		font-size: 42px;
	}
	table {
		margin: 0 auto;
		text-align: center;
	}
	table, th, td{
		border: 2px solid black;
		border-collapse: collapse;
	}
	th, td{
		padding: 5px;
	}
	a{font-weight: bold;}
    a:link { color: rgb(0, 0, 0); text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color: rgb(255, 145, 0); text-decoration: none;}
</style>
</head>
<body>
<h1>총 재고</h1>
	<table>
		<tr>
			<th>카테고리 </th>
			<th>물품 번호</th>
			<th>물품 이름</th>
			<th>물품 가격</th>
			<th>재고</th>
			<th>상세보기</th>
		</tr>
		<c:forEach items="${totalItemList }" var="totalItem">
		<tr>
			<td>${totalItem.categoryName  }</td>
			<td>${totalItem.itemSeq }</td>
			<td>${totalItem.itemName }</td>
			<td>${totalItem.itemPrice }</td>
			<td>${totalItem.remain }</td>
			<td><a href="itemMovement.do?categorySeq=${totalItem.categorySeq }&itemSeq=${totalItem.itemSeq }&pageIndex=1">재고 이동 상세 보기</a></td>
		</tr>
		</c:forEach>
	</table>
	<div id="back">
		<a href="master.do" >뒤로가기</a>
	</div>
</body>
<script>
</script>
</html>