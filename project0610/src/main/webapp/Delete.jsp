<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="isLogin.jsp" %>
<%
	String snum = request.getParameter("num");
	int num = Integer.parseInt(snum);
	
	String id = session.getAttribute("id")+"";
	Board b = new Board();
	b.setNum(num);
	b.setId(id);
	BoardDao dao = new BoardDao(application);
	int res = dao.delete(b);
	if(res==1) JSFunction.alertLocation("정상적으로 삭제되었습니다.","BoardList.jsp", out);
	else JSFunction.alertBack("잠시 후 다시 시도하세요.", out);
			
%>