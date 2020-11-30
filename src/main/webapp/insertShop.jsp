<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>매장 정보</h1>
	<form action="insertShop.do" method="post">
		<table>
			<tr>
				<td bgcolor="orange">매장 이름</td>
				<td><input type="text" name="shopName" value=""
					required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">매장 주소</td>
				<td><input type="text" name="shopAddress" value=""
					required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">전화번호</td>
				<td><input type="text" name="shopPhone" value=""
					required="required" /></td>
			</tr>
		</table>
		<input type="submit" value="매장 등록" />
	</form>
</body>
</html>