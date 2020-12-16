<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
        body {
            margin: 0;
            padding: 0;
            font-family: 'Do Hyeon', sans-serif;
            background: hsl(60, 100%, 98%);
        }
        h1{
            margin-top: 50px;
            text-align: center;
            font-size: 45px;
        }
        ul{
            position: absolute;
            top: 35%;
            left: 50%;
            transform: translate(-50%,-50%);
            margin: 0;
            padding: 0;
            display: flex;
        }
        ul li{
            position: relative;
            list-style: none;
            font-size: 21px;
        }
        ul li a{
            position: relative;
            width: 200px;
            height: 40px;
            display: block;
            color: black;
            line-height: 40px;
            text-align: center;
            text-decoration: none;
            transition: .5s;
            box-sizing: border-box;
            /* border: 1px solid black;
            margin:  0 10px; */
        }
        ul li a span{
            position: absolute;
            width: 25%;
            height: 100%;
            background: black;
            z-index: -1;
            transform-origin: top;
            transform: scaleY(0);
            transition: transform .5s;
        }
        ul li a:hover {
            color: #fff;
        }
        ul li a:hover span{
            transform: scaleY(1);
            transform-origin: bottom;
        }
        ul li a span:nth-child(1){
            left: 0;   
            transition-delay: 0s;
        }
        ul li a span:nth-child(2){
            left: 25%;   
            transition-delay: 0.15s;
        }
        ul li a span:nth-child(3){
            left: 50%;   
            transition-delay: 0.3s;
        }
        ul li a span:nth-child(4){
            left: 75%;   
            transition-delay: 0.45s;
        }
        .logout{
            position: absolute;
            text-align: center;
            height: 24px;
            width: 75px;
            bottom: 20px;
            left: 50%;
            margin-left: -37.5px;
        }
        .logout:hover{
        	background-color: gray;
        	transition: 0.7s all;
        }
        .logout a{
			font-size: 24px;
			font-family:'Do Hyeon', sans-serif;
			text-decoration: none;
			color: black;
        }
        .logout a:hover{
        	color: #fff;
        	transition: 0.7s all;
        }
    </style>
</head>
<body>
    <h1>관리자 페이지</h1>
    <ul class="menu">
        <li>
            <a href="shopList.do">매장리스트
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>
        </li>
        <li>
            <a href="ownerList.do">회원목록(점주)
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>
        </li>
        <li>
            <a href="updateCategory.do">물품 카테고리 추가 삭제
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>
        </li>
        <li>
            <a href="masterUpdateItem.do">물품 추가 삭제
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>
        </li>
        <li>
            <a href="totalItem.do">총 재고현황
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>
        </li>
    </ul>
    <div class="logout">
    	<a href="../user/SignOut.do">로그아웃</a>
    </div>
</body>
</html>