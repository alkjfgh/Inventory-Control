<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/shop/shopInfo.css"/>">
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
            <li><a href="shopStock.do?pageIndex=1" class="a_link">상품 재고</a></li>
            <c:set var="level" value="${user.userLevel }" />
            <c:if test="${level eq 1}">
            <li><a href="check.do" class="a_link">결산</a></li>
            <li><a href="../user/SignOut.do" class="a_link">로그아웃</a></li>
            </c:if>
            <c:if test="${level eq 9}">
            <li><a href="../master/shopList.do" class="a_link" >뒤로가기</a></li>
            </c:if>
        </ul>
	</div>
	<script>
		var li_length =  $("li").length;
		$("ul").css({width : li_length * 140 + "px"});
	</script>
</body>
</html>