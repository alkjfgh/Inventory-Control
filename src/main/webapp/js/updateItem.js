
$('.change').click(function() {
	$('.add').show();
	$('.delete').hide();
});
$('.del').click(function() {
	$('.add').hide();
	$('.delete').show();
});
var cnt =  1;
$('button')
.click(
		function() {
			$("input[name=cnt]").attr("value", cnt);
			$('.insertItem')
					.append(
							'<label for="'+ cnt +'">카테고리선택</label> <select class="form-control"id="'+ cnt +'" name="category_'+ cnt +'" onchange="categoryChange(this)"required="required"><option>카테고리를 선택해주세요</option><c:forEach items="${categoryItemList }" var="categoryItem"><option value="${categoryItem.category.categorySeq }">${categoryItem.category.categoryName  }</option></c:forEach></select> <label for="item_'+ cnt +'">상품</label> <select class="form-control"id="item_'+ cnt +'" name="item_'+ cnt + '" required="required"><option id = "item_'+ cnt +'">선택해주세요.</option></select> <input type="number" name="total_'+ cnt++ + '" required="required" /> </br>');
		});
	var arr = new Array();
	<c:forEach items="${categoryItemList }" var="categoryItem">
		var itemName = new Array();
		var itemSeq = new Array();
		<c:forEach items="${categoryItem.itemList }" var="item">
			itemName.push("${item.itemName }");
			itemSeq.push("${item.itemSeq }");
		</c:forEach>
		arr.push({
			nameList : itemName,
			seqList : itemSeq
		});
	</c:forEach>
	function categoryChange(e) {
		 var d = window.event,
         btn = d.target || d.srcElement;
			var target = document.getElementById("item_"+btn.id);
			for (var i = 0; i < arr.length; i++) {
				if (e.value == i+1) {
				var itemNameList = arr[i].nameList;
				var itemSeqList = arr[i].seqList;
			}
		}
			 target.options.length = 0;
			for (x in itemNameList) {
				var opt = document.createElement("option");
				opt.value = itemSeqList[x];
				opt.innerHTML = itemNameList[x];
				target.appendChild(opt);
		} 
		
		
	}