<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

  
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        body {
            margin: 0 auto;
            padding: 0;
            background: hsl(60, 100%, 98%);
        }
        body h1 {
            font-size: 50px;
            margin-left: 50px;
        }
        .menu{
            text-align: center; 
            margin-top: 150px;
        }
        .menu li {
            text-align: center;
            list-style: none;
            display: inline-block;
            padding : 50px;
        }
        .menu li a{
            text-decoration: none;
            position: relative;
            color: black;
            font-size: 24px;
            font-weight: 600;
            font-family:'Do Hyeon', sans-serif;
            display: block;
            overflow: hidden;
            transition: 0.7s all;
            padding: 10px 20px;
            text-transform: uppercase;
        }
        .menu li a::before{
            content: '';
            width: 60px;
            position: absolute;
            border-bottom: 8px solid #519D9E;
            bottom: 0;
            right: 350px;
            transition: 0.7s all;
        }
        .menu li a:hover::before{
            right: 0;
        }
        .logout{
			margin: 0 auto;
			text-align: center;
        }
        .logout a{
			font-size: 24px;
			font-family:'Do Hyeon', sans-serif;
            position: fixed;
			text-decoration: none;
			color: black;
			width: 100px;
            height: 50px;
            bottom: 20px;
        }
        .logout a:hover{
        	color: green;
        	transition: 0.7s all;
        } 
    </style>
</head>
<body>
    <h1>Master Page</h1>
    <ul class="menu">
        <li>
            <a href="shopList.do">매장리스트</a>
        </li>
        <li>
            <a href="ownerList.do">회원목록(점주)</a>
        </li>
        <li>
            <a href="updateCategory.do">물품 카테고리 추가 삭제</a>
        </li>
        <li>
            <a href="masterUpdateItem.do">물품 추가 삭제</a>
        </li>
        <li>
            <a href="totalItem.do">총 재고현황</a>
        </li>
    </ul>
    <div class="logout">
    	<a href="../user/SignOut.do">로그아웃</a>
    </div>
</body>
</html>