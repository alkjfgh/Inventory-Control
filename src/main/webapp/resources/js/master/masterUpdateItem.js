$(document).ready(function(){
	var pageIndex = 1;
	var lineCnt = 12;
	$('tbody tr').hide();
	$('tbody tr').slice(pageIndex * lineCnt - lineCnt, pageIndex * lineCnt).show(0);
	var pageBtn = Math.ceil($('tbody tr').length / lineCnt);
	for(var i = 1 ; i<=pageBtn ; i++){
		$('.addbtn').append('<button type="button" class="page" id="' + i + '">'+i+'</button>');
	}
	$(".page").click(function() {
		pageIndex = parseInt($(this).attr("id"));
		$('tbody tr').hide();
		$('tbody tr').slice(pageIndex * lineCnt - lineCnt, pageIndex * lineCnt).show(0); 
	});
	$('.add').click(function() {
		$('.itemAdd').show();
		$('.itemDelete').hide();
	});
	$('.del').click(function() {
		$('.itemAdd').hide();
		$('.itemDelete').show();
	});
});