<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="topnav">
  <a href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#about" class="split">Help</a>
</div>

<div class = "topnav-right">
	<%
		if(session.getAttribute("id") !=null){
	%>
	<a href="./Logout/jsp">logout</a>
	<%
		}
		else{
	%>
	<a href="./Login.jsp">login</a>
	<%
		}
	int sessionTime = session.getMaxInactiveInterval();
	System.out.println(sessionTime);
	%>
</div>
</body>
</html>