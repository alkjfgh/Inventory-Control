<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.itemAdd, .itemDelete {
	display: none;
}
</style>
</head>
<body>
<h1>여기는 master 물품 추가삭제 페이지</h1>
<div id="select">
		<a href="#" class="add">물품 추가아아아아아 </a> <a href="#"
			class="del"> 물품 삭제에에에에에</a>
</div>
	<div class="itemAdd">
		<button class="insertadd">추가</button>
		<form action="masterInsertItem.do" method="post">
			<label for="category">카테고리선택</label>
				<select class="form-control" id="category" name="categoryName" required="required">
				<option>카테고리를 선택해주세요</option>
				<c:forEach items="${categoryList }" var="categoryItem">
					<option value="${categoryItem.categorySeq }">${categoryItem.categoryName  }</option>
				</c:forEach>
				</select><br />
			물품이름<input type="text" name="itemName" />
			물품가격<input type="number" name="itemPrice" />
			물품 재조사<input type="text" name="itemMaker" />
			<input type="submit" value="물품추가하기" />
		</form>
	</div>
	<div class="itemDelete">
		<form action="masterDeleteItem.do" method="post">
			<table>
				<tr>
					<th>카테고리</th>
					<th>물품 번호</th>
					<th>물품 이름</th>
					<th>물품 가격</th>
					<th>물품 제조사</th>
					<th>체크</th>
				</tr>
				<c:forEach items="${categoryItemList }" var="categoryItem">
					<tr>
						<td rowspan="${categoryItem.size }">${categoryItem.category.categoryName  }</td>
						<c:forEach items="${categoryItem.itemList }" var="item">
							<td>${item.itemSeq }</td>
							<td>${item.itemName }</td>
							<td>${item.itemPrice }</td>
							<th>${item.itemMaker }</th>
							<td><input type="checkbox" name="${categoryItem.category.categorySeq  }_itemSeq_${item.itemSeq }" /></td>
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
<script>
$('.add').click(function() {
	$('.itemAdd').show();
	$('.itemDelete').hide();
});
$('.del').click(function() {
	$('.itemAdd').hide();
	$('.itemDelete').show();
});
</script>
</html>