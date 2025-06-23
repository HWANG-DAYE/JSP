<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp" %>
<%@include file="Navi.jsp" %>

<%
	String snum = request.getParameter("num");
	int num = Integer.parseInt(snum);

	if(snum==null) {
		JSFunction.alertLocation("잘못된 접근입니다.", "Main.jsp", out);
		return;
	}
	BoardDao dao = new BoardDao(application);
	Board b = dao.select(num);
	String sessionId = session.getAttribute("id")+"";
	if(!sessionId.equals(b.getId())) {
		JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
		return;
	}
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
    }

    #wcontainer {
        width: 60%;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
    }

    h2 {
        margin-bottom: 30px;
    }

    label {
        display: block;
        font-weight: bold;
        margin: 15px 0 8px;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    textarea {
        resize: vertical;
        height: 150px;
    }

    #wbtns {
        text-align: right;
        margin-top: 20px;
    }

    #wbtns button {
        padding: 10px 20px;
        margin-left: 10px;
        background-color: #E0BBE4;
        border: none;
        border-radius: 4px;
        color: white;
        cursor: pointer;
        font-size: 14px;
    }

    #wbtns button:hover {
        background-color: #D8BFD8;
    }
</style>
</head>
<body>
	<script></script>
		<h2>회원제 게시판 - 수정하기(Edit)</h2>
		<form action="EditProcess.jsp" method="post" onsubmit="return formCheck">
			<div id="wcontainer">
				<input type="hidden" name="num" value="<%=b.getNum() %>"/>
				<label for="wtitle">제목</label>
				<input id="wtitle" type="text" name="title" value="<%=b.getTitle() %>" />
				<label for="wcontent">내용</label>
				<textarea id="wcontent" name="content"><%=b.getContent() %></textarea>
				<div id="wbtns">
					<button type="submit">작성완료</button>
					<button type="reset">다시 입력</button>
					<button type="reset" onclick="location.href='BoardList.jsp'">목록 보기</button>
					
				</div>
			</div>
	
</body>
</html>