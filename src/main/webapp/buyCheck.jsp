<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style >
	form{
		background-color: navy;
		height: 600px;
	}
	#receipt_slide{
		position: relative;
		height: 100%;
		margin: 0 auto;
	    overflow: hidden;
	}
	#receipt_container {
	    height: 600px;
	    margin: 0 auto;
	    padding: 0;
	    position: absolute;
	    left: 0;
	}
	.receipt_li {
	    height: 600px;
	    float: left;
	    list-style: none;
	    position: absolute;
	}
	.receipt {
	    width: 100%;
	    height: 100%;
	}
	.receipt_li:nth-of-type(1) {
	    background-color: red;
	}
	.receipt_li:nth-of-type(2) {
	    background-color: green;
	}
	.receipt_li:nth-of-type(3) {
	    background-color: blue;
	}
	.receipt_li:nth-of-type(4) {
	    background-color: yellow;
	}
	.receipt_li:nth-of-type(5) {
	    background-color: maroon;
	}
	.receipt_li:nth-of-type(6) {
	    background-color: gray;
	}
	.receipt_li:nth-of-type(7) {
	    background-color: fuchsia;
	}
	.arrows{
		width: 50px;
		height: 50px;
		position: absolute;
		z-index: 99;
		top: 275px;
	}
	.arrows img{
		width: 100%;
		height: 100%;
	}
	#arrowLeft{
		left: 0px;
	}
	#arrowRight{
		right: 0px;
	}
</style>
</head>
<body>
<h1>구매 확인  페이지</h1>
<form action="buyComplete.do" method="post">
	<div id="receipt_slide">
		<a id="arrowLeft" class="arrows" href="#"><img src="img/arrowLeft.png" alt=""></a>
		<a id="arrowRight" class="arrows" href="#"><img src="img/arrowRight.png" alt=""></a>
		<ul id="receipt_container">
			<li class="receipt_li">
				<div>
					<c:forEach items="${buyList }" var="buyCheck">
					<table>
						<tr>
							<td>상점 이름:  </td>
							<td>${buyCheck.shop.shopName }</td>
						</tr>
						<tr>
							<td>상점 전화번호:  </td>
							<td>${buyCheck.shop.shopPhone }</td>
						</tr>
						<tr>
							<td>상점 주소:  </td>
							<td>${buyCheck.shop.shopAddress }</td>
						</tr>
					</table>
					<hr />
					<table>
						<tr>
							<th>카테고리 이름</th>
							<th>아이템 이름</th>
							<th>단가</th>
							<th>수량</th>
							<th>금액</th>
						</tr>
						<tr>
							<td>${buyCheck.category.categoryName }</td>
							<td>${buyCheck.item.itemName }</td>
							<td>${buyCheck.item.itemPrice }</td>
							<td>${buyCheck.buyCnt}</td>
							<td><span class = "total">${buyCheck.item.itemPrice*buyCheck.buyCnt}</span></td>
						</tr>
					</table>
					</c:forEach>
				</div>
			</li>
		</ul>
	</div>
	<span id="buyTotal" >총금액 : </span><input type="submit" value="결재 완료" />
</form>
</body>
<script>
	$(function(){
	    var total = 0;
	    var totalLength = $(".total").length;
	    var totalval = $(".total").html();
	    for(i=0; i<totalLength;i++){
	        total += parseInt($(".total").eq(i).html());
	    }
	    $("#buyTotal").html("총 금액 : " + total);
	
	})
	$(document).ready(function(){
		var li_width = 400;
		var li_Length = $(".receipt_li").length;
		var container = $("#receipt_container");
		var quotient = (li_Length/3).toFixed(0);
		var remainder = li_Length%3;
		var minLeft = -((li_width * 3 * quotient) - (li_width * (3 - remainder)));
		$("#receipt_slide").css({width : li_width * 3 + "px"});
		$(".receipt_li").css({width : li_width + "px"});
		
		for (var i = 1; i <= li_Length; i++) {
			$(".receipt_li:nth-of-type(" + i + ")").css({left : li_width * (i - 1) + "px"});
		}
		
		$("#arrowLeft").click(function(){

		console.log(minLeft);
			var leftVal = parseInt(container.css("left").split('p')[0]);
			var result = (leftVal + li_width * 3);
			if(0 < result) result = 0;
			container.stop().animate({left : result * 3 + "px"});
		});
		
		$("#arrowRight").click(function(){
			var leftVal = parseInt(container.css("left").split('p')[0]);
			var result = (leftVal - li_width * 3);
			if(minLeft > result) result = minLeft;
			container.stop().animate({left : result + "px"});
		});
	});
</script>
</html>