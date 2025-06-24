<%@ page import="java.net.URLDecoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <style>
        * { 
        	box-sizing:border-box; 
        	font-size:15px;
		    font-family: 'NanumSquareNeo-Variable';        	
        }
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
        form {
            width:400px;
            height:600px;
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

        .input-field {
            width: 300px;
            height: 50px;
            border : 1px solid #FF8C00;
            border-radius:5px;
            padding: 0 10px;
            margin: 4px 0;
        }
        label {
          	font-family:'NanumSquareNeo-Variable';
            width:300px;
            height:30px;
            margin: 5px 0;
        }

        #input-submit{
        	font-family:'NanumSquareNeo-Variable';
            background-color: #FF8C00;
            color : white;
            width:300px;
            padding:10px;
            height:50px;
            font-size: 17px;
            border : none;
            border-radius: 5px;
            margin : 20px 0 30px 0;
        }
 		#input-submit:hover{
 			cursor:pointer;
 		}	
    	.title {
        	font-family:OAGothic-ExtraBold;
            font-size : 50px;
            margin: 40px 0 30px 0;
            color:#FF8C00
        }

        .msg {
            height: 30px;
            text-align:center;
            font-size:16px;
            color:red;
            margin-bottom: 20px;
        }
        .sns-chk {
            margin-top : 5px; 
        }
        .title:hover{
        	cursor:pointer;
        }
    </style>
    <link rel="shortcut icon" type="image/x-icon" href="https://cdn-icons-png.flaticon.com/512/2280/2280532.png">
    <title>회원가입</title>
</head>
<body>
	<form id="user" action='<c:url value="/regist"/>' method="post" onsubmit="return formCheck(this)"> 	
	    <div class="title" onclick="changeHome()">StudyLog</div>
	    <div id="msg" class="msg"></div> 
	    <label for="id">아이디</label>
	    <input class="input-field" type="text" id="id" name="id" value="${user.id }" placeholder="8~12자리의 영대소문자와 숫자 조합" autofocus>
	    <button type="button">중복체크</button>
	    <label for="pwd">비밀번호</label>
	    <input class="input-field" type="password"  id="pwd" name="pwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
	    <label for="cpwd">비밀번호확인</label>
	    <input class="input-field" type="password" id ="cpwd" name="cpwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
	    <label for="name">이름</label>
	    <input class="input-field" type="text"  id ="name" name="name" value="${user.name }" placeholder="홍길동">
<!-- 	    <div><input type="radio" name="email" value="no" id="no"><label for="no">수신동의x</label></div>
	    <div><input type="radio" name="email" value="yes" id="yes"><label for="yes">수신동의</label></div> -->
	    <input id="input-submit" type="submit" value="회원가입"></input>

   </form> 
 

   <script src="https://kit.fontawesome.com/fd1f3e5f64.js" crossorigin="anonymous"></script>
   <script>
   		if(${not empty param.registerError}) document.querySelector("#msg").innerText= '회원가입에 실패했습니다.';
		function formCheck(frm) {
		     var msg ='';
		
		     if(frm.id.value.length<3) {
		         setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
		         return false;
		     }
		     if(frm.id.value != frm.cpwd.value){
		    	 frm.pwd.value="";
		    	 frm.cpwd.value="";
		    	 setMessage('id와 pwd가 일치하지 않습니다.', frm.pwd);
		    	 return false;
		     }
		
		    return true;
		}
		
		function setMessage(msg, element){
		     document.getElementById("msg").innerHTML = 
		    	 `<i class="fa-sharp fa-solid fa-triangle-exclamation">${'${msg}'}</i>`;
		
		     if(element) {
		         element.select();
		     }
		}
		function changeHome(){
			
			window.location="./main";
		}
   </script>
   
</body>
</html>