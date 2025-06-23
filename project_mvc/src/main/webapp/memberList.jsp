<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao"%>
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
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>생일</th>
			<th>이름</th>
			<th>sns</th>
			<th>등록날짜</th>
			<th>삭제</th>
		</tr>
		<%
			MemberDao dao = new MemberDao(application);
			ArrayList<Member> mlist = dao.selectList();
			
			for(Member m : mlist){
		%>
			<tr>
				<td><%= m.getId() %></td>
				<td><%= m.getPwd() %></td>
				<td><%= m.getName() %></td>
				<td><%= m.getEmail() %></td>
				<td><%= m.getBirth() %></td>
				<td><%= m.getSns() %></td>
				<td><%= m.getReg_date() %></td>
				<td><button type="button" data-id="<%=m.getId()%>" onclick="deleteId(this)">삭제</button></td>
				<td><button type="button" data-id="<%=m.getId()%>" onclick="location.href=ModifyForm.jsp?id=<%=m.getId()%>">수정</button></td>
			</tr>
		<%} %>
	</table>
	<script>
		function deleteId(btn){
			let id = btn.getAttribute("data-id");
			let check = confirm("정말로 삭제하시겠습니까?");
			if(check){
				location.href="Deleteprocess.jsp?="+id;
			}
		}
	</script>
</body>
</html>