<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>총 재고</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/master/totalItem.css"/>">
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
	<span class="indexPage"></span>
	<div id="back">
		<a href="master.do" >뒤로가기</a>
	</div>
</body>
	<script>
	var pageBtn = Math.ceil(${totalItemCount} / 20);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.indexPage').append("<a href="
			+"totalItem.do?pageIndex="+i+""
			+">"+i+"</a>");
	}
	</script>
</html>