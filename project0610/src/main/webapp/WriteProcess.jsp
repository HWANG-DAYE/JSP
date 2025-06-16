<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = session.getAttribute("id")+"";
	
	Board b = new Board(title, content, id);
	BoardDao dao = new BoardDao(application);
	int res = dao.insert(b);
	if(res==1) response.sendRedirect("BoardList.jsp");
	else JSFunction.alertBack("잠시 후 다시 시도하세요.", out);
	
	dao.close();
%>