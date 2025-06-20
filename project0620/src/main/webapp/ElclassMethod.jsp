<%@page import="etc.MyElClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyElClass myClass = new MyElClass();
	pageContext.setAttribute("myClass", myClass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 - 메서드 호출</title>
</head>
<body>
	<h3>영역에 저장 후 메서드 호출하기</h3>
	001225-300000 => ${ myClass.getGender("001225-300000")}<br>
	001225-200000 => ${ myClass.getGender("001225-200000")}<br>
	getter 호출 => ${ myClass.gender }
	
	<h3>클래스명을 통한 정적 메서드 호출하기</h3>
	${ MyElClass.showGugudan(7) }
</body>
</html>