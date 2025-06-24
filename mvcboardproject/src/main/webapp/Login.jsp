<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
		@font-face {
		    font-family: 'OAGothic-ExtraBold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/OAGothic-ExtraBold.woff2') format('woff2');
		    font-weight: 800;
		    font-style: normal;
		}
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		* { 
			box-sizing:border-box; 
			font-family: NanumSquareNeo-Variable;
		}
       a { text-decoration: none; }
        form {
            width:400px;
            height:500px;
            display : flex;
            flex-direction: column;
            align-items:center;
            position : absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%) ;
            border: 1px solid #FF8C00;
            border-radius: 10px;
        }
        input[type='text'], input[type='password'] {
            width: 300px;
            height: 40px;
            border : 1px solid #FF8C00;
            border-radius:5px;
            padding: 0 10px;
            margin-bottom: 10px;
        }
        input[type='text']:focus, input[type='password']:focus{
        	outline: 1px solid #3F4B3B;
        	solid:none;
        }
        button {
            background-color: #FF8C00;
            color : white;
            width:300px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
        #title {
        	font-family:OAGothic-ExtraBold;
            font-size : 50px;
            margin: 40px 0 30px 0;
            color:#FF8C00
        }
        #msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
        #link{
        	display:flex;
        	width:300px;
        	justify-content: space-between;
        	align-items:center;
        }
        .lin{
        	display:block;
        }
        a.lin:hover{
        	cursor:pointer;
        }
        #title:hover{
        	cursor:pointer;
        }
</style>
<link rel="shortcut icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/512/2280/2280532.png">
</head>
<body>
	<form action='<c:url value="/login" />' method="post" onsubmit="return formCheck(this);">
		<h3 id="title" onclick="changeHome()">EAGLES</h3>
		<div id="msg"></div>
		<input type="text" name="id" placeholder="아이디입력" value="${cookie.cid.value}" autofocus>
		<input type="password" name="pwd" placeholder="비밀번호">
        <button>로그인</button>
        <div id="link">
            <label class="lin"><input type="checkbox" name="rememberId" ${not empty cookie.cid.value ? "checked" : ""  }> 
            아이디 기억</label> 
            <a class="lin" href='<c:url value="regist"/>'>회원가입</a>
        </div>
        <input type="hidden"  name ="url" value="${param.url}">
	</form>
	
	
	
	<script>
		if(${param.loginError != null }) document.querySelector("#msg").innerText ="아이디와 비밀번호를 확인해주세요"

	    function formCheck(frm) {
	    	    if(frm.id.value.length==0) {
	    	    	setMessage("아이디를 입력해주세요", frm.id);
	    	        return false;
	    	    }
	    	    if(frm.pwd.value.length==0) {
	    	    	setMessage("비밀번호를 입력해주세요", frm.pwd);
					return false;
	    	    }
	    	    return true;
	    }


	   function setMessage(msg, element){
	        document.getElementById("msg").innerHTML = msg;
	        if(element) {
	            element.select();
	        }
	   }
	   
		function changeHome(){
			window.location="./index.jsp";
		}
	   
	   
	</script>
</body>
</html>