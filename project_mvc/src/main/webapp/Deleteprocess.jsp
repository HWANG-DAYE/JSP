<%@page import="util.JSFunction"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao(application);
	int res = dao.delete(id);
	if(res==1) JSFunction.alertLocation("정상적으로 삭제되었습니다.", "memberList.jsp", out);
%>