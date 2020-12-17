<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
    body{
        font-family: 'Do Hyeon', sans-serif;
        background-color: hsl(60, 100%, 98%);
        font-size: 18px;
    }
    h1{
        text-align: center;
        font-size: 42px;
    }
    ul{
        margin: auto;
        list-style: none;
        height: 45px;
        padding: 0;
    }
    li{
        height: 45px;
        float: left;
    }
    a:link {
        height: 25px;
        display: block;
        width: 120px;
        font-weight: bold;
        background-color: rgb(252, 149, 65);
        text-align: center;
        padding: 10px;
        color: black; text-decoration: none;
    }
    a:visited {
        color: black; text-decoration: none;
    }
    a:hover {
        color: rgb(255, 255, 255); text-decoration: underline;
    }
    table, th, td {
		border: 2px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
    table {
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<h1>매장 정보</h1>
	<br>
	<div class="container">
		<table>
            <thead>
			<tr>
				<td>관리 번호</td>
				<td>${shop.shopSeq }</td>
			</tr>
			<tr>
				<td>매장 이름</td>
				<td>${shop.shopName }</td>
			</tr>
			<tr>
				<td>매장 번호</td>
				<td>${shop.shopPhone }</td>
			</tr>
			<tr>
				<td>매장 주소</td>
				<td>${shop.shopAddress }</td>
			</tr>
			<tr>
				<td>매장 생성일</td>
				<td>${shop.shopRegdate }</td>
			</tr>
			<tr>
				<td>결산 관리</td>
				<td>${shop.shopCount }</td>
            </tr>
            </thead>
        </table>
        <ul>
            <li><a href="graph.do" class="a_link">그래프</a></li>
            <li><a href="updateItem.do" class="a_link">상품 목록 수정</a></li>
            <c:set var="level" value="${user.userLevel }" />
            <c:if test="${level eq 1}">
            <li><a href="check.do" class="a_link">결산</a></li>
            <li><a href="../user/SignOut.do" class="a_link">로그아웃</a></li>
            </c:if>
            <c:if test="${level eq 9}">
            <li><a href="../master/shopList.do" class="a_link" >뒤로가기</a></li>
            </c:if>
        </ul>
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
	</div>
	<script>
		var li_length =  $("li").length;
		$("ul").css({width : li_length * 140 + "px"});
	</script>
</body>
</html>