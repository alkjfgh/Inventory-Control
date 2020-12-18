<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매장 목록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		body {
			font-family: 'Do Hyeon', sans-serif;
			height: 100vh;
			background-color: hsl(60, 100%, 98%);
			background-size: cover;
			color: #9DC8C8 #519D9E #D1B6E1 #58C9B9 hsl(60, 100%, 98%);
		}
		a {
			text-decoration: none
		}
		body a:link {
			color: black;
		}
		body a:visited {
			color: black;
		}
		h1 {
			margin: 50px;
			text-align: center;  
			font-size: 42px;
		}
		.shop_list_wrap {
			padding: 50px;
		}
		.shop_list {
			width: 100%;
		}
		.shop_list>thead>tr {
			font-size: 24px;
			border-bottom: 1px solid #000;
		}
		.shop_list tbody tr {
			font-size: 18px;
		}
		.shop_list tbody tr td {
			text-align: center;
		}
		.btn{
			border: 1px solid #58C9B9;
			background: none;
			padding: 8px 18px;
			font-size: 16px;
			font-family: 'Do Hyeon', sans-serif;
			cursor: pointer;
			margin: 5px;
			transition: 0.8s;
			background: #58C9B9;
			border-radius: 25px;
		}
		.area{
			color: #fff;
		}
		.area:hover{
			color:  #58C9B9;
		}
		.btn::before{
			content: "";
			position: absolute;
			left: 0;
			z-index: -1;
			transition: 0.8s;
		}
		#back, #indexPage{
			margin : 0 auto;
			text-align: center;
			font-size: 20px;
			
			
		}
		#back{
			padding-bottom: 20px;
		}
		#indexPage{
			margin-top: 15px;
			width: 200px;
		}
		.indexPage a{
			font-size: 20px;
			padding : 7.5px;
		}
		.indexPage a:hover{
			color :#58C9B9;
		}
	</style>
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