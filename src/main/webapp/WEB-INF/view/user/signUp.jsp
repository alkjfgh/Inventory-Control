<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title><style>
    @import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap');
    body{
        font-family: 'Do Hyeon', sans-serif;
        background-color: hsl(60, 100%, 98%);
    }
    h1{
        margin: 50px;
        text-align: center;  
        font-family: 'Do Hyeon', sans-serif;

    }
    table{
        width: 800px;
        height: 400px;
        margin: auto;
        margin-top: 120px;
        border: 1px solid black;
        border-collapse: collapse;
    }
    th,td{
        border: 0.125em solid black;
        padding: 12px;
        font-size: 18px;
    }
    .in_text{
        color: rgba(41, 43, 41, 0.466);
    }
    input[type=text] {
	    width: 35%;
	    padding: 3px;
	    margin: 8px 0;
	    box-sizing: border-box;
	    border: 3px solid #ccc;
	    -webkit-transition: 0.5s;
	    transition: 0.5s;
	    outline: none;
    }
    input[type=text]:focus {
    	border: 3px solid #555;
    }
    input[type=password] {
	    width: 35%;
	    padding: 3px;
	    margin: 8px 0;
	    box-sizing: border-box;
	    border: 3px solid #ccc;
	    -webkit-transition: 0.5s;
	    transition: 0.5s;
	    outline: none;
    }
    input[type=password]:focus {
    	border: 3px solid #555;
    }
    p{
	    width: 100px;
	    margin: auto;
	    margin-top: 50px;
	    padding: auto;
    }
    .insert{
	    font-family: 'Do Hyeon', sans-serif;
	    background-color: #A593E0; 
	    border: none;
	    color: white;
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	    -webkit-transition-duration: 0.4s; 
	    transition-duration: 0.4s;
    }
    .insert:hover {
    	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
    }
</style>
</head>
<body>
	<h1>Sign Up</h1>
    <form action="SignUp.do" name=fr method="post" onsubmit="return fun2()" > 
        <div class="singup"></div>
		<table>
			<tr>
				<th colspan="2">Sign Up</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="userId" onkeyup="fun3()">
					<span  id="alert_text"><span class="in_text">아이디를 입력해주세요</span></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPassword" onkeyup="fun4()"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td>
					<input type="password" name="userPassword1" onkeyup="fun4()">
					<span id="alert_pwd"><span class="in_text">패스워드를 한번 더 입력해주세요</span></span>
				</td>
			</tr>
			<tr>
				<td>메일주소</td>
				<td>
					<input type="text" name="userEmail" onkeyup="fun5()">
					<span id="alert_email"><span class="in_text">예)rmsdn@naver.com</span></span>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="userAddress"></td>
			</tr>
			<tr>
				<td>핸드폰번호</td>
				<td>
					<input type="text" name="userPhone" onkeyup="fun6()">
					<span id="alert_phone"><span class="in_text">예)010-0000-0000</span></span>
				</td>
			</tr>
		</table>
		<p>
			<input type="submit" class="insert" value="회원 가입">
        </p>
       </div>
	</form>
</body>
<script>
	var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;
	var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    function fun1() {
        var obj = document.fr;        
        obj.id.focus();
        
    }
    function fun2() {
        var obj = document.fr;
        if(obj.userId.value == '') {
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
        if(obj.userPassword.value == '') {
            alert('패스워드를 입력하세요');
            obj.userPassword.focus();
            return false;
        }
        if(obj.userPassword1.value == '' || obj.userPassword1.value != obj.userPassword.value) {
            alert('패스워드를 정확히 입력해주세요');
            obj.userPassword1.value = "";
            obj.userPassword1.focus();
            return false;
        }
        if(obj.userEmail.value == '') {
            alert('이메일을 입력해주세요');
            obj.userEmail.focus();
            return false;
        }
        if(emailRegExp.test(obj.userEmail.value)==false) {
            alert('이메일을 알맞게 입력해주세요.');
            obj.userEmail.focus();
            return false;
        }
        if(obj.userName.value == '') {
            alert('이름을 입력하세요');
            obj.userName.focus();
            return false;
        }
        if(obj.userPhone.value == '') {
            alert('핸드폰번호를 입력해주세요');
            obj.userPhone.focus();
            return false;
        }
        if(phoneRegExp.test(obj.userPhone.value)==false) {
            alert('핸드폰번호를 알맞게 입력해주세요.');
            obj.userPhone.focus();
            return false;
        }
 		obj.submit();
        obj.reset();
        document.getElementById("alert_text").innerHTML=('<span style="color: #777">아이디를 입력해주세요</span>');    
        document.getElementById("alert_pwd").innerHTML=('<span style="color: #777">패스워드를 한번 더 입력해주세요</span>');        
    }
    function fun3() {
        var obj = document.fr;
        var idRegExp = /^[a-zA-z0-9]{4,12}$/;
        if (obj.userId.value.length < 4||obj.userId.value.length>12 || idRegExp.test(obj.userId.value)==false) {
            document.getElementById("alert_text").innerHTML=('<span style="color: red;">아이디 영문+숫자조합으로는 4~12자 사이로 입력하세요</span>');            
            return;
        } else {
            document.getElementById("alert_text").innerHTML=('<span style="color: green;">정상적으로 입력되었습니다.</span>');    
        }
    }
    function fun4() {
        var obj = document.fr;
 		if(obj.userPassword1.value == '' ){
 			document.getElementById("alert_pwd").innerHTML=('<span style="color: red;">패스워드를 한번 더 입력해주세요</span>');            
            return;
 		}
        if(obj.userPassword1.value != obj.userPassword.value) {
            document.getElementById("alert_pwd").innerHTML=('<span style="color: red;">비밀번호가 일치하지 않습니다.</span>');            
            return;
        } else {
            document.getElementById("alert_pwd").innerHTML=('<span style="color: green;">입력한 패스워드와 일치합니다.</span>');    
        }
    }
    function fun5() {
        var obj = document.fr;
        if(emailRegExp.test(obj.userEmail.value)==false) {
            document.getElementById("alert_email").innerHTML=('<span style="color: red;">email 형식이 맞지않습니다.</span>');            
            return;
        } else {
            document.getElementById("alert_email").innerHTML=('<span style="color: green;">email 이 정상적으로 입력되었습니다.</span>');    
        }
    }
    function fun6() {
        var obj = document.fr;
        if(phoneRegExp.test(obj.userPhone.value)==false) {
            document.getElementById("alert_phone").innerHTML=('<span style="color: red;">핸드폰번호 형식이 맞지않습니다.</span>');            
            return;
        } else {
            document.getElementById("alert_phone").innerHTML=('<span style="color: green;">핸드폰번호가 정상적으로 입력되었습니다.</span>');    
        }
    }
</script>
</html>