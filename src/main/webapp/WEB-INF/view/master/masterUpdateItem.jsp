<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 추가 및 삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap%27');
	
    body {
        font-family: 'Do Hyeon', sans-serif;
        background-color: hsl(60, 100%, 98%);
        margin: 50px;
    }
    
	.itemAdd, .itemDelete {
		display: none;
	}
    h1{
        margin: 50px;
        text-align: center;  
        font-size: 42px;
    }
    #select{
        margin: 50px;
        padding: 0 auto;
        text-align: center;
    }
	/* 추가 */
	.add {
		display: inline-block;
		border-radius: 4px;
		background-color: #D1B6E1;
		border: none;
		color: black;
		text-align: center;
		font-size: 24px;
		padding: 12px;
		width: 100px;
		transition: all 0.5s;
		cursor: pointer;
		margin: 5px;
	}
	.add span {
		cursor: pointer;
		display: inline-block;
		position: relative;
		transition: 0.5s;
	}
	.add span:after {
		content: '\00bb';
		position: absolute;
		opacity: 0;
		top: 0;
		right: -20px;
		transition: 0.5s;
	}
	.add:hover span {
		padding-right: 25px;
	}
	.add:hover span:after {
		opacity: 1;
		right: 0;
	}
	/* 삭제  */
	.del {
		display: inline-block;
		border-radius: 4px;
		background-color: #519D9E;
		border: none;
		color: black;
		text-align: center;
		font-size: 24px;
		padding: 12px;
		width: 100px;
		transition: all 0.5s;
		cursor: pointer;
		margin: 5px;
	}
	.del span {
		cursor: pointer;
		display: inline-block;
		position: relative;
		transition: 0.5s;
	}
	.del span:after {
		content: '\00bb';
		position: absolute;
		opacity: 0;
		top: 0;
		right: -20px;
		transition: 0.5s;
	}
	.del:hover span {
		padding-right: 25px;
	}
	.del:hover span:after {
		opacity: 1;
		right: 0;
	}
	/* 목록추가하기 */
    .add,.del{
        font-size: 24px;
    }
    .itemAdd{
        margin: 0 auto;
        width: 800px;
        border: 3px solid #9DC8C8;
        padding: 10px;
        position: relative;
    }
    .insertaddContainer{
    	width: 150px;
    	height: 50px;
    	margin: 0 auto;
    }
    .insertadd{
    	width: 100%;
    	height: 100%;
    }
	.itemDelete{
        position: relative;
        width: 800px;
		margin: 0 auto;
        padding: 10px;
        border: 3px solid #9DC8C8;
	}	
	.masterInsertItem{
		position: relative;
		margin-top: 20px;
	}	
	/* 목록추가하기 */
	.insertadd {
		display: inline-block;
		padding: 5px;
		font-size: 15px;
		cursor: pointer;
		text-align: center;
		text-decoration: none;
		outline: none;
		color: #fff;
		background-color: #D1B6E1;
		border: none;
		border-radius: 15px;
		box-shadow: 0 9px #999;
	}
	.insertadd:hover {background-color: #D1B6E1}

	.insertadd:active {
		background-color: #D1B6E1;
		box-shadow: 0 5px #666;
		transform: translateY(4px);
	}	
	/*   */
	#back {
		margin: 30px;
		text-align: center;

	}	 	
	#back a {
		text-decoration: none; 
		color: black;
	}	
	#iteminsert{
		margin: 0 auto;
        width: 773px;
        position: relative;
		text-align: center;
	}	
	#iteminsert th:nth-of-type(1){
		width: 201px;
	}
	#iteminsert th:nth-of-type(2){
		width: 190px;
	}	
	#iteminsert th:nth-of-type(3){
		width: 189px;
	}	
	#iteminsert th:nth-of-type(4){
		width: 189px;
	}	
	.insert-submit-con{
		margin: 0 auto;
		width: 48.88px;
		height: 32px;
	}	
	.insert-submit{
		font-size: 24px;
		font-family:'Do Hyeon', sans-serif;
		text-decoration: none;
		color: black;
		background-color: #D1B6E1;
		border: none;
		border-radius: 5px;
	}	
	.insert-submit:hover{
       	color: red ;
       	transition: 0.7s all;
    }	
	.itemInput input{
		width: 160px;
		height: 40px;
		margin: 0;
		border: none;
    	background-color: hsl(60, 100%, 98%);
	}	
	.btnDel{
		width: 40px;
	}    
	/* 삭제 카테고리 */
	table, td, th {  
		border: 2px solid black;
	}	
	thead{
		text-align: center; 
	}	
	tbody{
		text-align: center;
	}	
	table {
		border-collapse: collapse;
		width: 100%;
	}
	th, td {
		padding: 12px;
	}	
	.delete-submit-con{
		margin: 0 auto;
		width: 145.73px;
		height: 92px;
		text-align: center;
	} 
	.delete-submit{
		margin: 30px;
		font-size: 24px;
		font-family:'Do Hyeon', sans-serif;
		text-decoration: none;
		color: black;
		background-color: #9DC8C8;
		border: none;
		border-radius: 5px;
	}	
	body {
	    -ms-overflow-style: none; /* IE and Edge */
	    scrollbar-width: none; /* Firefox */
	}	
	body::-webkit-scrollbar {
	    display: none; /* Chrome, Safari, Opera*/
	}
	</style>
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
						<td><input type="checkbox" name="${item.categorySeq  }_itemSeq_${item.itemSeq }" /></td>
					</tr>
					</c:forEach>
				</tbody>		
			</table>
			<div class="btn">
				<span class="addbtn"></span>
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
	var pageIndex = 1;
	var lineCnt = 12;
	$('tbody tr').hide();
	$('tbody tr').slice(pageIndex * lineCnt - lineCnt, pageIndex * lineCnt).show(0);
	var pageBtn = Math.ceil($('tbody tr').length / lineCnt);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.addbtn').append('<button type="button" class="page" id="' + i + '">'+i+'</button>');
	}
	$(document).ready(function() {
		$("button.page").click(function() {
			pageIndex = parseInt($(this).attr("id"));
			$('tbody tr').slice(pageIndex * lineCnt - lineCnt, pageIndex * lineCnt).show(0); 
		});
		$('.add').click(function() {
			$('.itemAdd').show();
			$('.itemDelete').hide();
		});
		$('.del').click(function() {
			$('.itemAdd').hide();
			$('.itemDelete').show();
		});
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