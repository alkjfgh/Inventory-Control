<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이템 추가 및 삭제</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	body {
		font-family: 'Do Hyeon', sans-serif;
		background-color: hsl(60, 100%, 98%);
		text-align: center;
	}
	h1{
		font-size: 42px;
		margin-top: 50px;
	}
	#main {
		margin: auto;
		padding: 50px;
		text-align: center;
	}
	button.change, 
	button.del
	{
		font-size: 20px;
	}
	#adda{
		background-color: white;
		font-family: 'Do Hyeon', sans-serif;
		color: black;
		border: 2px solid #D1B6E1;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
	}
	#adda:hover{
		background-color: #D1B6E1;
		color: white;
	}
	#dela{
		background-color: white;
		font-family: 'Do Hyeon', sans-serif;
		color: black;
		border: 2px solid #519D9E;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
	}
	#dela:hover {
		background-color: #519D9E;
		color: white;
	}
	.insertadd{
		margin: 20px 0px;
		border: 1px solid #D1B6E1;
		background: none;
		padding: 8px 18px;
		font-size: 16px;
		font-family: 'Do Hyeon', sans-serif;
		cursor: pointer;
		transition: 0.8s;
		background: #D1B6E1;
		border-radius: 25px;
	}
	.insertadd::before{
		content: "";
		position: absolute;
		left: 0;
		transition: 0.8s;
	}
	.addline{
		font-size: 25px;
	}
	select{
		width: 210px;
		padding: .6em .4em; 
		font-family: inherit; 
		font-size : 18px;
		background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  
		border: 1px solid #999;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none; 
		appearance: none; 
	}
	option, select{
		font-family: 'Do Hyeon', sans-serif;
	}
	.btnDel{
		background-color: white;
		border: 1px solid #ff1818;
		color: #ff1818;
		padding: 12px 22px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		cursor: pointer;
		-webkit-transition-duration: 0.4s; 
		transition-duration: 0.4s;
	}
	.btnDel:hover {
		box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
	}
	.delete table{
		font-size : 1.2em;
		margin: 0 auto;
		width: 40%;
	} 
	.delete table input{
		width: 25px;
		height: 25px;
	}
	input[type="checkbox"]:checked {
	  content: "";
	  top: -5px;
	  left: 5px;
	  border-radius: 0;
	  opacity:1; 
	  background: transparent;
	  border-color:transparent #6cc0e5 #6cc0e5 transparent;
	  border-top-color:transparent;
	  border-left-color:transparent;
	  -ms-transform:rotate(45deg);
	  -webkit-transform:rotate(45deg);
	  transform:rotate(45deg);
	}
	.add input{
		height: 35px;
	}
	.submit{
		font-family: 'Do Hyeon', sans-serif;
		font-size:16px;
		margin-top : 25px;
		border: 1px solid #D1B6E1;
		background: none;
		padding: 8px 18px;
		cursor: pointer;
		transition: 0.8s;
		background: #D1B6E1;
		border-radius: 25px;
	}
	.back{
		margin-top: 20px;
	}
	.back a{
		text-decoration: none;
		color: black;
	}
	.add, .delete {
  	  display: none;
	}
	table, tr, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	.addTable{
		margin: 0 auto;
	}
	.addTable th{
		height: 40px;
		font-size: 20px;
		width: 100px;
	}
</style>
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