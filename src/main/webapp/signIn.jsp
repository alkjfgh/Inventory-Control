<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign In</title>
</head>
<body>
	<h1>Sign In</h1>
	<form action="SignIn.do" method="post">
		<table>
			<tr>
				<td bgcolor="orange">ID</td>
				<td><input type="text" name="userId" value=""
					required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">PASSWORD</td>
				<td><input type="password" name="userPassword" value=""
					required="required" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Sign in"></td>
			</tr>
		</table>
	</form>
</body>
</html>