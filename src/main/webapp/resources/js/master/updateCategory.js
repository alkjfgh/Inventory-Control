$(document).ready(function(){
    $('.add').click(function () {
        $('.categoryAdd').show();
        $('.categoryDelete').hide();
    });
    $('.del').click(function () {
        $('.categoryAdd').hide();
        $('.categoryDelete').show();
    });
    var cnt = 1;
    $('button').click(function () {
    	var html = '<tr><td><input type="text" name="categoryName_' + cnt++ + '" /></td>'
    	html += '<td><button type="button" class="btnDel">Del</button></td></tr>';
        $("input[name=cnt]").attr("value", cnt);
        $('.input-container').append(html);
        $('.input-container').on("click", ".btnDel", function() {
		    $(this).parent().parent().remove();
		});
    });
});