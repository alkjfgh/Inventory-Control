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
	@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
	body{
		background: hsl(60, 100%, 98%);
	}
	h1{
		text-align: center;
		font-family:'Do Hyeon', sans-serif;
	}
	form{
		background-color: skyblue;
		height: 500px;
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
	    position: relative;
	    left: 0;
	}
	.receipt_li {
		margin : 0 auto;
	    height: 600px;
	    float: left;
	    list-style: none;
	    position: absolute;
	    font-family:'Do Hyeon', sans-serif;
	    
	}
	.receipt {
	    width: 100%;
	    height: 100%;
	}
	.receipt_li:nth-of-type(1) {
	    background-color: #9DC8C8;
	}
	.receipt_li:nth-of-type(2) {
	    background-color: #58C9B9;
	}
	.receipt_li:nth-of-type(3) {
	    background-color:#519D9E;
	}
	.receipt_li:nth-of-type(4) {
	    background-color: #9DC8C8;
	}
	.receipt_li:nth-of-type(5) {
	    background-color: #58C9B9;
	}
	.receipt_li:nth-of-type(6) {
	    background-color: #519D9E;
	}
	.shop, .item{
		margin : 0 auto;
	}
	.item {
		width : 380px;
		text-align: center;
	}
	.item td{
		text-align: center;
	}
	hr{
		border-style : none;
		border-bottom: 3px white solid;
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
	.buyTotal{
		margin-top : 30px;
		font-size: 1.5em;
		text-align: center;
		font-family:'Do Hyeon', sans-serif;
	}
	.buyTotal input{
		font-size: 1.1em;
		background: #D1B6E1;
		border-style : none;
		border-radius: 15px;
		margin-left: 10px;
		font-family:'Do Hyeon', sans-serif;
	}
</style>
</head>
<body>
	<h1>구매 확인  페이지</h1>
	<form action="buyComplete.do" method="post">
		<div id="receipt_slide">
			<a id="arrowLeft" class="arrows" href="#"><img src="../resources/img/arrowLeft.png" alt=""></a>
			<a id="arrowRight" class="arrows" href="#"><img src="../resources/img/arrowRight.png" alt=""></a>
			<ul id="receipt_container">
			<c:forEach items="${buyList }" var="buyCheck">
				<li class="receipt_li">
					<div>
						<table class="shop">
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
						<table class="item">
							<tr>
								<th>아이템 이름</th>
								<th>단가</th>
								<th>수량</th>
								<th>금액</th>
							</tr>
							<c:forEach items="${buyCheck.buyItemList }" var="item">
							<tr>
								<td>${item.item.itemName }</td>
								<td>${item.item.itemPrice }</td>
								<td>${item.buyCnt}</td>
								<td><span class = "total">${item.item.itemPrice*item.buyCnt}</span></td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div class="buyTotal">
			<span id="buyTotal" >총금액 : </span>
			<input type="submit" value="결재 완료" />
		</div>
	</form>
	<div id="back">
		<a href="../home.do" >취소</a>
	</div>
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
		$("#arrowLeft").hide(0); 
		if(li_Length < 3){
			$("#arrowRight").hide(0); 
			minLeft = 0;
		}
		$("#receipt_slide").css({width : li_width * 3 + "px"});
		$(".receipt_li").css({width : li_width + "px"});
		for (var i = 1; i <= li_Length; i++) {
			$(".receipt_li:nth-of-type(" + i + ")").css({left : li_width * (i - 1) + "px"});
		}
		$("#arrowLeft").click(function(){
			var leftVal = parseInt(container.css("left").split('p')[0]);
			var result = (leftVal + li_width * 3);
			if(0 < result){
				 $("#arrowLeft").hide(0); 
				result = 0;
			}
			$("#arrowRight").show(0); 
			container.stop().animate({left : result * 3 + "px"});
		});
		$("#arrowRight").click(function(){
			var leftVal = parseInt(container.css("left").split('p')[0]);
			var result = (leftVal - li_width * 3);
			if(minLeft > result){
				$("#arrowRight").hide(0);
				result = minLeft;
			}
			$("#arrowLeft").show(0);
			container.stop().animate({left : result + "px"});
		});
	});
</script>
</html>