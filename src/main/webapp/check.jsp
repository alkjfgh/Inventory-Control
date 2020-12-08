<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>check</title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	
	html{
            scroll-behavior: smooth;
        }
	
	.canC:link {text-decoration: underline; color:black; font-size: 20px; margin-left: 15px;}
	.canC:visited {text-decoration: underline; color:black; font-size: 20px; margin-left: 15px;}
	.canC:hover {text-decoration: underline; color:#58C9B9; font-size: 20px; margin-left: 15px;}
	
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
		margin-left: 10px;
		padding-top: 5px;
        padding-right: 10px;
        padding-bottom: 5px;
        padding-left: 10px;
	}
	
	.bold{
		font-weight: bold;
	}
	
	body {
		font-family: 'Do Hyeon', sans-serif;
		background-color: hsl(60, 100%, 98%);
		margin: 0;
        padding: 0;
	}
	
	section{
            width: 100%;
            background: hsl(60, 100%, 98%) ;
            background-size: cover;
            
    }
    
    .gotopbtn{
            position: fixed;
            width: 50px;
            height: 50px;
            background: black;
            bottom: 40px;
            right: 50px;
            cursor: pointer;
            font-family: 'Do Hyeon', sans-serif;
            text-decoration: none;
            text-align: center;
            line-height: 50px;
            color: white;
            font-size: 26px;
         	border: 0;
         	right : 5px;
    }
    
	
	h1 { 
		font-size: 50px;
		text-align: center; 
	}
	
	.app { 
		height: 30px;
		background: #58C9B9;
		color: black;
		font-size: 20px;
		border: none;
		border-radius: 25px;
		cursor: pointer;
		font-family : 'Do Hyeon', sans-serif;
		margin-left: 30px;
	}
	
	.app:hover {
		color: white;
	}
	
</style>
</head>
<body>
	<h1>결산</h1>
		<section>
        <div id="top"> 
            
        </div>
    	</section>
	<form action="check.do" method="post">
	<table>
		<tr>
			<th>카테고리</th>
			<th>상품 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
			<th>상품 총개수</th>
			<th>상품 남은갯수</th>
			<th>자동적으로 변화할 총 개수</th>
		</tr>
		<c:forEach items="${categoryList }" var="categoryItem">
			<tr>
			<td rowspan="${categoryItem.size }">${categoryItem.category.categoryName }</td>
			<c:forEach items="${categoryItem.itemList }" var="item">
				<td>${item.itemSeq }</td>
				<td>${item.itemName }</td>
				<td>${item.itemPrice }</td>
				<td>${item.total }</td>
				<td>${item.remain }</td>
				<td>${item.autoSup }</td>
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
	<br />
	<input class="app" type="submit" value="적용">
	<a href="#" class="canC" onclick="window.history.back()">취소</a>
	</form>
    <div id="bottom">
    <a href="#top" class="gotopbtn">▲</a>
    </div>
	
</body>
</html>