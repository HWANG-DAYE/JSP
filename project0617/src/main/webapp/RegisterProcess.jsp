<%@page import="utill.JSFunction"%>
<%@page import="dao.MemberDao"%>
<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	
	String[] snss = request.getParameterValues("sns");
	String sns = null;
	if(snss != null) sns = String.join(",", snss);
	
	java.sql.Date b = null;
	String birth = request.getParameter("birth");
	if(birth!=null && !"".equals(birth)) b = java.sql.Date.valueOf(birth);
	
	Member m = new Member(id, pwd, name, email, b, sns);
	
	MemberDao dao = new MemberDao(application);
	int res = dao.insert(m);
	if(res==1) JSFunction.alertLocation("회원가입이 완료", "Login.jsp", out);
	else JSFunction.alertBack("잠시 후 다시 시도하십시오.", out);
	
	dao.close();
	
%>