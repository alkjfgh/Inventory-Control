<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 추가 및 삭제</title>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/master/updateCategory.css"/>">
<script src="<c:url value="/resources/js/master/updateCategory.js" />"></script>
</head>
<body>
	<section>
		<h1>카테고리 추가 및 삭제</h1>
		<div class="category">
			<div id="select">
				<a href="#" class="add" id="adda">카테고리 추가 </a>
				<a href="#" class="del" id="dela">카테고리 삭제</a>
			</div>
			<div class="categoryAdd">
				<button class="insertadd">카테고리 목록 생성하기</button>
				<form action="insertCategory.do" method="post" class="insertCategory">
					<input type="text" hidden="hidden" name="cnt" value="" id="cnt" />
					<table class="input-container">
						<tr>
							<th>카테고리 명</th>
							<th>삭제</th>
						</tr>
					</table>
					<input class="insertCategory_new" type="submit" value="적용" /><br />
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
							<td><input class="checkbox" type="checkbox" name="${category.categorySeq}" /></td>
						</tr>
						</c:forEach>
					</table>
					<input class="delete_button" type="submit" value="카테고리 삭제" /><br />
				</form>
				<span class="indexPage"></span>
			</div>
		</div>
	</section>
	<div id="back">
		<a href="master.do" >뒤로가기</a>
	</div>
</body>
<script>
    var pageBtn = Math.ceil( ${categoryCount} / 20);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.indexPage').append("<a href="
			+"updateCategory.do?pageIndex="+i+""
			+">"+i+"</a>");
	}
</script>
</html>