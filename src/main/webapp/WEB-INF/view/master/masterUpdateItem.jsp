<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 추가 및 삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/master/masterUpdateItem.css"/>">
<script src="<c:url value="/resources/js/master/masterUpdateItem.js"/>"></script>
</head>
<body>
<h1>물품 추가 및 삭제</h1>
	<div id="select">
		<button class="add"><span>추가</span></button>
		<button class="del"><span>삭제</span></button>
	</div>
	<div class="itemAdd">
		<div class="insertaddContainer">
			<button class="insertadd">목록 추가하기</button>
		</div>
		<form action="masterInsertItem.do" method="post" class="masterInsertItem">
			<input type="text" hidden="hidden" name="cnt" value="" id="cnt" />
			<table id="iteminsert">
				<thead>
					<tr>
						<th>카테고리</th>
						<th>물품명</th>
						<th>물품가격</th>
						<th>제조사</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div class="insert-submit-con">
				<input class="insert-submit" type="submit" value="적용" /><br />
			</div>
		</form>
	</div>
	<div class="itemDelete">
		<form action="masterDeleteItem.do" method="post">
			<table>
				<thead>
					<tr>
						<th>카테고리</th>
						<th>물품 번호</th>
						<th>물품 이름</th>
						<th>물품 가격</th>
						<th>물품 제조사</th>
						<th>체크</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${itemList }" var="item">
					<tr>
						<td>${item.categoryName  }</td>
						<td>${item.itemSeq }</td>
						<td>${item.itemName }</td>
						<td>${item.itemPrice }</td>
						<td>${item.itemMaker }</td>
						<td><input class="checkbox" type="checkbox" name="${item.categorySeq  }_itemSeq_${item.itemSeq }" /></td>
					</tr>
					</c:forEach>
				</tbody>		
			</table>
			<div class="btn">
				<div class="addbtn"></div>
			</div>
			<div class="delete-submit-con"> 
				<input class="delete-submit" type="submit" value="삭제하기" />
			</div>
		</form>
	</div>
	<div id="back">
		<a href="master.do" >뒤로가기</a>
	</div>
</body>
<script>
	$(document).ready(function() {
		var cnt = 1;
		$('.insertadd').click(function() {
			var html = '<tr class="itemInput"><td>'
				+'<select class="form-control" id="category" name="categorySeq_'+ cnt +'" required="required">'
				+'<option>카테고리를 선택해주세요</option>'
				+'<c:forEach items="${categoryList}" var="categoryItem">'
				+'<option value="${categoryItem.categorySeq }">${categoryItem.categoryName  }</option>'
				+'</c:forEach>'
				+'</select></td>'
				+'<td><input type="text" name="itemName_'+ cnt +'" placeholder="물품이름"/></td>'
				+'<td><input type="number" name="itemPrice_'+ cnt +'" placeholder="물품가격"/></td>'
				+'<td><input type="text" name="itemMaker_'+ cnt +'" placeholder="제조사"/></td>';
			html += '<td><button type="button" class="btnDel">Del</button></td></tr>';
			$('#iteminsert tbody').append(html);
			$("input[name=cnt]").attr("value", cnt++);
			$('tbody').on("click", ".btnDel", function() {
			    $(this).parent().parent().remove();
			});
		});
	});
</script>
</html>