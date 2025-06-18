<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String rememberId = request.getParameter("rememberId");
	String tmp = request.getParameter("url");
	String url = tmp==null || "".equals(tmp) || "null".equals(tmp)? "Main.jsp" : request.getContextPath()+tmp;
	
	MemberDao dao = new MemberDao(application);
	Member m = dao.select(id);
	if(m!=null && m.getId().equals(id) && m.getPwd().equals(pwd)) {
			if(rememberId != null) {
				Cookie cookie = new Cookie("id", id);
				cookie.setPath(request.getContextPath());
				System.out.println(request.getContextPath());
				response.addCookie(cookie);
			}else{
				Cookie cookie = new Cookie("cid", "");
				cookie.setPath(request.getContextPath());
				cookie.setMaxAge(0); // 쿠키 삭제
				response.addCookie(cookie);
			}
			session.setAttribute("id", id);
			response.sendRedirect(url);
		}else{
			JSFunction.alertBack("아이디와 비밀번호를 확인해주세요.", out);
		}
	
	dao.close();
%>