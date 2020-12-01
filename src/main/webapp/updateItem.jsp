<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>아이템 추가 삭제 페이지</h1>

	<div class="hi">
		<form action="insertItem.do" method="post">
			<label for="category">카테고리선택</label> <select class="form-control"
				id="category" name="categoryName" onchange="addressKindChange(this)"
				required="required">
				<option>카테고리를 선택해주세요</option>
				<option value="1">우유</option>
				<option value="2">빵</option>
				<option value="3">생활용품</option>
			</select> <label for="itemSeq">상품</label> <select class="form-control"
				id="itemSeq" name="itemSeq" required="required">
				<option>선택해주세요.</option>
			</select> <input type="number" name="total" required="required" /> <input
				type="submit" value="적용" />

		</form>
	</div>

	<hr />

	<table>
		<tr>
			<th>카테고리</th>
			<th>상품 번호</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
		</tr>
		<c:forEach items="${categoryItemList }" var="categoryItem">
			<tr>
				<td rowspan="${categoryItem.size }">${categoryItem.category.categoryName  }</td>
				<c:forEach items="${categoryItem.itemList }" var="item">
					<td>${item.itemSeq }</td>
					<td>${item.itemName }</td>
					<td>${item.itemPrice }</td>
			</tr>
			<tr>
		</c:forEach>
		<td hidden=""></td>
		<td hidden=""></td>
		<td hidden=""></td>
		<td hidden=""></td>
		</tr>
		</c:forEach>
	</table>
</body>
<script>
	var arr = new Array();
	<c:forEach items="${categoryItemList }" var="categoryItem">
		var item = new Array();
		<c:forEach items="${categoryItem.itemList }" var="item">
			item.push({
				itemSeq : "${item.itemSeq }",
				itemName : "${item.itemName }",
				itemPrice : "${item.itemPrice }"
			});
		</c:forEach>
		arr.push({
			categoryName : "${categoryItem.category.categoryName  }",
			size : "${categoryItem.size }",
			itemList : item
		});
	</c:forEach>

	function addressKindChange(e) {
		var uu = [ "그냥우유", "초코우유", "커피우유" ];
		var bb = [ "빵1", "빵2", "빵3" ];
		var ss = [ "생활용품1", "생활용품2", "생활용품3" ];
		var target = document.getElementById("itemSeq");

		if (e.value == "1")
			var d = uu;
		else if (e.value == "2")
			var d = bb;
		else if (e.value == "3")
			var d = ss;

		target.options.length = 0;

		for (x in d) {
			var opt = document.createElement("option");
			opt.value = x;
			opt.innerHTML = d[x];
			target.appendChild(opt);
		}
	}
</script>
</html>