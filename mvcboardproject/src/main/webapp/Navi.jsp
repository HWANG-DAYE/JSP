<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="navi2.css">
<script src="https://kit.fontawesome.com/fd1f3e5f64.js" crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
</style>
<body>
<div id="navi">
	<div id="title">
		<div id="log">
			<a href='<c:url value="/main"/>' id="logo"><i class="fa-solid fa-baseball" style="color: #FF8C00;"></i>&nbsp; EAGLES</a>
		</div>
		<div id="text">
		</div>
	</div>
	<!-- The navigation menu -->
	<div class="topnav">
	  <a class="active" href="#HTML">HTML</a>
	  <a href="#css">CSS</a>
	  <a href="#js">JAVASCRIPT</a>
	  <a href="#jq">jQuery</a>
	  <a href='<c:url value="list"/>'>게시판</a>
	  <div class="topnav-right">
	  	<c:choose>
	  		<c:when test="${not empty sessionScope.id }">
	  			<a href='<c:url value="/logout"/>'>로그아웃</a>
	  		</c:when>
	  		<c:otherwise>
	  			<a href='<c:url value="/login"/>'>로그인</a>
	  		</c:otherwise>
	  	</c:choose>
	  </div>
	</div>
</div>
</body>
</html>