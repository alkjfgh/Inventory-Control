<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매 현황</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap%27');
	body{
        font-family: 'Do Hyeon', sans-serif;
        background-color: hsl(60, 100%, 98%);
        margin: 50px;
    }
	h1{
		text-align: center;
	}
	.searchA {
		display: inline-block;
		border-radius: 4px;
		background-color: #D1B6E1;
		border: none;
		color: black;
		text-align: center;
		font-size: 24px;
		padding: 12px;
		width: 200px;
		transition: all 0.5s;
		cursor: pointer;
		margin: 5px;
	}
	.searchA span {
		cursor: pointer;
		display: inline-block;
		position: relative;
		transition: 0.5s;
	}
	.searchA span:after {
		content: '\00bb';
		position: absolute;
		opacity: 0;
		top: 0;
		right: -20px;
		transition: 0.5s;
	}
	.searchA:hover span {
		padding-right: 25px;
	}
	.searchA:hover span:after {
		opacity: 1;
		right: 0;
	}
	.searchB {
		display: inline-block;
		border-radius: 4px;
		background-color: #519D9E;
		border: none;
		color: black;
		text-align: center;
		font-size: 24px;
		padding: 12px;
		width: 200px;
		transition: all 0.5s;
		cursor: pointer;
		margin: 5px;
	}
	.searchB span {
		cursor: pointer;
		display: inline-block;
		position: relative;
		transition: 0.5s;
	}
	.searchB span:after {
		content: '\00bb';
		position: absolute;
		opacity: 0;
		top: 0;
		right: -20px;
		transition: 0.5s;
	}
	.searchB:hover span {
		padding-right: 25px;
	}
	.searchB:hover span:after {
		opacity: 1;
		right: 0;
	}
	form{
		display : inline-block;
	}
	#button{
		margin: 0 auto;
		text-align: center;
	}
	.category, .back{
		margin: 0 auto;
		text-align: center;
	}
	.searchCondition input:nth-of-type(1) {
		width: 125px;
	}
	a{font-weight: bold;}
    a:link { color: rgb(0, 0, 0); text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color: rgb(255, 145, 0); text-decoration: none;}
</style>
</head>
<body>
	<h1>판매 현황</h1>
	<div id="button">
		<button class="searchA"><span>단위검색</span></button>
		<button class="searchB"><span>기간 검색(일)</span></button>
		<button class="searchC"><span>매출 보기</span></button>
		<button class="searchD"><span>개수 보기</span></button>
		<div class="selectSearch" style="display : none;">
			<form action="graph.do" method="post" class="searchCondition" >
				<select name="searchCondition" id="" onchange="conditionClick(this)">
					<option value="day" class="conditionDay">하루판매량</option>
					<option value="week" class="conditionWeek">일주일 판매량</option>
					<option value="month" class="conditionMonth">한달판매량</option>
				</select>
				<input type="number" class="searchKeyword" name="searchKeyword" min="1" max="${shop.shopCount }" required="required" onblur="numberCheck(this)" />
				<input type="submit" value="검색" />
			</form>
		</div>
		<div class="inputSearch" style="display : none;">
			<form action="graph.do" method="post" class="searchForm">
				<input min="1" id="start" type="number" name="start"/> ~ <input id="end" type="number" name="end" max="${shop.shopCount}" />
				<input type="submit" value="검색" />
			</form>
		</div>
	</div>
	<div class="container">
		<c:forEach items="${soldList }" var="soldCategory">
			<canvas id="${soldCategory.category.categoryName }"></canvas>
		</c:forEach>
	</div>
	<div class="category">
	</div>
	<div class="back">
		<a href="ShopInfo.do">뒤로가기</a>
	</div>
	<script>
		countMax = parseInt("<c:out value="${shop.shopCount}" />");
		function conditionClick(e){
			if(e.value=='day'){
				$('.searchKeyword').removeAttr("readonly");
				$('.searchKeyword').removeAttr("placeholder");
				$('.searchKeyword').attr("max", countMax);
			}
			else if(e.value=='week'){
				if(countMax / 7 < 1){
					$('.searchKeyword').val("");
					$('.searchKeyword').attr("readonly", "");
					$('.searchKeyword').attr("placeholder", "일주일 검색 불가");
				}
				$('.searchKeyword').attr("max", countMax/7);
			}
			else if(e.value=='month'){
				if(countMax / 30 < 1){
					$('.searchKeyword').val("");
					$('.searchKeyword').attr("readonly", "");
					$('.searchKeyword').attr("placeholder", "한달 검색 불가");
				}
				$('.searchKeyword').attr("max", countMax/30);
			}

			$('.inputSearch').hide();
		}
		function numberCheck(e){
			var value = parseInt(e.value);
			if(Number.isNaN(value)){
				e.value = 1;
			}
			var max = parseInt(e.max);
			var min = parseInt(e.min);
			if(value > max)
				e.value = max;
			if(value < min)
				e.value = min;
		}
		
		$('.searchA').click(function() {
			$('.selectSearch').show();
			$('.inputSearch').hide();
			$(".category button").hide();
		});
		$('.searchB').click(function() {
			$('.inputSearch').show();
			$('.selectSearch').hide();
			$(".category button").hide();
		});
		
		var ctx = new Array();
		var labelList = new Array();
		var dataList = new Array();
		var priceList = new Array();
		var backGroundColorList = new Array(); 
		var boderColorList = new Array(); 
		var colorData = ['rgba(165, 147, 224,', 'rgba(224, 227, 218,', 'rgba(255, 255, 243,', 'rgba(86, 98, 112,'];
		var index = 0;
		var size = 0;
		var wheelsize = 2;
		<c:forEach items="${soldList }" var="soldCategory">
			size++;
			ctx.push(document.getElementById('${soldCategory.category.categoryName}'));
			$(".category").append('<button class="${soldCategory.category.categoryName }">${soldCategory.category.categoryName }</button>');
			var labelItem = new Array();
			var dataItem = new Array();
			var priceItem = new Array();
			var backGroundColorItem = new Array();
			var boderColorItem = new Array();
			
			<c:forEach items="${soldCategory.soldLogList }" var="soldLog">
				labelItem.push('${soldLog.itemName}');
				dataItem.push('${soldLog.logSold}');
				priceItem.push('${soldLog.itemPrice}')
				backGroundColorItem.push(colorData[index] + " 0.6)");
				boderColorItem.push(colorData[index++] + " 1)");
				if(index >= colorData.length) index = 0;
			</c:forEach>
			var size3 = priceItem.length;
			for(var k = 0 ; k<size3 ; k++){
				priceItem[k] = priceItem[k]*dataItem[k];
			}
			labelList.push(labelItem);
			dataList.push(dataItem);
			priceList.push(priceItem);
			backGroundColorList.push(backGroundColorItem);
			boderColorList.push(boderColorItem);
		</c:forEach>
		$("canvas").hide(0);  
		$("canvas:nth-of-type(1)").show(0);
		$(document).ready(function(){
			$("button").click(function(){
				var thisClass = $(this).attr("class");
				if(thisClass != "searchC" && thisClass != "searchD"){
					$("canvas").hide(0);
					$("#" + thisClass).show(100);
				}
			})
		});
		var config = new Array();
		var myChart = new Array();
		function graph(){
			for(var i=0;i<size;i++){
				var graphMax = Math.max.apply(null, dataList[i]);
				var length = parseInt(String(graphMax).length);
				var fst = parseInt(String(graphMax).charAt(0));
				if(fst > 4) graphMax = Math.pow(10, length);
				else graphMax = Math.pow(10, length - 1) * 5;
				var size2 = labelList[i].length;
				dataset = new Array();
				for(var j=0;j<size2;j++){
					dataset.push({
						label : labelList[i][j],
						data : [dataList[i][j]],
						backgroundColor : backGroundColorList[i][j],
						borderColor : boderColorList[i][j],
						borderWidth : 1
					});
					
				}
				config.push({
					type : 'bar',
					data : {
						labels : ['물품 판매 현황'],
						datasets : dataset
					},
					options : {
						scales : {
							yAxes : [{
								ticks : {
									beginAtZero : true,
									stepSize : graphMax/10,
								    callback: function(value, index) {
							        	if(value.toString().length > 4 || value>=1000) return ((value / 1000).toFixed(1)).toLocaleString("ko-KR") + "k";
								        else return (parseInt(value)).toLocaleString("ko-KR");
								    },
									min:0,
								    max:graphMax
								}
							}]
						}
					}
				});
				myChart.push(new Chart(ctx[i], config[i]));
			}
		}
		graph();
		$('.searchC').click(function(){
			for(var i=0;i<myChart.length;i++){
				var dataset = config[i].data.datasets;
				for(var j=0;j<dataset.length;j++){
					var data = dataset[j].data;
					data[0] = priceList[i][j];
				}
				var graphMax = Math.max.apply(null, priceList[i]);
				var length = parseInt(String(graphMax).length);
				var fst = parseInt(String(graphMax).charAt(0));
				if(fst > 4) graphMax = Math.pow(10, length);
				else graphMax = Math.pow(10, length - 1) * 5;
				config[i].options.scales.yAxes[0].ticks.max = graphMax;
				config[i].options.scales.yAxes[0].ticks.stepSize = graphMax/10;
				myChart[i].update();
			}
		});
		$('.searchD').click(function(){
			for(var i=0;i<myChart.length;i++){
				var dataset = config[i].data.datasets;
				for(var j=0;j<dataset.length;j++){
					var data = dataset[j].data;
					data[0] = dataList[i][j];
				}
				var graphMax = Math.max.apply(null, dataList[i]);
				var length = parseInt(String(graphMax).length);
				var fst = parseInt(String(graphMax).charAt(0));
				if(fst > 4) graphMax = Math.pow(10, length);
				else graphMax = Math.pow(10, length - 1) * 5;
				config[i].options.scales.yAxes[0].ticks.max = graphMax;
				config[i].options.scales.yAxes[0].ticks.stepSize = graphMax/10;
				myChart[i].update();
			}
		});
	</script>
</body>
</html>