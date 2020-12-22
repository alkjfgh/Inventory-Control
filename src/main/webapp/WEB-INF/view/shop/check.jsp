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
<link rel="stylesheet" href="<c:url value="/resources/css/shop/check.css"/>">
<script src="<c:url value="/resources/js/shop/check.js" />"></script>
</head>
<body>
	<h1>결산</h1>
	<section>
        <div id="top"></div>
    </section>
    <div class="main">
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
		                    <td class="quantity"><input min="1" class="requ" type="number" name="${itemInfo.categorySeq }_${itemInfo.itemSeq }_autoSup" value="${itemInfo.autoSup }"/></td>
		                </tr>
		                </c:forEach>
					</tbody>
		           </table>
			</div>
			<div class="btn">
				<span class="addbtn"></span>
			</div>
			<div class="app_warp">
				<input class="app" type="submit" value="적용">
				<a href="ShopInfo.do" class="canC">취소</a>
			</div>
		</form>
	</div>
    <div id="buttom">
    	<a href="#top" class="gotopbtn">▲</a>
    </div>
</body>
</html>