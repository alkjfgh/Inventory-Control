<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
	<h1>Sign Up</h1>
	<form action="SignUp.do" method="post">
		<table>
			<tr>
				<td bgcolor="orange">ID</td>
				<td><input type="text" name="userId" value="" required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">PASSWORD</td>
				<td><input type="password" name="userPassword" value=""
					required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">EMAIL</td>
				<td><input type="email" name="userEmail" value=""
					required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">NAME</td>
				<td><input type="text" name="userName" value="" required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">ADDRESS</td>
				<td><input type="text" name="userAddress"
					placeholder="" required="required" /></td>
			</tr>
			<tr>
				<td bgcolor="orange">PHONE</td>
				<td><input type="tel" name="userPhone" required="required" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Sign up"></td>
			</tr>
		</table>
	</form>
</body>
</html>