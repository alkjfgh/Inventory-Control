$(document).ready(function(){
	$('.change').click(function() {
		$('.add').show();
		$('.delete').hide();
	});
	$('.del').click(function() {
		$('.add').hide();
		$('.delete').show();
	});
});