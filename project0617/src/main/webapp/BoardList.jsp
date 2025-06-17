<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Navi.jsp" %>
<%
	BoardDao dao = new BoardDao(application);
	Map<String, String> map = new HashMap<>();
	String searchWord = request.getParameter("searchWord");
	String searchField = request.getParameter("searchField");
	if(searchWord != null) {
		map.put("searchWord", searchWord);
		map.put("searchField", searchField);
	}
	ArrayList<Board> blist = dao.selectList(map);
	int totalcnt = dao.selectCount(map);
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="css/boardlist.css">
</head>
<body>
	<div class="container">
		<h2>게시판 목록</h2>
		<form name="searchFrm" method="get" onsubmit="return formcheck(this)">
			<div id="tsearch">
				<select name="searchField">
					<option value="title" <%= searchField == null || "title".equals(searchField) ? "selected" : "" %>>제목</option>
					<option value="content" <%= "content".equals(searchField) ? "selected" : "" %>>내용</option>
				</select>
			<input type="text" name="searchWord" id="search" placeholder="검색어를 입력하세요."
                    value="<%= searchWord != null ? searchWord : "" %>">
                <button type="submit" id="sBtn">검색</button>
            </div>
            <div id="dBtn">
                <button class="btn" type="button" onclick="location.href='Write.jsp';">글쓰기</button>
            </div>
        </form>

        <table>
            <tr>
                <th width="10%">번호</th>
                <th width="50%">제목</th>
                <th width="15%">작성자</th>
                <th width="10%">조회수</th>
                <th width="15%">작성일</th>
            </tr>

            <%
            if (blist.isEmpty()) {
            %>
            <tr>
                <td colspan="5" class="no-posts">등록된 게시물이 없습니다.</td>
            </tr>
            <%
            } else {
                for (Board b : blist) {
            %>
            <tr>
                <td><%= b.getNum() %></td>
                <td>
                	<a href="View.jsp?num=<%=b.getNum()%>"><%= b.getTitle() %></a>
                </td>
                <td><%= b.getId() %></td>
                <td><%= b.getViewCnt() %></td>
                <%
                	Date date = new Date();
                	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                	String tday = sdf.format(date);
                	String regDate = sdf.format(b.getPostDate());
                	if(tday.equals(regDate)) {
                		regDate = new SimpleDateFormat("HH:mm").format(b.getPostDate());
                	}
                %>
                <td><%= regDate %></td>
            </tr>
            <%
                }
            }
            %>
        </table>
    </div>

    <script>
        function formcheck(frm) {
            if (frm.searchWord.value.trim().length == 0) {
                alert("검색어를 입력해주세요.");
                frm.searchWord.focus();
                return false;
            }
        }
    </script>
</body>
</html>
