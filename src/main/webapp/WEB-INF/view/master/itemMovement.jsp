<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"  trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>총재고 이동현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap%27');
	body{
        font-family: 'Do Hyeon', sans-serif;
        background-color: hsl(60, 100%, 98%);
        margin: 50px;
        text-align: center;
    }
    h1{
    	margin-top: 50px;
            text-align: center;
            font-size: 45px;z
    }
     
    .table{
    	margin: 30px auto;
    	text-align: center;
    	width: 500px;
    }
</style>
</head>
<body>
	<h1>총재고 이동현황</h1>
	<div class="search">
		<form action="itemMovement.do" method="get">
			<input type="number" class="shopCount" placeholder="shopCount입력" name="shopCount" required="required" />
			<input type="number" class="categorySeq" name="categorySeq" value="${itemMovement.categorySeq }" hidden="" />
			<input type="number" class="itemSeq" name="itemSeq" value="${itemMovement.itemSeq }" hidden="" />
			<input type="number" class="pageIndex" name="pageIndex" value="1" hidden="" />
			<input type="submit" value="검색" />
		</form>
	</div>
	<table class="table">
		<tr>
			<th>상점이름</th>
			<th>카테고리이름</th>
			<th>아이템이름</th>
			<th>개수</th>
		</tr>
		<c:forEach items="${itemMovementList}" var="movement">
			<tr>
				<td>${ movement.shopName }</td>
				<td>${ movement.categoryName }</td>
				<td>${ movement.itemName }</td>
				<td>${ movement.stockMove }</td>
			</tr>
		</c:forEach>
	</table>
	<span class="indexPage"></span>
	
</body>
<script>
	var pageBtn = Math.ceil( ${itemCount} / 20); 
	var shopCount = ${itemMovement.shopCount};
	var categorySeq = ${itemMovement.categorySeq};
	var itemSeq = ${itemMovement.itemSeq};
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.indexPage').append('<a href="itemMovement.do?shopCount='+shopCount+'&categorySeq='+categorySeq+'&itemSeq='+itemSeq+'&pageIndex='+i+'">'+i+'</a>');
	} 
	</script>
</html>