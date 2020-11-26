<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Info</title>
</head>
<body>
<h1>Shop Info</h1>
<table>
	<tr>
		<td>Shop Seq</td>
		<td>${shop.shopSeq }</td>
	</tr>
	<tr>
		<td>Shop Name</td>
		<td>${shop.shopName }</td>
	</tr>
	<tr>
		<td>Shop Phone</td>
		<td>${shop.shopPhone }</td>
	</tr>
	<tr>
		<td>Shop Address</td>
		<td>${shop.shopAddress }</td>
	</tr>
	<tr>
		<td>Shop RegDate</td>
		<td>${shop.shopRegdate }</td>
	</tr>
</table>
</body>
</html>