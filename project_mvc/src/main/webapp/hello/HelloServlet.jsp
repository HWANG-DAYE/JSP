<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml에 매핑 후 jsp에서 출력하게</h2>
	<strong>${requestScope.message }</strong>
	<a href="<c:url value='./HelloServlet.do' />">바로가기</a>
</body>
</html>