<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <button>추가</button>
	<form action="buy.do" method="post">
    	<input type="text" hidden="hidden" name="cnt" value="" id="cnt"/>
    	<table class="insertItem">
	        <tr>
    	        <th>shop name</th>
        	    <th>category name</th>
            	<th>item name</th>
            	<th>개수</th>
        	</tr>
		</table>
		<input type="submit" value="구매">
	</form>
</body>
<script>
	var cnt = 1;
	$('button').click(function() {
		$("input[name=cnt]").attr("value", cnt);
		$('.insertItem').append('<tr><td><select id="' + cnt + '" name="shop_' + cnt +'" onchange="shopChange(this)" required="required"><option value="">상점을 선택해주세요</option><c:forEach items="${shopInfoList }" var="shopInfo"><option value="${shopInfo.shop.shopSeq }">${shopInfo.shop.shopName }</option></c:forEach></select></td><td><select id="category_' + cnt + '" name="category_' + cnt + '" onchange="categoryChange(this)" required="required"><option value="">카테고리를 선택해주세요</option></select></td><td><select id="item_'+ cnt +'" name="item_'+ cnt + '" required="required" onchange="itemChange(this)"><option value="">아이템을 선택해주세요</option></select></td><td><input type="number" name="total_'+ cnt++ + '" required="required" min = "0" max = "0"/></td></tr>');
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
			<c:forEach items="${categoryItem.itemList }" var="item">
				itemName.push("${item.itemName}");
				itemSeq.push("${item.itemSeq}");
				itemRemain.push("${item.remain}");
			</c:forEach>
			itemInfoList.push({
				categorySeq : ${categoryItem.category.categorySeq},
				nameList: itemName,
				seqList: itemSeq,
				remainList: itemRemain
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
		var target = document.getElementById("category_" + btn.id);
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
		btn.id = btn.id.charAt(btn.id.length-1);
		var target1 = document.getElementById(btn.id);
		var target2 = document.getElementById("item_" + btn.id);
		for (var i = 0; i < shopList[target1.value - 1].itemList.length; i++) {
			if (e.value == shopList[target1.value - 1].itemList[i].categorySeq) {
				var itemNameList = shopList[target1.value - 1].itemList[i].nameList;
				var itemSeqList = shopList[target1.value - 1].itemList[i].seqList;
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
		btn.id = btn.id.charAt(btn.id.length-1);
		var shop_seq = $("select[name = shop_" + btn.id + "] option:selected").val();
		var category_seq = $("select[name = category_" + btn.id + "] option:selected").val();
		var item_seq = $("select[name = item_" + btn.id + "] option:selected").val();
		var shopLength = shopList.length;
		for(var i=0;i<shopLength;i++){
			var shop = shopList[i];
			if(shop.shopSeq = shop_seq){
				var categoryList = shop.itemList;
				var categoryLength = categoryList.length;
				for(var j=0;j<categoryLength;j++){
					var category = categoryList[j];
					if(category.categorySeq = category_seq){
						var seqList = category.seqList;
						var seqLength = seqList.length;
						var remainList = category.remainList;
						for(var k=0;k<seqLength;k++){
							var itemSeq = seqList[k];
							if(itemSeq = item_seq){
								console.log("total_" + btn.id);
								console.log(remainList[k]);
								console.log(remainList);
								$("input[name = total_" + btn.id + "]").attr("max", remainList[k]);
							}
						}
					}
				}
			}
		}
	}
</script>
</html>
<!-- 
<td>
    <select name="shop_' + cnt + '" id="' + cnt + '" onchange="shopChange(this)" required="required">
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