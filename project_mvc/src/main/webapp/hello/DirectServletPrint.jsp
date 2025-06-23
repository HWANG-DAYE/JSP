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
	<h2>web.xml 매핑 후 servlet에서 직접 출력하기</h2>
<%-- 	<form method="post" action="${pageContext.request.contextPath }/DirectServletPrint.do">--%>	
	<form method="post" action='<c:url value="/DirectServletPrint.do" />'>
	<!-- <form method="post" action="../DirectServletPrint.do"> -->
		<input type="submit" value="바로가기">
	</form>
</body>
</html>