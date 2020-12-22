<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 페이지</title>
<link rel="stylesheet" href="<c:url value="/resources/css/master/master.css"/>">
</head>
<body>
    <h1>관리자 페이지</h1>
    <ul class="menu">
        <li>
            <a href="shopList.do?pageIndex=1">매장리스트
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </a>
        </li>
        <li>
            <a href="ownerList.do?pageIndex=1">회원목록(점주)
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