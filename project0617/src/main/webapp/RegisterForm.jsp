<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>회원가입</title>
    <link rel="stylesheet" href="css/register.css">
</head>
<body>
	<form id="user" name="registerform" action="RegisterProcess.jsp" method="post" onsubmit="return formCheck(this)"> 	
	    <div class="title">Register</div>
	    
	    <div id="msg" class="msg"></div> 
	    <label for="id">아이디</label>
	    <input class="input-field" id="id" type="text" name="id" placeholder="8~12자리의 영대소문자와 숫자 조합" autofocus>
	    <label for="pwd">비밀번호</label>
	    <input class="input-field" id="pwd" type="password" name="pwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
	    <label for="cpwd">비밀번호확인</label>
	    <input class="input-field" id="cpwd" type="password" name="cpwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
	    <label for="name">이름</label>
	    <input class="input-field"  id="name" type="text" name="name" 	placeholder="홍길동">
	    <label for="email">이메일</label>
	    <input class="input-field"  id="email" type="email" name="email" placeholder="example@greenart.co.kr"> 
	    <label for="birth">생일</label>
	    <input class="input-field" id="birth" type="text" name="birth" placeholder="2022-12-15" >
	    <div class="sns-chk">
	        <label><input type="checkbox" name="sns" value="facebook"/>페이스북</label>
	        <label><input type="checkbox" name="sns" value="kakaotalk"/>카카오톡</label>
	        <label><input type="checkbox" name="sns" value="instagram"/>인스타그램</label>
	    </div>
	    <input id="input-submit" type="submit" value="회원가입"></input>
   </form> 
 

   <script src="https://kit.fontawesome.com/fd1f3e5f64.js" crossorigin="anonymous"></script>

	<script>
		function formCheck(frm) {
			var msg = '';
			if(frm.id.value.length<3) {
				setMessage('id를 세글자 이상 입력하세요..', frm.id);
				return false;
			}
			if(frm.pwd.value != frm.cpwd.value) {
				setMessage('비밀번호가 일치하지 않습니다.', frm.pwd)
				frm.pwd.value = "";
				frm.cpwd.value = "";
				return false;
			}
			return true;
		}
		function setMessage(msg, element) {
			document.querySelector("#msg").innerText = msg;
			if(element) {
				
			}
		}
	</script>
</body>
</html>