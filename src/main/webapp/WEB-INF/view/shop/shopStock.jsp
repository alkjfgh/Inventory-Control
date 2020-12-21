<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 재고</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
    body{
        font-family: 'Do Hyeon', sans-serif;
        background-color: hsl(60, 100%, 98%);
        font-size: 18px;
        text-align: center;
    }
    #stockList {
		margin: 0 auto;
	}
  	#stockList {
      border-collapse: collapse;
      border-top: 3px solid #168;
    }  
    #stockList th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    #stockList th, #stockList td {
      padding: 10px 22px;
      border: 1px solid #ddd;
    }
    #stockList th:first-child, #stockList td:first-child {
      border-left: 0;
    }
    #stockList th:last-child, #stockList td:last-child {
      border-right: 0;
    }
    #stockList tr td:first-child{
      text-align: center;
    }
    #stockList caption{caption-side: bottom; display: none;}
	a{font-weight: bold;}
    a:link { color: rgb(0, 0, 0); text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color: rgb(255, 145, 0); text-decoration: none;}
</style>
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
	<div id="indexPage"><span class="indexPage"></span></div>
	
	<div id="back">
		<a href="ShopInfo.do">뒤로가기</a>
	</div>
</body>
	<script>
	var pageBtn = Math.ceil(${itemCount} / 20);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.indexPage').append("<a href="
			+"shopStock.do?pageIndex="+i+""
			+">"+i+"</a>");
	}
	</script>
</html>