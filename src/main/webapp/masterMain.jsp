<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>마스터 메인 페이지로서 매장및 점주 리스트 내용이들어감</h1>

	<table>
		<tr>
			<th>지점 번호</th>
			<th>지점 이름</th>
			<th>지점 주소</th>
			<th>지점 번호</th>
			<th>지점 생성일</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
	<a href="singOut.do">로그아웃</a>
	<a href="masterItem.jsp">총 재고 관리</a>
	<a href="masterShop.jsp">매장, 점주 관리</a>
	<a href="masterSaleList.jsp">매장별 판매현황</a>
</body>
</html>