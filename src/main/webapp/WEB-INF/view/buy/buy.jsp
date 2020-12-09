<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Buy</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<button>추가</button>
	<form action="buyCheck.do" name=fr method="post">
		<input type="text" hidden="hidden" name="cnt" value="" id="cnt" />
		<input type="text" hidden="hidden" name="cntCheck" value="" id="cntCheck" />
		<table class="insertItem">
			<tr>
				<th>shop name</th>
				<th>category name</th>
				<th>item name</th>
				<th>개수</th>
				<th>금액(원)</th>
			</tr>
		</table>
		<span id="totalPrice">총 금액 : </span>
		<input type="submit" value="구매">
	</form>
</body>
<script>

	var cnt = 1;
	var cntCheck = 0;
	$('button').click(function() {
		cntCheck++;
		var html = '<tr><td><select id="shop_' + cnt + '" name="shop_' + cnt +'" onchange="shopChange(this)" required="required"><option value="">상점을 선택해주세요</option><c:forEach items="${shopInfoList }" var="shopInfo"><option value="${shopInfo.shop.shopSeq }">${shopInfo.shop.shopName }</option></c:forEach></select></td><td><select id="category_' + cnt + '" name="category_' + cnt + '" onchange="categoryChange(this)" required="required"><option value="">카테고리를 선택해주세요</option></select></td><td><select id="item_'+ cnt +'" name="item_'+ cnt + '" required="required" onchange="itemChange(this)"><option value="">아이템을 선택해주세요</option></select></td><td><input type="number" name="total_'+ cnt + '" required="required" min = "1" max = "0" onblur="numberCheck(this);"/>'
		html += '<td><span name = "alertMoney_'+ cnt + '" ></span>';
		html += '<span name = "price_'+ cnt++ + '"  hidden="hidden" ></span></td>';
		html += '<td><button type="button" class="btnDel">Del</button>';
		html += '</td></tr>';
		$("input[name=cnt]").attr("value", cnt);
		$("input[name=cntCheck]").attr("value", cntCheck);
		$('.insertItem').append(html);
		$(".insertItem").on("click", ".btnDel", function() {
		    $(this).parent().parent().remove();
		    cntCheck--;
		 });
	});
	var shopList = new Array();
	<c:forEach items="${shopInfoList }" var="shopInfo">
		var categoryName = new Array();
		var categorySeq = new Array();
		var itemInfoList = new Array();
		<c:forEach items="${shopInfo.categoryList }" var="categoryItem">
			categoryName.push("${categoryItem.category.categoryName}");
			categorySeq.push("${categoryItem.category.categorySeq}");
			var itemName = new Array();
			var itemSeq = new Array();
			var itemRemain = new Array();
			var itemPrice = new Array();
			<c:forEach items="${categoryItem.itemList }" var="item">
				itemName.push("${item.itemName}");
				itemSeq.push("${item.itemSeq}");
				itemRemain.push("${item.remain}");
				itemPrice.push("${item.itemPrice}");
			</c:forEach>
			itemInfoList.push({
				categorySeq : ${categoryItem.category.categorySeq},
				nameList: itemName,
				seqList: itemSeq,
				remainList: itemRemain,
				priceList : itemPrice
			});
		</c:forEach>
		shopList.push({ 
			shopSeq : ${shopInfo.shop.shopSeq},
			cateName: categoryName,
			cateSeq: categorySeq,
			itemList : itemInfoList
		});
	</c:forEach>
	
	function shopChange(e) {
		var d = window.event, btn = d.target || d.srcElement;
		var id = btn.id.charAt(btn.id.length-1);
		var target = document.getElementById("category_" + id);
		for (var i = 0; i < shopList.length; i++) {
			if (e.value == shopList[i].shopSeq) {
				var categoryNameList = shopList[i].cateName;
				var categorySeqList = shopList[i].cateSeq;
			}
		}
		target.options.length = 0;
		var opt = document.createElement("option");
		opt.value = "";
		opt.innerHTML = "카테고리를 선택해 주세요";
		target.appendChild(opt);
		for (x in categoryNameList) {
			opt = document.createElement("option");
			opt.value = categorySeqList[x];
			opt.innerHTML = categoryNameList[x];
			target.appendChild(opt);
		}
	}
	
	function categoryChange(e) {
		var d = window.event, btn = d.target || d.srcElement;
		var id = btn.id.charAt(btn.id.length-1);
		var target1 = document.getElementById("shop_" + id);
		var target2 = document.getElementById("item_" + id);
		var index;
		for (var i = 0; i < shopList.length; i++) {
			if (target1.value == shopList[i].shopSeq) {
				index = i;
				break;
			}
		}
		var length =  shopList[index].itemList.length;
		var itemList = shopList[index].itemList;
		for (var i = 0; i < length; i++) {
			if (e.value == itemList[i].categorySeq) {
				var itemNameList = itemList[i].nameList;
				var itemSeqList = itemList[i].seqList;
			}
		}
		target2.options.length = 0;
		var opt = document.createElement("option");
		opt.value = "";
		opt.innerHTML = "아이템을 선택해 주세요";
		target2.appendChild(opt);
		for (x in itemNameList) {
			var opt = document.createElement("option");
			opt.value = itemSeqList[x];
			opt.innerHTML = itemNameList[x];
			target2.appendChild(opt);
		}
	}
	
	function itemChange(e) {
		var d = window.event, btn = d.target || d.srcElement;
		var id = btn.id.charAt(btn.id.length-1);
		var shop_seq = $("select[name = shop_" + id + "] option:selected").val();
		var category_seq = $("select[name = category_" + id + "] option:selected").val();
		var item_seq = $("select[name = item_" + id + "] option:selected").val();
		$("input[name = total_" + id + "]").val(0);
		var shopLength = shopList.length;
		for(var i=0;i<shopLength;i++){
			var shop = shopList[i];
			if(shop.shopSeq == shop_seq){
				var categoryList = shop.itemList;
				var categoryLength = categoryList.length;
				for(var j=0;j<categoryLength;j++){
					var category = categoryList[j];
					if(category.categorySeq == category_seq){
						var seq_List = category.seqList;
						var seqLength = seq_List.length;
						var remain_List = category.remainList;
						var price_list = category.priceList;
						for(var k=0;k<seqLength;k++){
							var itemSeq = seq_List[k];
							if(itemSeq == item_seq){
								$("input[name = total_" + id + "]").attr("max", remain_List[k]);
								$("span[name = alertMoney_" + id + "]").html(0);
								$("span[name = price_" + id + "]").html(price_list[k]);
							}
						}
					}
				}
			}
		}
		var total = 0;
		for(i=1;i<=cnt;i++){
			var price = parseInt($("span[name = alertMoney_" + i + "]").text());
			if(!Number.isNaN(price))
				total += price;
		} 	
		$("#totalPrice").html("총 금액 : " + total);
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
		
		var index = e.name.charAt(e.name.length-1);
		var price = parseInt($("span[name = price_" + index + "]").text());
		$("span[name = alertMoney_" + index + "]").html(price * e.value);
		
		var total = 0;
		for(i=1;i<=cnt;i++){
			var price = parseInt($("span[name = alertMoney_" + i + "]").text());
			if(!Number.isNaN(price))
				total += price;
		} 	
		$("#totalPrice").html("총 금액 : " + total);
		
	}
	
	
</script>
</html>
<!-- 
<td>
    <select name="shop_' + cnt + '" id="shop_' + cnt + '" onchange="shopChange(this)" required="required">
    <c:forEach items="${shopInfoList }" var="shopInfo">
        <option value="${shopInfo.shop.shopSeq }">${shopInfo.shop.shopName }</option>
    </c:forEach>
    </select>
</td>
<td>
    <select id="category_' + cnt + '" name="category_' + cnt + '" onchange="categoryChange(this)" required="required">
        <option value="">카테고리를 선택해주세요</option>
    </select>
</td>
<td>
    <select id="item_'+ cnt +'" name="item_'+ cnt + '" required="required">
        <option value="">아이템을 선택해주세요</option>
    </select>
</td>
<td>
	<input type="number" name="total_'+ cnt++ + '" required="required"/>
</td>
<br> -->