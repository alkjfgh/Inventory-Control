<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 에러 화면</title>
<link rel="stylesheet" href="<c:url value="/resources/css/common/error.css"/>">
</head>
<body>
<table>
	<tr>
		<td class="orange"><b>기본 에러 화면입니다.</b></td>
	</tr>
</table>
<br />
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
<a href="../home.do" >HOME</a>
</html>