<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>구매 확인</title>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/buy/buyCheck.css"/>">
<script src="<c:url value="/resources/js/buy/buyCheck.js" />"></script>
</head>
<body>
	<h1>구매 확인</h1>
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
</html>