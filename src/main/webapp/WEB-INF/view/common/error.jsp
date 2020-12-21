<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 에러 화면</title>
<style>
	body{
		background-color: #fff;
		color: #000;
	}
	table{
		width: 100%;
		border: 2px solid black;
		border-collapse: collapse;
	}
	table:last-of-type{
		text-align: center;
	}
	td{
		text-align: center;
	}
	.orange{
		background-color: orange;
	}
</style>
</head>
<body>
<!-- 타이틀 시작 -->
<table>
	<tr>
		<td class="orange"><b>기본 에러 화면입니다.</b></td>
	</tr>
</table>
<br />
<!-- 에러 메세지 -->
<table>
	<tr>
		<td>
			<br/><br/><br/><br/><br/>
			Message: ${exception.message }
			<br/><br/><br/><br/><br/>
		</td>
	</tr>
</table>
</body>
<a href="redirect:/home.do" >HOME</a>
</html>