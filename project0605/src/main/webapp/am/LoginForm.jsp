

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="login2.css">
</head>
<body>
	<form action="LoginProcess.jsp" method="post" onsubmit="return formCheck(this);">
		<h3 id="title">Green</h3>
		<div id="msg"></div>
		<input type="text" name="id" placeholder="아이디입력" value='' autofocus>
		
		<input type="password" name="pwd" placeholder="비밀번호">
        <button>로그인</button>
        <div>
            <label><input type="checkbox" name="rememberId" > 아이디 기억</label> 
        </div>
	</form>
	<script>
	    function formCheck(frm) {
	    	    if(frm.id.value.length==0) {
	    	    	setMessage("아이디를 입력해주세요", frm.id);
/* 	    	    	document.querySelector("#msg").innerText = "아이디를 입력해주세요";
	    	    	frm.id.focus();
 */	    	        return false;
	    	    }
	    	
	    	    if(frm.pwd.value.length==0) {
	    	    	setMessage("비밀번호를 입력해주세요", frm.pwd);
					return false;
	    	    }
	    	    return true;
	    }
	   function setMessage(msg, element){
	      	document.querySelector("#msg").innerText = msg;
	        if(element) {
	            element.focus();
	        }
	   }   
	</script>
</body>
</html>




