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
	
</style>
</head>
<body>
	<h1>판매 현황</h1>
	<div id="button">
		<form action="graph.do" method="post">
			<select name="searchCondition" id="" onchange="conditionClick(this)">
				<option value="day" class="conditionDay">하루판매량</option>
				<option value="week" class="conditionWeek">일주일 판매량</option>
				<option value="month" class="conditionMonth">한달판매량</option>
			</select>
			<input type="number" class="searchKeyword" name="searchKeyword" min="1" max="1" required="required" />
			<input type="submit" value="검색" />
		</form>
		<form action="graph.do" id="dayForm" method="post">
			<input type="number" placeholder="" class="dayStart" value="3" name="start" min="1" max="${shop.shopCount }" onblur="dayChange(this)" />
			<input type="number" class="dayEnd" name="end" value="" hidden="hidden" />
			<input type="submit" class="daySubmit" value="하루판매량" />
		</form>
		<form action="graph.do" method="post">
			<input type="number" class="weekInput" name="week"  value="3"   min="1" max="${shop.shopCount}/7"/>
			<input type="submit" value="일주일 판매량" />
		</form>
		<form action="graph.do" method="post">
			<input type="text" class="monthInput" name="month" min="1" max="${shop.shopCount}/30"/>
			<input type="submit" value="한달 판매량" />
		</form>
		<button class="search">기간 검색(일)</button>
		<div class="inputSearch" style="display : none;">
			<form action="graph.do" method="post" class="searchForm">
				<input type="number" name="start"/> ~ <input type="number" name="end" />
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
	
	<!-- 차트 -->
	<script>
		/* function dayChange(e){
			var val1 = $(".dayStart").val();
			var result = val1;
			$(".dayEnd").val(result);
		} */
		countMax = parseInt("<c:out value="${shop.shopCount}" />");
		function conditionClick(e){
			if(e.value=='day'){
				$('.searchKeyword').attr("max", countMax);
			}
			else if(e.value=='week'){
				$('.searchKeyword').attr("max", countMax/7);
			}
			else if(e.value=='month'){
				$('.searchKeyword').attr("max", countMax/30);
			}
			console.log(countMax);
			console.log($('.searchKeyword').attr("max"));
			
		}
		
		
		$('.search').click(function() {
			$('.inputSearch').show();
		});
		$('.week').click(function() {
			$('.inputSearch').hide();
		});
		$('.month').click(function() {
			$('.inputSearch').hide();
		});
		$('.day').click(function() {
			$('.inputSearch').hide();
		});
		var ctx = new Array();
		var labelList = new Array();
		var dataList = new Array();
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
			var backGroundColorItem = new Array();
			var boderColorItem = new Array();
			<c:forEach items="${soldCategory.soldLogList }" var="soldLog">
				labelItem.push('${soldLog.itemName}');
				dataItem.push('${soldLog.logSold}');
				backGroundColorItem.push(colorData[index] + " 0.6)");
				boderColorItem.push(colorData[index++] + " 1)");
				if(index >= colorData.length) index = 0;
			</c:forEach>
			labelList.push(labelItem);
			dataList.push(dataItem);
			backGroundColorList.push(backGroundColorItem);
			boderColorList.push(boderColorItem);
		</c:forEach>
		$("canvas").hide(0);  
		$("canvas:nth-of-type(1)").show(0);
		$(document).ready(function(){
			$("button").click(function(){
				var thisClass = $(this).attr("class");
				$("canvas").hide(0);
				$("#" + thisClass).show(100);
			})
		});
		function graph(){
			for(var i=0;i<size;i++){
				var graphMax = Math.max.apply(null, dataList[i]);
				var length = parseInt(String(graphMax).length);
				var fst = parseInt(String(graphMax).charAt(0));
				if(fst > 5) graphMax = Math.pow(10, length);
				else graphMax = Math.pow(10, length - 1) * 5;
				var size2 = labelList.length;
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
				var myChart = new Chart(ctx[i], {
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
			}
		}
		graph();
	</script>
</body>
</html>