var phoneRegExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
function fun1() {
	if (obj.shopPhone.value == '') {
		alert('전화번호를 입력해주세요');
		obj.userPhone.focus();
		return false;
	}
	if (phoneRegExp.test(obj.shopPhone.value) == false) {
		alert('전화번호를 알맞게 입력해주세요.');
		obj.userPhone.focus();
		return false;
	}
	obj.submit();
	obj.reset();
}
function fun2() {
	var obj = document.fr;
	if (phoneRegExp.test(obj.shopPhone.value) == false) {
		document.getElementById("alert_phone").innerHTML = ('<span style="color: red;">전화번호 형식이 맞지않습니다.</span>');
		return false;
	} else {
		document.getElementById("alert_phone").innerHTML = ('<span style="color: green;">전화번호가 정상적으로 입력되었습니다.</span>');
	}
}