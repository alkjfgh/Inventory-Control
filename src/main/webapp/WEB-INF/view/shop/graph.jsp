<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부트스트랩 차트그리기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
	form{
		display : inline-block;
	}
</style>
</head>
<body>
	<form action="">
		<input type="text" name="day" value="하루판매데이터 넘기는 값" hidden="hidden" />
		<input type="submit" value="하루판매량" />
	</form>
	<form action="">
		<input type="text" name="week" value="일주일 판매데이터 넘기는 값" hidden="hidden" />
		<input type="submit" value="일주일 판매량" />
	</form>
	<form action="">
		<input type="text" name="month" value="한달 판매데이터 넘기는 값" hidden="hidden" />
		<input type="submit" value="한달 판매량" />
	</form>
	<button class="search">기간 검색(일)</button>
	<div class="inputSearch" style="display : none;">
		<form action="" class="searchForm">
			<input type="number" /> ~ <input type="number" />
			<input type="submit" value="검색" />
		</form>
	</div>
	<div class="container">
		<c:forEach items="${soldList }" var="soldCategory">
			<canvas id="${soldCategory.category.categoryName }"></canvas>
		</c:forEach>
	</div>
	<div class="category">
	</div>
	<!-- 부트스트랩 -->
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
	<!-- 차트 -->
	<script>
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
		var size = 0;
		var wheelsize = 1;
		<c:forEach items="${soldList }" var="soldCategory">
			size++;
			ctx.push(document.getElementById('${soldCategory.category.categoryName}'));
			$(".category").append('<button class="${soldCategory.category.categoryName }">${soldCategory.category.categoryName }</button>');
			labelItem = new Array();
			dataItem = new Array();
			<c:forEach items="${soldCategory.soldLogList }" var="soldLog">
				labelItem.push('${soldLog.itemSeq}');
				dataItem.push('${soldLog.logSold}');
			</c:forEach>
			labelList.push(labelItem);
			dataList.push(dataItem);
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
				var myChart = new Chart(ctx[i], {
					type : 'bar',
					data : {
						labels : labelList[i],
						datasets : [ {
							label : '판매량',
							data : dataList[i],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
					 			'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)',
								'rgba(255, 99, 132, 0.2)'],
							borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)',
								'rgba(255, 99, 132, 1)'],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true,
									stepSize : wheelsize,
								    callback: function(value, index) {
							        	if(value.toString().length > 3) return (value / 1000).toLocaleString("ko-KR") + "k";
								        else return value.toLocaleString("ko-KR");
								    }
								}
							} ]
						}
					}
				});
			}
		}
		graph();
		$("canvas").on('wheel', function(event){
			if (event.originalEvent.wheelDelta > 0 || event.originalEvent.detail < 0) {
		       // scroll up
		    	wheelsize = wheelsize + 0.1;
		    	console.log(wheelsize);
		    	graph();
		    }
		    else{
		        // scroll down
		    	wheelsize= wheelsize- 0.1;
		    	console.log(wheelsize);
		    	graph();
	     	}
	    });
		function zoom(event) {
		  event.preventDefault();
		  scale += event.deltaY * -0.01;
		  // Restrict scale
		  scale = Math.min(Math.max(.125, scale), 4);
		  // Apply scale transform
		  el.style.transform = `scale(${scale})`;
		}
		let scale = 1;
		const el = document.querySelector('div');
		el.onwheel = zoom;
	</script>
</body>
</html>