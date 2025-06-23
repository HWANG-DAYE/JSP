<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
	long creationTime = session.getCreationTime();
	String creationTimeStr = sdf.format(new Date(creationTime));
	long lastTime = session.getLastAccessedTime();
	String lastTimeStr = sdf.format(new Date(lastTime));
%>
<html>
<head><title>Session</title></head>
<body>
	<h2>Session 설정 확인</h2>
	<ul>
		<li>세션 유지 시간 : <%= session.getMaxInactiveInterval() %></li>
		<li>세션 아이디 : <%= session.getId() %></li>
		<li>최초 요청 시각 : <%= creationTimeStr %></li>
		<li>마지막 요청 시각 : <%= lastTimeStr %></li>
	</ul>
</body>
</html>