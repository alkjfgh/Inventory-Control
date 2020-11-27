<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set shop items</title>
</head>
<body>
	<h1>Set shop items</h1>
	<form action="setShopItems.do" method="post">
		<table>
			<tr>
				<td>물품 번호<input type="number" name="itemSeq" min="1"/></td>
				<td>물품 재고 설정<input type="number" name="need" min="1"/></td>
				<td><input type="submit" value="추가" /></td>
			</tr>
		</table>
	</form>
</body>
</html>