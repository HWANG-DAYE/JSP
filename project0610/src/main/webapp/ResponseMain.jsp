<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장 객체 - response</title>
</head>
<body>
	<h2>1. 로그인 폼</h2>
	<%
	String loginErr = request.getParameter("loginErr");
	if(loginErr != null) out.print("로그인 실패");
	%>
	<form action="./ResponseLogin.jsp" method="post" onsubmit="return formCheck(this);">
		아이디 : <input id="id" type="text" name="user_id"><br>
		패스워드 : <input id="pwd" type="text" name="user_pwd"><br>
		<input type="submit" value="로그인">
	</form>
	
	<script>
	function formCheck(frm) {
		let msg='';
		if(frm.id.value.length==0) {
			return false;
		}
		if(frm.pwd.value.length==0) {
			return false;
		}
		return true;
	}
	</script>
</body>
</html>