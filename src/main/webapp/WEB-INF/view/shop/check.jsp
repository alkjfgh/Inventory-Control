<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결산</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap%27');
	
    body {
        font-family: 'Do Hyeon', sans-serif;
        background-color: hsl(60, 100%, 98%);
        margin: 50px;
        padding: auto;
    }
    
    .canC:link {text-decoration: none; color:black; font-size: 20px; margin-left: 15px;}
	.canC:visited {text-decoration: none; color:black; font-size: 20px; margin-left: 15px;}
	.canC:hover {text-decoration: none; color:#58C9B9; font-size: 20px; margin-left: 15px;}
	
    h1{
        text-align: center;
        font-size: 42px;
    }
	table, td, th {  
		border: 2px solid black;
	}
	
	thead{
		text-align: center; 
	}
	
	tbody{
		text-align: center;
	}
	
	table {
		border-collapse: collapse;
		width: 100%;
	}

	th, td {
		padding: 12px;
	}
	body {
	    -ms-overflow-style: none; /* IE and Edge */
	    scrollbar-width: none; /* Firefox */
	}
	
	body::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}

    #buttom{
		margin: 0 auto;
		width: 100%;
		height: 92px;
		text-align: center;
	}
    .app_warp{
        margin: 0 auto;
		margin-top: 50px;
        padding: auto;
        width: 100%;
        text-align: center;
    }
	.app{
        margin: 0 auto;
        padding: 5px 15px;
		font-size: 24px;
		font-family:'Do Hyeon', sans-serif;
		text-decoration: none;
		color: black;
		background-color: #9DC8C8;
		border: none;
		border-radius: 5px;
	}
    .app:hover {
		color: white;
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
</style>
</head>
<body>
	<h1>결산</h1>
	<section>
        <div id="top"></div>
    </section>
	<form action="check.do" method="post">
        <div class="tab">
            <table>
	           	<thead>
	                <tr>
	                    <th>카테고리</th>
	                    <th>상품 번호</th>
	                    <th>상품 이름</th>
	                    <th>상품 가격</th>
	                    <th>상품 총개수</th>
	                    <th>상품 남은갯수</th>
	                    <th>자동적으로 변화할 총 개수</th>
	                </tr>
				</thead>
				<tbody class="tbody">
	                <c:forEach items="${itemInfoList }" var="itemInfo">
	                <tr>
	                	<td>${itemInfo.categoryName }</td>
	                    <td>${itemInfo.itemSeq }</td>
	                    <td>${itemInfo.itemName }</td>
	                    <td>${itemInfo.itemPrice }</td>
	                    <td>${itemInfo.total }</td>
	                    <td>${itemInfo.remain }</td>
	                    <td><input class="requ" type="number" name="${itemInfo.categorySeq }_${itemInfo.itemSeq }_autoSup" value="${itemInfo.autoSup }"/></td>
	                </tr>
	                </c:forEach>
				</tbody>
            </table>
		</div>
       
  			<br/>
		<div class="app_warp">
			<input class="app" type="submit" value="적용">
			<a href="ShopInfo.do" class="canC">취소</a>
		</div>
	</form>
	<div class="btn">
       	<span class="addbtn"></span>
   	</div>
    <div id="buttom">
    	<a href="#top" class="gotopbtn">▲</a>
    </div>
</body>
	<script>
	var pageIndex = 1;
	$('tbody tr').hide();
	$('tbody tr').slice(pageIndex * 4-4 , pageIndex *4).show(0);
	var pageBtn = Math.ceil($('tbody tr').length / 4);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.addbtn').append('<button class="'+i+'">'+i+'</button>');
	}
	$("button").click(function(){
		pageIndex = parseInt($(this).attr("class"));
		$('tbody tr').hide();
		$('tbody tr').slice(pageIndex * 4-4 , pageIndex *4).show(0); 
	});
	</script>
</html>