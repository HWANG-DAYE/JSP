
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie cookie = new Cookie("ELCookie", "JSP");
	cookie.setMaxAge(60*60*24); // 초단위
	response.addCookie(cookie);
	
	// 한글로 쿠키 value를 저장하는 경우
	// 저장할 때 UTF-8로 인코딩, 값을 가져올 때는 UTF-8로 디코딩
	/*  	Cookie cookie2 = new Cookie("ELCookie2", "EL좋아욥");  */
  	Cookie cookie2 = new Cookie("ELCookie2", URLEncoder.encode("EL좋아욥", "UTF-8"));  
	response.addCookie(cookie2);
 	
	if(request.getCookies()!=null){
	 	for(Cookie c : request.getCookies()){
			if(c!=null){
				if("ELCookie2".equals(c.getName())){
					System.out.println(c.getValue());
					String value = URLDecoder.decode(c.getValue(), "utf-8");
					pageContext.setAttribute("value", value);
				}
			}
		} 
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h3>쿠키값 읽기</h3>
    <ul><li>ELCookie값 : ${ cookie.ELCookie.value }</li></ul>
    <ul><li>ELCookie2값 : ${URLDecoder.decode(cookie.ELCookie2.value, "UTF-8") }</li></ul>
    <ul><li>ELCookie2값 : ${cookie.ELCookie2.value }</li></ul>
    <ul><li>ELCookie2값 : ${ value }</li></ul>
    
    <h3>HTTP 헤더 읽기</h3>
    <ul>
        <li>host : ${ header.host }</li>
        <li>host :<%=request.getHeader("host") %></li>
        <li>user-agent : ${ header['user-agent'] }</li>
        <li>user-agent : ${ header.user-agent }</li><!-- 값이 제대로 출력되지 않음 -->
        <li>user-agent :<%=request.getHeader("user-agent") %></li>
        <li>cookie : ${ header.cookie }</li>
        <li>cookie :<%=request.getHeader("cookie") %></li>
    </ul>
    
    <h3>컨텍스트 초기화 매개변수 읽기</h3>
    <ul><li>MySqlDriver :  : ${ initParam.MySqlDriver }</li></ul>
    

    <ul><li>MySqlDriver : <%=application.getInitParameter("MySqlDriver") %></li></ul>

    <h3>컨텍스트 루트 경로 읽기</h3>
    <ul><li>${ pageContext.request.contextPath }</li></ul>
    <ul><li><%=request.getContextPath() %></li></ul>
</body>
</html>