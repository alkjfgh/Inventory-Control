
$('.add').click(function() {
	$('.categoryAdd').show();
	$('.categoryDelete').hide();
});
$('.del').click(function() {
	$('.categoryAdd').hide();
	$('.categoryDelete').show();
});
	var cnt = 1
	$('button').click(function() {
		$("input[name=cnt]").attr("value", cnt);
		$('.insertCategory').append('카테고리 이름<input type="text" name="categoryName_'+ cnt++ +'" /> </br> ')
	});