<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String rememberId = request.getParameter("rememberId");
	
	MemberDao dao = new MemberDao(application);
	Member m = dao.select(id);
	if(m!=null) {
		if(m.getId().equals(id) && m.getPwd().equals(pwd)) {
			if(rememberId != null) {
				Cookie cookie = new Cookie("id", id);
				cookie.setPath(request.getContextPath());
				System.out.println(request.getContextPath());
				response.addCookie(cookie);
			}else{
				Cookie cookie = new Cookie("id", "");
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(0); // 쿠키 삭제
				response.addCookie(cookie);
			}
			session.setAttribute("id", id);
			response.sendRedirect("Main.jsp");
		}else{
			JSFunction.alertBack("아이디와 비밀번호를 확인해주세요.", out);
		}
	}else{
		JSFunction.alertBack("아이디와 비밀번호를 확인해주세요.", out);
	}
	
	dao.close();
%>