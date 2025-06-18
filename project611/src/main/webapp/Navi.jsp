<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="navi2.css">
<script src="https://kit.fontawesome.com/fd1f3e5f64.js" crossorigin="anonymous"></script>
<style>
    /* 전체 네비게이션 배경 */
    #navi {
        position: sticky;
        top: 0;
        background-color: #f5f5f5;
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        z-index: 1000;
    }

    /* 상단 타이틀 */
    #title {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 30px;
        background-color: #ffffff;
    }

    #logo {
        font-size: 30px;
        font-weight: bold;
        color: #000;
        text-decoration: none;
    }

    #logo i {
        margin-right: 8px;
    }

    /* 네비게이션 바 */
    .topnav {
        overflow: hidden;
        background-color: #E0BBE4;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
    }

    .topnav a {
        float: left;
        display: block;
        color: #ffffff;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
        font-size: 16px;
        transition: background-color 0.3s ease;
    }

    .topnav a:hover {
        background-color: #D8BFD8;
        color: #fff;
    }

    .topnav a.active {
        background-color: #ba9cc7;
        color: white;
        font-weight: bold;
    }

    /* 로그인/회원가입은 오른쪽 정렬 */
    .topnav-right {
        display: flex;
        gap: 10px;
    }
</style>
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
	  <a href="./BoardList.jsp">게시판</a>
	  <div class="topnav-right">
			<%
				if(session.getAttribute("id")!=null){%>
					<a href="./Logout.jsp">로그아웃</a>
				<% }else{%>
					<a href="./Login.jsp">로그인</a>
				<%} %>
				<a href="./RegisterForm.jsp">회원가입</a>
			
	  </div>
	</div>
</div>
</body>
</html>