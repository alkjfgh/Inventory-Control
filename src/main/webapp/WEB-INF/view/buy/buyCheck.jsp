<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Buy Check</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
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
	    position: relative;
	    left: 0;
	}
	.receipt_li {
		margin: 0 10px 0 10px;
	    height: 600px;
	    float: left;
	    list-style: none;
	    position: absolute;
	    font-family:'Do Hyeon', sans-serif;
		overflow-y: scroll;
   		-ms-overflow-style: none;
	}
	.receipt_li::-webkit-scrollbar{ display:none; }
	.receipt {
	    width: 100%;
	    height: 100%;
	}
	.arrows{
		width: 50px;
		height: 50px;
		position: absolute;
		z-index: 99;
		top: 325px;
	}
	.arrows img{
		width: 100%;
		height: 100%;
	}
	#arrowLeft{
		left: 30px;
	}
	#arrowRight{
		right: 30px;
	}
	.buyTotal{
		width: 140px;
		height: 55px;
		text-align: center;
		margin: 0 auto;
		font-size: 17px;
	}
	.buyTotal button{
		border-radius: 10px;
		font-family:'Do Hyeon', sans-serif;
		font-size: 25px;
	}
	.show-more{
		text-align: center;
	}
</style>
</head>
<body>
	<h1>구매 확인  페이지</h1>
	<form action="buyComplete.do" method="post">
		<a id="arrowLeft" class="arrows" href="#"><img src="../resources/img/arrowLeft.png" alt=""></a>
		<a id="arrowRight" class="arrows" href="#"><img src="../resources/img/arrowRight.png" alt=""></a>
		<div id="receipt_slide">
		    <div id="receipt_container" class="row">
				<c:forEach items="${buyList }" var="buyCheck">
		        <div class="receipt_li well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1">
		            <div class="row">
		                <div class="col-xs-6 col-sm-6 col-md-6">
		                    <address>
		                        <strong>${buyCheck.shop.shopName }</strong>
		                        <br>
		                       	${buyCheck.shop.shopAddress }
		                        <br>
		                        ${buyCheck.shop.shopRegdate }
		                        <br>
		                        <abbr title="Phone">P:</abbr> ${buyCheck.shop.shopPhone }
		                    </address>
		                </div>
		                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
		                    <p>
		                        <em class="receipt_count"></em>
		                    </p>
		                </div>
		            </div>
		            <div class="row">
		                <div class="text-center">
		                    <h1>Receipt</h1>
		                </div>
		                <table class="table table-hover">
		                    <thead>
		                        <tr>
		                            <th>Product</th>
		                            <th>Count</th>
		                            <th class="text-center">Price</th>
		                            <th class="text-center">Total</th>
		                        </tr>
		                    </thead>
		                    <tbody>
								<c:forEach items="${buyCheck.buyItemList }" var="item">
		                        <tr>
		                            <td class="col-md-9"><em>${item.item.itemName }</em></td>
		                            <td class="col-md-1" style="text-align: center"> ${item.buyCnt} </td>
		                            <td class="col-md-1 text-center">${item.item.itemPrice }</td>
		                            <td class="col-md-1 text-center item-total">${item.item.itemPrice*item.buyCnt}</td>
		                        </tr>
								</c:forEach>
		                        <tr class="details">
		                            <td>   </td>
		                            <td>   </td>
		                            <td class="text-right">
			                            <p><strong>Subtotal: </strong></p>
			                            <p><strong>Tax: </strong></p>
		                            </td>
			                            <td class="text-center">
			                            <p><strong class="sub-total"></strong></p>
			                            <p><strong class="tax"></strong></p>
		                            </td>
		                        </tr>
		                        <tr>
		                            <td>   </td>
		                            <td>   </td>
		                            <td class="text-right"><h4><strong>Total: </strong></h4></td>
		                            <td class="text-center text-danger"><h4><strong class="total"></strong></h4></td>
		                        </tr>
		                    </tbody>
		                </table>
		            </div>
		        </div>
				</c:forEach>
		    </div>
		</div>
		<div>
			<h4 class="extended-price"></h4>
		</div>
		<div class="buyTotal">
    		<button type="submit" class="btn btn-success btn-lg btn-block">
       		 	결제   <span class="glyphicon glyphicon-chevron-right"></span>
    		</button>
		</div>
	</form>
	<div id="back">
		<a href="../home.do" >취소</a>
	</div>
</body>
<script>
	var total_pay = 0;
	$(".receipt_li").each(function(i, table) {
		var eq_table = $(".receipt_li").eq(i);
		var item_total = eq_table.find(".item-total");
	    var total = 0;
	    var totalLength = item_total.length;
	    var totalval = item_total.html();
	    item_total.each(function(j, item) {
	    	var eq_item = $(".item-total").eq(j);
	        total += parseInt(eq_item.html());
		});
	    eq_table.find(".receipt_count").html(i + 1);
	    eq_table.find(".sub-total").html(total + '₩');
	    eq_table.find(".tax").html(total/10 + '₩');
	    eq_table.find(".total").html(total + total/10 + '₩');
	    total_pay += total + total/10;
	});
	$(".extended-price").html("총 결제 금액 : " + total_pay + "₩");
	$(document).ready(function(){
		var duration = 200;
		var li_width = 500;
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
		$(".receipt_li").css({width : li_width - 20 + "px"});
		for (var i = 1; i <= li_Length; i++) {
			$(".receipt_li:nth-of-type(" + i + ")").css({left : li_width * (i - 1) + "px"});
		}
		$("#arrowLeft").click(function(){
			var leftVal = parseInt(container.css("left").split('p')[0]);
			var result = (leftVal + li_width * 3);
			if(0 < result){
				$("#arrowLeft").hide(duration); 
				result = 0;
			}
			$("#arrowRight").show(duration); 
			container.stop().animate({left : result * 3 + "px"});
		});
		$("#arrowRight").click(function(){
			var leftVal = parseInt(container.css("left").split('p')[0]);
			var result = (leftVal - li_width * 3);
			if(minLeft > result){
				$("#arrowRight").hide(duration);
				result = minLeft;
			}
			$("#arrowLeft").show(duration);
			container.stop().animate({left : result + "px"});
		});
		$(".show-more").click(function() {
			$(this).hide(100);
			$(this).nextAll().show(100);
		})
	});
</script>
</html>