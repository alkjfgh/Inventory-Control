var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
function fun1() {
	var obj = document.fr;
	obj.id.focus();
}
function fun2() {
	var obj = document.fr;
	if (obj.userId.value == '') {
		alert('아이디를 입력하세요');
		obj.userId.focus();
		return false;
	}
	if (obj.userId.value.length < 4 || obj.userId.value.length > 12) {
		alert('아이디는 4~12자 사이로 입력하세요');
		obj.userId.value = "";
		obj.userId.focus();
		return false;
	}
	if (obj.userPassword.value == '') {
		alert('패스워드를 입력하세요');
		obj.userPassword.focus();
		return false;
	}
	if (obj.userPassword1.value == ''
			|| obj.userPassword1.value != obj.userPassword.value) {
		alert('패스워드를 정확히 입력해주세요');
		obj.userPassword1.value = "";
		obj.userPassword1.focus();
		return false;
	}
	if (obj.userEmail.value == '') {
		alert('이메일을 입력해주세요');
		obj.userEmail.focus();
		return false;
	}
	if (emailRegExp.test(obj.userEmail.value) == false) {
		alert('이메일을 알맞게 입력해주세요.');
		obj.userEmail.focus();
		return false;
	}
	if (obj.userName.value == '') {
		alert('이름을 입력하세요');
		obj.userName.focus();
		return false;
	}
	if (obj.userPhone.value == '') {
		alert('핸드폰번호를 입력해주세요');
		obj.userPhone.focus();
		return false;
	}
	if (phoneRegExp.test(obj.userPhone.value) == false) {
		alert('핸드폰번호를 알맞게 입력해주세요.');
		obj.userPhone.focus();
		return false;
	}
	obj.submit();
	obj.reset();
	document.getElementById("alert_text").innerHTML = ('<span style="color: #777">아이디를 입력해주세요</span>');
	document.getElementById("alert_pwd").innerHTML = ('<span style="color: #777">패스워드를 한번 더 입력해주세요</span>');
}
function fun3() {
	var obj = document.fr;
	var idRegExp = /^[a-zA-z0-9]{4,12}$/;
	if (obj.userId.value.length < 4 || obj.userId.value.length > 12
			|| idRegExp.test(obj.userId.value) == false) {
		document.getElementById("alert_text").innerHTML = ('<span style="color: red;">아이디 영문+숫자조합으로는 4~12자 사이로 입력하세요</span>');
		return;
	} else {
		document.getElementById("alert_text").innerHTML = ('<span style="color: green;">정상적으로 입력되었습니다.</span>');
	}
}
function fun4() {
	var obj = document.fr;
	if (obj.userPassword1.value == '') {
		document.getElementById("alert_pwd").innerHTML = ('<span style="color: red;">패스워드를 한번 더 입력해주세요</span>');
		return;
	}
	if (obj.userPassword1.value != obj.userPassword.value) {
		document.getElementById("alert_pwd").innerHTML = ('<span style="color: red;">비밀번호가 일치하지 않습니다.</span>');
		return;
	} else {
		document.getElementById("alert_pwd").innerHTML = ('<span style="color: green;">입력한 패스워드와 일치합니다.</span>');
	}
}
function fun5() {
	var obj = document.fr;
	if (emailRegExp.test(obj.userEmail.value) == false) {
		document.getElementById("alert_email").innerHTML = ('<span style="color: red;">email 형식이 맞지않습니다.</span>');
		return;
	} else {
		document.getElementById("alert_email").innerHTML = ('<span style="color: green;">email 이 정상적으로 입력되었습니다.</span>');
	}
}
function fun6() {
	var obj = document.fr;
	if (phoneRegExp.test(obj.userPhone.value) == false) {
		document.getElementById("alert_phone").innerHTML = ('<span style="color: red;">핸드폰번호 형식이 맞지않습니다.</span>');
		return;
	} else {
		document.getElementById("alert_phone").innerHTML = ('<span style="color: green;">핸드폰번호가 정상적으로 입력되었습니다.</span>');
	}
}