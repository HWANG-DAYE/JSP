<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Navi.jsp" %>
<%@ include file="isLogin.jsp" %>

<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = session.getAttribute("id")+"";
	String snum = request.getParameter("num");
	
	int num = Integer.parseInt(snum);
	Board b = new Board(num, title, content, id);
	BoardDao dao = new BoardDao(application);
	int res = dao.update(b);
	if(res==1) JSFunction.alertLocation("수정이 완료되었습니다.", "View.jsp?num="+num, out);
	else JSFunction.alertBack("잠시 후 다시 시도하세요.", out);
%>