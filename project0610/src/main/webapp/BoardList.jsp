<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<%
			Map<String, String> map = new HashMap<>();
			BoardDao dao = new BoardDao(application);
			ArrayList<Board> blist = dao.selectList(map);
			int totalcnt = dao.selectCount(map);
			dao.close();
		%>
		<%
		if ( blist.isEmpty()) {
		%>
		<tr>
			<td colspan="5" align="center">
			등록된 게시물이 없습니다.
			</td>
		</tr>
		<%
		}else {
			for(Board b : blist){
		%>

		<tr align="center">
			<td><%= b.getNum() %></td>
			<td><%= b.getTitle() %></td>
			<td><%= b.getId() %></td>
			<td><%= b.getViewCnt() %></td>
			<td><%= b.getPostDate() %></td>
		</tr>
		<%
		} 
		}
		%>
	</table>
</body>
</html>