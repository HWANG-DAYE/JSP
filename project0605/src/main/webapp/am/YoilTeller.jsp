<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요일정보</title>
</head>
<body>
	
	<%
		String res = "";
		try{
		String y = request.getParameter("y");
		String m = request.getParameter("m");
		String d = request.getParameter("d");
		
		int year = Integer.parseInt(y);
		int month = Integer.parseInt(m);
		int day = Integer.parseInt(d);
		
		LocalDate ld = LocalDate.of(year, month, day);
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일은 E요일입니다.");
		res = ld.format(df);
		}catch(Exception e) {
			res="요일 정보를 입력해주세요.";
		}
	%>
		<h1><%=res %></h1>
</body>
</html>