<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<h1>구매 확인  페이지</h1>
<form action="buyComplete.do" method="post">
	<table>
		<tr>
			<th>상점 이름</th>
			<th>카테고리 이름</th>
			<th>아이템 이름</th>
			<th>수량</th>
		</tr>
		<c:forEach items="${buyList }" var="buyCheck">
			<tr>
				<td>${buyCheck.shop.shopSeq }</td>
				<td>${buyCheck.category.categorySeq }</td>
				<td>${buyCheck.item.itemSeq }</td>
				<td>${buyCheck.buyCnt}</td>
			</tr>
		</c:forEach>
	</table>
	<input type="submit" value="결재 완료" />
</form>
</body>
</html>