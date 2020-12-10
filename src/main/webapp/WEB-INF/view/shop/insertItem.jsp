<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 추가</title>
<style>
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<form action="inserItem.do" method="post">
		<table id="insertTable">
			<tr>
				<th>카테고리</th>
				<th>이름</th>
				<th>가격</th>
				<th>제조사</th>
				<th>설명</th>
				<th>재고</th>
			</tr>
			<tr>
				<td>
					<select name="category">
						<option value="categorySeq">categoryName</option>
					</select>
				</td>
				<td><input type="text" name="itemName" /></td>
				<td><input type="number" name="itemPrice" min="1" max="1000000" /></td>
				<td><input type="text" name="itemMaker" /></td>
				<td><input type="text" name="itemDesc" /></td>
				<td><input type="number" name="stock" /></td>
				<input type="submit" value="적용" />
				<button type="button" class="addInput">추가</button>
				<a href="admin.jsp">취소</a>
			</tr>
		</table>
	</form>
	<script>
		$(document).ready(function(){
			$(".addInput").click(function(){
				var text = "<tr> <td><select name="category"> <option value="categorySeq">categoryName</option> </select> <td><input type="text" name="itemName" /></td> <td><input type="number" name="itemPrice" min="1" max="1000000" /> </td> <td><input type="text" name="itemMaker" /></td> <td><input type="text" name="itemDesc" /></td> <td><input type="number" name="stock" /></td> <input type="submit" value="적용" /> <button type="button" class="addInput">추가</button> <a href="admin.jsp">취소</a> </tr>";
				$("#insertTable").append(text).load(window.location.href + '#insertTable');
			});
		});
	</script>
</body>
</html>