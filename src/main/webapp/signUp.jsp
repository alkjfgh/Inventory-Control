<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
	<h1>Sign Up</h1>
	

	<form action="SignUp.do"  name=fr method="post" onsubmit="return checkAll()">
		<table width=750 border="1px" align=center>
			<tr>
				<th colspan="2" bgcolor="#E4F7BA">Sign Up</th>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" onkeyup="fun3()">
				<span id="alert_text"><span style="color: #777">아이디를 입력해주세요</span></span>
					</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userPassword" onkeyup="fun4()"> 
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="userPassword1" onkeyup="fun4()">
					<span id="alert_pwd"><span style="color: #777">패스워드를 한번 더 입력해주세요</span></span>
				</td>
			</tr>
			<tr>
				<td>메일주소</td>
				<td><input type="text" name="userEmail" onkeyup="fun5()">
				<span id="alert_email"><span style="color: #777">예)rmsdn@naver.com</span></span>
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
				<td><input type="text" name="userPhone"></td>
			</tr>
		</table>
		<p align=center>
			<input type="submit" value="회원 가입"  onclick="fun2()"> <input type="reset"
				name="reset" value="다시 입력">
		</p>
	</form>


</body>
<script>
	

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
            alert('아이디는 4~10자 사이로 입력하세요');
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
        if(obj.userName.value == '') {
            alert('이름을 입력하세요');
            obj.userName.focus();
            return false;
        }
        
 
        //obj.submit();
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
 
        if(obj.userPassword1.value == '' || obj.userPassword1.value != obj.userPassword.value) {
            document.getElementById("alert_pwd").innerHTML=('<span style="color: red;">패스워드가 일치하지 않습니다.</span>');            
            return;
        } else {
            document.getElementById("alert_pwd").innerHTML=('<span style="color: green;">입력한 패스워드와 일치합니다.</span>');    
        }
    }
    function fun5() {
    	var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var obj = document.fr;
 
        if(emailRegExp.test(obj.userEmail.value)==false) {
            document.getElementById("alert_email").innerHTML=('<span style="color: red;">email 형식이 맞지않습니다.</span>');            
            return;
        } else {
            document.getElementById("alert_email").innerHTML=('<span style="color: green;">email 이 정상적으로 입력되었습니다.</span>');    
        }
    }




</script>

</html>