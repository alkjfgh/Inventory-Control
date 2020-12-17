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
		</tr>
		<c:forEach items="${totalItemList }" var="totalItem">
		<tr class="showList_${totalItem.category.categorySeq }">
			<td colspan="5">${totalItem.category.categoryName  }</td>
		</tr>
		<tr class="list_${totalItem.category.categorySeq }">
			<td class="hideList_${totalItem.category.categorySeq }" rowspan="${totalItem.size }">${totalItem.category.categoryName  }</td>
			<c:forEach items="${totalItem.itemList }" var="item">
			<td>${item.itemSeq }</td>
			<td>${item.itemName }</td>
			<td>${item.itemPrice }</td>
			<td>${item.remain }</td>
		</tr>
		<tr class="list_${totalItem.category.categorySeq }">
			</c:forEach>
			<td hidden=""></td>
			<td hidden=""></td>
			<td hidden=""></td>
			<td hidden=""></td>
			<td hidden=""></td>
		</tr>
		</c:forEach>
	</table>
	<div id="back">
		<a href="master.do" >뒤로가기</a>
	</div>
</body>
<script>
	var duration = 300;
	$("tr[class^='list_']").hide(0);
	$(document).ready(function(){
		$("tr[class^='showList_']").click(function(){
			var thisIndex = $(this).attr("class").split('_')[1];
			$(this).hide(0);
			$(".list_" + thisIndex).show(duration);
		});
		$("td[class^='hideList_']").click(function(){
			var thisIndex = $(this).attr("class").split('_')[1];
			$(".list_" + thisIndex).hide(0);
			$(".showList_" + thisIndex).show(duration);
		});
	});
</script>
</html>