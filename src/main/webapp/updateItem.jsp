<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="/js/updateItem.js"></script>
	<link rel="stylesheet" href="/css/updateItem.css">
</head>

<body>
	<h1>아이템 추가 삭제 페이지</h1>

	<div id="select">
		<a href="#" class="change">수정ddddddddddddddddd </a> <a href="#" class="del"> 삭제ddddddddddddddddd</a>
	</div>


	
	<div class="add">
		<hr />
		이곳은 수정하는곳
		<button class="insertadd">추가</button>
		<form action="insertItem.do" method="post" class="insertItem">
		<input type="text" hidden="hidden" name="cnt" value="" id="cnt" />
		<input type="submit" value="적용" /> <br />
		</form>
	</div>

	<div class="delete">
		<hr />
		이곳은 삭제하는 곳
		<form action="deleteItem.do" method="post">
			<table>
				<tr>
					<th>카테고리</th>
					<th>상품 번호</th>
					<th>상품 이름</th>
					<th>상품 가격</th>
					<th>체크</th>
				</tr>
				<c:forEach items="${categoryList }" var="categoryItem">
					<tr>
						<td rowspan="${categoryItem.size }">${categoryItem.category.categoryName }</td>
						<c:forEach items="${categoryItem.itemList }" var="item">
							<td>${item.itemSeq }</td>
							<td>${item.itemName }</td>
							<td>${item.itemPrice }</td>
							<td><input type="checkbox"
									name="${categoryItem.category.categorySeq  }_itemSeq_${item.itemSeq }" /></td>
					</tr>
				</c:forEach>
				<tr>
					<td hidden=""></td>
					<td hidden=""></td>
					<td hidden=""></td>
					<td hidden=""></td>
					<td hidden=""></td>
				</tr>
				</c:forEach>

			</table>
			<input type="submit" value="완료(삭제작업 ㄱㄱ)" />
		</form>
	</div>


</body>
</html>