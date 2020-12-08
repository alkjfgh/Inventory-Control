<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<style>
		@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');

		* {
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}
		html{
            scroll-behavior: smooth;
        }
		body {
			font-family: 'Do Hyeon', sans-serif;
			height: 100vh;
			background-color: hsl(60, 100%, 98%);
			background-size: cover;
			color: #9DC8C8 #519D9E #D1B6E1 #58C9B9 hsl(60, 100%, 98%);

		}

		a {
			text-decoration: none
		}

		body a:link {
			color: black;
		}

		body a:visited {
			color: black;
		}

		h1 {
			font-size: 50px;
			margin: 10px;
			padding: 30px;
		}

		.owner_list_wrap {
			padding: 50px;
		}

		.owner_list {
			width: 100%;
			border-bottom: 1px solid #000;
		}

		.owner_list>thead>tr {
			font-size: 24px;

		}

		.owner_list tbody tr {
			font-size: 18px;
		}



		.owner_list tbody tr td {
			text-align: center;
		}

		.btn {

			border: 1px solid #58C9B9;
			background: none;
			padding: 8px 18px;
			font-size: 16px;
			font-family: 'Do Hyeon', sans-serif;
			cursor: pointer;
			margin: 5px;
			transition: 0.8s;
			background: #58C9B9;
			border-radius: 25px;
		}

		.area {
			color: #fff;
		}

		.area:hover {
			color: #58C9B9;
		}

		.btn::before {
			content: "";
			position: absolute;
			left: 0;
			z-index: -1;
			transition: 0.8s;
		}
		.gotopbtn{
            position: fixed;
            width: 50px;
            height: 50px;
            
            bottom: 40px;
            right: 5px;
            cursor: pointer;
           
            font-family: 'Do Hyeon', sans-serif;

            text-decoration: none;
            text-align: center;
            line-height: 50px;
            color: white;
            font-size: 26px;
			border: 0;
			
			
		
        }
	</style>
</head>

<body>
	<h1><a href="master.do" id="top">Owner List</a> </h1>
	<section class="owner_list_wrap">
		<table class="owner_list">
			<thead>
				<tr>
					<th>Shop seq</th>
					<th>ID</th>
					<th>Password</th>
					<th>Email</th>
					<th>Phone number</th>
					<th>Sysdate</th>
					<th>Name</th>
					<th>Address</th>
					<th>Level</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach items="${userList }" var="user">
					<form action="shopInfo.do">
						<tr>
							<td>${user.shopSeq }</td>
							<td>${user.userId }</td>
							<td>${user.userPassword }</td>
							<td>${user.userEmail }</td>
							<td>${user.userPhone }</td>
							<td>${user.userRegdate }</td>
							<td>${user.userName }</td>
							<td>${user.userAddress }</td>
							<td>${user.userLevel }</td>
						</tr>
					</form>
				</c:forEach>
			</tbody>
		</table>
	</section>

	<div id="bottom">
		<a href="#top" class="gotopbtn">▲</a>
	</div>
</body>

</html>