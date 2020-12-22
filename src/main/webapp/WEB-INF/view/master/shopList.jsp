<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/master/shopList.css"/>">
</head>
<body>
	<h1><a href="master.do">매장 목록</a> </h1>
	<section class="shop_list_wrap">
		<table class="shop_list">
			<thead>
				<tr>
					<th>Shop Seq</th>
					<th>Shop Name</th>
					<th>Shop Phone</th>
					<th>Shop Address</th>
					<th>Shop RegDate</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${shopList }" var="shop">
				<tr>
					<td>${shop.shopSeq }</td>
					<td>${shop.shopName }</td>
					<td>${shop.shopPhone }</td>
					<td>${shop.shopAddress }</td>
					<td>${shop.shopRegdate }</td>
					<td><a class="btn area" href="../shop/ShopInfo.do?shopSeq=${shop.shopSeq }">상세보기</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
			<div id="indexPage"><span class="indexPage"></span></div>
	</section>
	<div id="back">
		<a href="master.do">뒤로가기</a>
	</div>
</body>
	<script>
	var pageBtn = Math.ceil(${shopCount} / 20);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.indexPage').append("<a href="
			+"shopList.do?pageIndex="+i+""
			+">"+i+"</a>")
	}
	</script>
</html>