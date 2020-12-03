<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/updateCategory.js"></script>
<link rel="stylesheet" href="css/updateCategory.css">
</head>
<body>
	<h1>카테고리 추가 삭제 페이지</h1>
	<div id="select">
		<a href="#" class="add">카테고리 추가아아아아아 </a> <a href="#"
			class="del"> 카테고리 삭제에에에에에</a>
	</div>
	<div class="categoryAdd">
	<button class="insertadd">추가</button>
	<form action="insertCategory.do" method="post" class="insertCategory">
		<!-- 카테고리 이름<input type="text" name="categoryName" />  -->
		<input type="text" hidden="hidden" name="cnt" value="" id="cnt" />
		<input type="submit" value="카테고리 생성" /><br />
	</form>
	</div>
	<div class="categoryDelete">
	<form action="deleteCategory.do" method="post">
		<table>
			<tr>
				<th>카테고리 번호</th>
				<th>카테고리 이름</th>
				<th>삭제 체크</th>
			</tr>
			<c:forEach items="${categoryList}" var="category">
			<tr>
				<td>${category.categorySeq}</td>
				<td>${category.categoryName} </td>
				<td><input type="checkbox" name="${category.categorySeq}" /></td>
			</tr>
			</c:forEach>
		</table>
		<input type="submit" value="카테고리 삭제" /><br />
	</form>
	</div>
</body>
</html>