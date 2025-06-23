<%@page import="util.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   	if(session.getAttribute("id")==null) {
   		String url = request.getServletPath();
   		String query = request.getQueryString();
   		if(query!=null) url +="?"+query;
   		JSFunction.alertLocation("로그인 후 이용 부탁드립니다.","Login.jsp?url="+url, out);
   		return;
   	}
   %>
