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
	<style>
		#select {
			width: 80%;
			margin: 0 auto;
		}

		#select>a {
			margin: 0 auto;
			text-align: center;
		}

		.add,
		.delete {
			display: none;
		}
	</style>
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
<script>
$('.change').click(function() {
	$('.add').show();
	$('.delete').hide();
});
$('.del').click(function() {
	$('.add').hide();
	$('.delete').show();
});
var cnt =  1;
$('button')
.click(
		function() {
			$('.insertItem')
					.append(
							'<label for="'+ cnt +'">카테고리선택</label> <select class="form-control"id="'+ cnt +'" name="category_'+ cnt +'" onchange="categoryChange(this)"required="required"><option>카테고리를 선택해주세요</option><c:forEach items="${categoryItemList }" var="categoryItem"><option value="${categoryItem.category.categorySeq }">${categoryItem.category.categoryName  }</option></c:forEach></select> <label for="item_'+ cnt +'">상품</label> <select class="form-control"id="item_'+ cnt +'" name="item_'+ cnt + '" required="required"><option id = "item_'+ cnt +'">선택해주세요.</option></select> <input type="number" name="total_'+ cnt++ + '" required="required" /> </br>');
		});
	var arr = new Array();
	<c:forEach items="${categoryItemList }" var="categoryItem">
		var itemName = new Array();
		var itemSeq = new Array();
		<c:forEach items="${categoryItem.itemList }" var="item">
			itemName.push("${item.itemName }");
			itemSeq.push("${item.itemSeq }");
		</c:forEach>
		arr.push({
			nameList : itemName,
			seqList : itemSeq
		});
	</c:forEach>
	function categoryChange(e) {
		 var d = window.event,
         btn = d.target || d.srcElement;
			var target = document.getElementById("item_"+btn.id);
			for (var i = 0; i < arr.length; i++) {
				if (e.value == i+1) {
				var itemNameList = arr[i].nameList;
				var itemSeqList = arr[i].seqList;
			}
		}
			 target.options.length = 0;
			for (x in itemNameList) {
				var opt = document.createElement("option");
				opt.value = itemSeqList[x];
				opt.innerHTML = itemNameList[x];
				target.appendChild(opt);
		} 
		
		
	}
</script>

</html>