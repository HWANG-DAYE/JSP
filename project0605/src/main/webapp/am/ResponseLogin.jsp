<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("user_id");
String pwd = request.getParameter("user_pwd");
if("abc".equals(id) && "1234".equals(pwd)) {
	response.sendRedirect("./ResponseWelcome.jsp");
}
else {
	request.getRequestDispatcher
	("./ResponseMain.jsp?loginErr=1")
		.forward(request, response);
}
%>
</body>
</html>