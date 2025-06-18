<%@page import="util.JSFunction"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp" %>
<%@include file="Navi.jsp" %>
    <%
	    String pageStr = request.getParameter("page");
		int pageNum  = pageStr == null ? 1 : Integer.parseInt(pageStr);
	
    	BoardDao dao = new BoardDao(application);
		String snum = request.getParameter("num");
		int num = Integer.parseInt(snum);
		
    	Board b = null;
    	if(snum==null) {
    		JSFunction.alertLocation("잘못된 접근입니다.","Main.jsp", out);
    		return;
    	}
    	int res = dao.updateViewCnt(num);
    	if(res==1){
    		b = dao.select(num);
    		System.out.println(b);
    	}else {
    		JSFunction.alertLocation("잠시 후 다시 시도하세요.", "Main.jsp", out);
    		return;
    	}
    	dao.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
    }

    form[name="writeFrm"] {
        width: 60%;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
    }

    #board_title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    #vinfo {
        font-size: 14px;
        color: #666;
        margin-bottom: 20px;
        display: flex;
        gap: 10px;
    }

    #writer {
        font-weight: bold;
    }

    #vcontent {
        font-size: 16px;
        line-height: 1.6;
        border-top: 1px solid #ccc;
        padding-top: 20px;
        margin-bottom: 30px;
    }

    #btns {
        text-align: right;
    }

    #btns button {
        padding: 10px 20px;
        margin-left: 10px;
        background-color: #E0BBE4;
        border: none;
        border-radius: 4px;
        color: white;
        cursor: pointer;
        font-size: 14px;
    }

    #btns button:hover {
        background-color: #D8BFD8;
    }
</style>
</head>
<body>
<h4 id="vtitle">상세보기(view)</h4>

<form name="writeFrm">
	<input type="hidden" name="num" value="<%=num %>">
	<h3 id="board_title"><%=b.getTitle() %></h3>
	<div id="vinfo">
		<div id="writer"><%=b.getName() %></div>
		<span><%=b.getPostDate() %></span>
		<span>조회 <%=b.getViewCnt() %></span>
	</div>
	<div id="vcontent">
		<%=b.getContent().replace("\r\n", "<br>") %>
	</div>
	<div id="btns">
	<%
		if(b.getId().equals(session.getAttribute("id")+"")){
	%>
		<button type="button"
				onclick="location.href='Edit.jsp?num=<%= b.getNum() %>'">
				수정하기</button>
		<button type="button" onclick="deletePost()">삭제하기</button>
		<%} %>
		<button type="button" onclick="location.href='BoardList.jsp?page=<%=pageNum%>'">
			목록보기
		</button>
	</div>

</form>
<script>
	function deletePost(){
		let check = confirm("정말로 삭제하시겠습니까?")
		let num = document.writeFrm.num.value
		if(check) location.href='Delete.jsp?num='+num;
	}
</script>
</body>
</html>