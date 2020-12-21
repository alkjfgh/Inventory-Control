<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 추가 및 삭제</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	body {
		font-family: 'Do Hyeon', sans-serif;
		width: 100%;
		background-color: hsl(60, 100%, 98%);
		text-align: center;
	}
	.category {
		margin: auto;
		width: 100%;
	}
	h1 {
		margin: 50px;
        text-align: center;  
        font-size: 42px;
	}
	.select {
		text-align: center;
		border: 1px solid #ccc;
		background-color: #f1f1f1;
	}
	a.add, 
	a.del
	{
		font-size: 24px;
	}
	#adda:link,
	#adda:visited {
		background-color: white;
		color: black;
		border: 2px solid #D1B6E1;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
	}
	#adda:hover,
	#adda:active {
		background-color: #D1B6E1;
		color: white;
	}
	#dela:link,
	#dela:visited {
		background-color: white;
		color: black;
		border: 2px solid #519D9E;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
	}
	#dela:hover,
	#dela:active {
		background-color: #519D9E;
		color: white;
	}
	/* 카테고리 추가 삭제 */
	.categoryAdd,
	.categoryDelete {
		display: none;
	}
	.categoryDelete table{
		margin: 0 auto;
	}
	#back {
		margin: 0 auto;
		text-align: center;
	}
	#back a{
		position: fixed;
		text-decoration: none;
		color: black;
		width: 50px;
		height: 50px;
		bottom: 20px;
	}
	.insertadd{
		margin-top: 30px;
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
	.insertCategory{
		margin-top: 30px;
	}
	.insertCategory_new{
		margin-bottom: 30px;
		border: 1px solid #D1B6E1;
		background: none;
		padding: 8px 18px;
		font-size: 16px;
		font-family: 'Do Hyeon', sans-serif;
		cursor: pointer;
		background: #D1B6E1;
		border-radius: 25px;
	}
	table{
		margin: 40px;
		padding: 10px;
		width: 400px;
	}
	th{
		font-size: 21px; 
	}
	th:nth-child(3){
		text-align: center;
	}
	td:nth-child(1){
		text-align: center;
	}
	td:nth-child(3){
		text-align: center;
	}
	.delete_button{
		margin-left: 30px;
		border: 1px solid #519D9E;
		background: none;
		padding: 8px 18px;
		font-size: 16px;
		font-family: 'Do Hyeon', sans-serif;
		cursor: pointer;
		background: #519D9E;
		border-radius: 25px;
	}
	.checkbox{
		left: 20px;
		top: 20px;
		width: 20px;
		height: 20px;
	}
	.indexPage{
		margin-top: 20px;
	}
	.input-container{
		margin-bottom: 20px;
	}
	.input-container button{
		border-style : none;
		border-radius: 50%;
	}
	.input-container div{
		padding-bottom: 10px;
	}
	a{font-weight: bold;}
    a:link { color: rgb(0, 0, 0); text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color: rgb(255, 145, 0); text-decoration: none;}
</style>
</head>
<body>
	<section>
		<h1>카테고리 추가 및 삭제</h1>
		<!-- 카테고리 추가 삭제 부분 -->
		<div class="category">
			<div id="select">
				<!-- a말고 button으로 바꿀것 -->
				<a href="#" class="add" id="adda">카테고리 추가 </a>
				<a href="#" class="del" id="dela">카테고리 삭제</a>
			</div>
			<!-- 추가버튼  및 카테고리 생성-->
			<div class="categoryAdd">
				<button class="insertadd">카테고리 목록 생성하기</button>
				<form action="insertCategory.do" method="post" class="insertCategory">
					<input type="text" hidden="hidden" name="cnt" value="" id="cnt" />
					<div class="input-container">
					</div>
					<input class="insertCategory_new" type="submit" value="적용" /><br />
				</form>
			</div>
			<!-- 삭제버튼 및 체크박스 카테고리 삭제 버튼-->
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
					<!-- 마지막 삭제 버튼 -->
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
    $('.add').click(function () {
        $('.categoryAdd').show();
        $('.categoryDelete').hide();
    });
    $('.del').click(function () {
        $('.categoryAdd').hide();
        $('.categoryDelete').show();
    });
    var cnt = 1;
    
    $('button').click(function () {
    	var html = '<div>카테고리 이름 <input type="text" name="categoryName_' + cnt++ + '" />'
    	html += '<button type="button" class="btnDel">Del</button></br></div>';
        $("input[name=cnt]").attr("value", cnt);
        $('.input-container').append(html);
        $('.input-container').on("click", ".btnDel", function() {
		    $(this).parent().remove();
		});
        
    });
    var pageBtn = Math.ceil( ${categoryCount} / 20);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.indexPage').append("<a href="
			+"updateCategory.do?pageIndex="+i+""
			+">"+i+"</a>");
	}
</script>
</html>