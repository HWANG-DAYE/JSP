<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

%>
<ul>
	<li>아이디 : <%= id %> </li>
	<li>비밀번호 : <%= pwd %> </li>
</ul>
</body>
</html>