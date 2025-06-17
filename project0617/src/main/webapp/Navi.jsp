<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="navi2.css">
<script src="https://kit.fontawesome.com/fd1f3e5f64.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/navi.css">
<body>
<div id="navi">
	<div id="title">
		<div id="log">
			<a href="index.jsp" id="logo"><i class="fa-regular fa-file-code" style="color: #000;"></i>JSP study</a>
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
	  <a href="BoardList.jsp">게시판</a>
	  <div class="topnav-right">
			<%
				if(session.getAttribute("id")!=null){%>
					<a href="Logout.jsp">로그아웃</a>
				<% }else{%>
					<a href="Login.jsp">로그인</a>
				<%} %>
				<a href="RegisterForm.jsp">회원가입</a>
			
	  </div>
	</div>
</div>
</body>
</html>