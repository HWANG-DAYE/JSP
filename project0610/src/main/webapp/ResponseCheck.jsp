<%@page import="util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String rememberId = request.getParameter("rememberId");
	
	out.println(id + " / " + pwd + " / " + rememberId);
	
	if("asdf".equals(id) && "1234".equals(pwd)) {
		if("on".equals(rememberId)) {
			Cookie cookie = new Cookie("cid", id);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("cid", "");
			cookie.setMaxAge(0);
			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);
		}
		JSFunction.alertLocation("로그인되었습니다.", "Main.jsp", out);
	}else {
		//request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
		JSFunction.alertBack("아이디와 비밀번호를 확인해주세요.", out);
	}
		
%>