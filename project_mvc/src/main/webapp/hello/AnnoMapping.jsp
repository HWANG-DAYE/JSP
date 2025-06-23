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
	<h2>어노테이션으로 매핑하기</h2>
	<strong>${message }</strong>
	<a href="${pageContext.request.contextPath }/AnnoMapping.do">바로가기</a>
</body>
</html>