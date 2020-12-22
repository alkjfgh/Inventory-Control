$(document).ready(function() {
	var total_pay = 0;
	$(".receipt_li").each(function(i, table) {
		var eq_table = $(".receipt_li").eq(i);
		var item_total = eq_table.find(".item-total");
		var total = 0;
		var totalLength = item_total.length;
		var totalval = item_total.html();
		item_total.each(function(j, item) {
			var eq_item = item_total.eq(j);
			total += parseInt(eq_item.html());
		});
		eq_table.find(".receipt_count").html(i + 1);
		eq_table.find(".sub-total").html(total + '₩');
		eq_table.find(".tax").html(total / 10 + '₩');
		eq_table.find(".total").html(total + total / 10 + '₩');
		total_pay += total + total / 10;
	});
	$(".extended-price").html("총 결제 금액 : " + total_pay + "₩");
	var duration = 200;
	var li_width = 500;
	var li_Length = $(".receipt_li").length;
	var container = $("#receipt_container");
	var quotient = (li_Length / 3).toFixed(0);
	var remainder = li_Length % 3;
	var minLeft = -((li_width * 3 * quotient) - (li_width * (3 - remainder)));
	$("#arrowLeft").hide(0);
	if (li_Length <= 3) {
		$("#arrowRight").hide(0);
		minLeft = 0;
	}
	$("#receipt_slide").css({
		width : li_width * 3 + "px"
	});
	$(".receipt_li").css({
		width : li_width - 20 + "px"
	});
	for (var i = 1; i <= li_Length; i++) {
		$(".receipt_li:nth-of-type(" + i + ")").css({
			left : li_width * (i - 1) + "px"
		});
	}
	$("#arrowLeft").click(function() {
		var leftVal = parseInt(container.css("left").split('p')[0]);
		var result = (leftVal + li_width * 3);
		if (0 < result) {
			$("#arrowLeft").hide(duration);
			result = 0;
		}
		$("#arrowRight").show(duration);
		container.stop().animate({
			left : result * 3 + "px"
		});
	});
	$("#arrowRight").click(function() {
		var leftVal = parseInt(container.css("left").split('p')[0]);
		var result = (leftVal - li_width * 3);
		if (minLeft > result) {
			$("#arrowRight").hide(duration);
			result = minLeft;
		}
		$("#arrowLeft").show(duration);
		container.stop().animate({
			left : result + "px"
		});
	});
	$(".show-more").click(function() {
		$(this).hide(100);
		$(this).nextAll().show(100);
	})
});