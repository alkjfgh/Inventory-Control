<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이템 추가 및 삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/shop/updateItem.css"/>">
</head>
<body>
	<h1>아이템 추가 및 삭제</h1>
	<div id="select">
		<button class="change" id="adda">아이템 추가</button>
		<button  class="del" id="dela">아이템 삭제</button>
	</div>
	<div id="main">
		<div class="add">
			<button class="insertadd">아이템 목록 추가</button>
			<form action="insertItem.do" method="post">
				<input type="text" hidden="hidden" name="cnt" value="" id="cnt" />
				<table class="addTable">
					<tr>
						<th>카테고리</th>
						<th>물품</th>
						<th>수량</th>
						<th>삭제</th>
					</tr>
				</table>
				<div class="insertItem"></div>
					<input class="submit" type="submit" value="적용" />
				<br />
			</form>
		</div>
		<div class="delete">
			<form action="deleteItem.do" method="post">
				<table>
					<tr>
						<th>카테고리</th>
						<th>상품 번호</th>
						<th>상품 이름</th>
						<th>상품 가격</th>
						<th>체크</th>
					</tr>
					<c:forEach items="${deleteList }" var="item">
					<tr>
						<td>${item.categoryName }</td>
						<td>${item.itemSeq }</td>
						<td>${item.itemName }</td>
						<td>${item.itemPrice }</td>
						<td><input type="checkbox" name="${item.categorySeq  }_itemSeq_${item.itemSeq }" /></td>
					</tr>
					</c:forEach>
				</table>
				<input type="submit" class="submit" value="적용" />
			</form>
		</div>
		<div class="back">
			<a href="ShopInfo.do">뒤로가기</a>
		</div>
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
	$('.insertadd').click(function() {
		var html = '<tr><td><select class="form-control"id="'+ cnt +'" name="category_'+ cnt +'" onchange="categoryChange(this)"required="required"><option>카테고리를 선택해주세요</option><c:forEach items="${categoryList }" var="category"><option value="${category.categorySeq }">${category.categoryName  }</option></c:forEach></select></td><td><select class="form-control"id="item_'+ cnt +'" name="item_'+ cnt + '" required="required"><option id = "item_'+ cnt +'">선택해주세요.</option></select></td><td><input type="number" name="total_'+ cnt + '" required="required" />';
		html += '</td><td><button type="button" class="btnDel">Del</button></td></tr>';
		$("input[name=cnt]").attr("value", cnt);
		cnt++;
		$('.addTable').append(html);
		$('.insertItem').on("click", ".btnDel", function() {
		    $(this).parent().remove();
		});
	});
	var arr = new Array();
	var cs = ${addList[0].categorySeq };
	var itemName = new Array();
	var itemSeq = new Array();
	<c:forEach items="${addList }" var="item">
		if(${item.categorySeq} != 0){
			if(cs != ${item.categorySeq}){
				arr.push({
					categorySeq : cs,
					nameList : itemName,
					seqList : itemSeq
				});
				itemName = new Array();
				itemSeq = new Array();
				cs = ${item.categorySeq};
			}
			itemName.push("${item.itemName }");
			itemSeq.push("${item.itemSeq }");
		}
	</c:forEach>
	if(cs != 0){
		arr.push({
			categorySeq : cs,
			nameList : itemName,
			seqList : itemSeq
		});
	}
	function categoryChange(e) {
		var d = window.event,
        btn = d.target || d.srcElement;
		var target = document.getElementById("item_"+btn.id);
		for (var i = 0; i < arr.length; i++) {
			if (e.value == arr[i].categorySeq) {
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