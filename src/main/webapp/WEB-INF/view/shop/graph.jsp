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
</head>
<body>
	<div class="container">
		<c:forEach items="${categoryList }" var="vo">
			<canvas id="${vo.category.categoryName }"></canvas>
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
		var ctx = new Array();
		var labelList = new Array();
		var dataList = new Array();
		var size = 0;
		<c:forEach items="${categoryList }" var="vo">
			size++;
			ctx.push(document.getElementById('${vo.category.categoryName}'));
			$(".category").append('<button class="${vo.category.categoryName }">${vo.category.categoryName }</button>');
			labelItem = new Array();
			dataItem = new Array();
			<c:forEach items="${vo.itemList }" var="item">
				labelItem.push('${item.itemName}');
				dataItem.push('${item.sold}');
			</c:forEach>
			labelList.push(labelItem);
			dataList.push(dataItem);
		</c:forEach>
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
								beginAtZero : true
							}
						} ]
					}
				}
			});
		}
		$("canvas").hide(0);
		$(document).ready(function(){
			$("button").click(function(){
				var thisClass = $(this).attr("class");
				$("canvas").hide(0);
				$("#" + thisClass).show(100);
			})
		});
	</script>
</body>
</html>