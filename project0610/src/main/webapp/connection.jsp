
<%@page import="dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.BoardDao"%>
<%@page import="java.sql.Date"%>
<%@page import="dto.Member"%>
<%@page import="dao.MemberDao"%>
<%@page import="util.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  	JDBConnect jdbc1 = new JDBConnect();
	jdbc1.close();
	
	String driver = application.getInitParameter("MySqlDriver");
	String url = application.getInitParameter("MySqlURL");
	String id = application.getInitParameter("MySqlId");
	String pwd = application.getInitParameter("MySqlPwd");
	
	out.println(driver+"<br>");
	out.println(url+"<br>");
	out.println(id+"<br>");
	out.println(pwd+"<br>");
	
	JDBConnect jdbc2 = new JDBConnect(driver, url, id, pwd);
	jdbc2.close();
	
	JDBConnect jdbc3 = new JDBConnect(application);
	jdbc3.close();  -->
	
<%	
/* 
	MemberDao dao = new MemberDao(application);
	Member m = new Member("asdf2", "1234", "홍길동", 
			"asdf@naver.com",
			Date.valueOf("2012-12-12"), "insta");
	int res = dao.insert(m);
	out.println(res); 
	
	out.println(dao.select("asdf"));
	*/
	
	
	Map<String, String> map = new HashMap<>();
	map.put("searchWord", "제목2");
	map.put("searchField", "title");
	
	BoardDao dao = new BoardDao(application);
	List<Board> blist = dao.selectList(map);
	out.println(blist);
	
	int n = dao.selectCount(map);
	out.println("개수 : " + n);
	dao.close();
%>
