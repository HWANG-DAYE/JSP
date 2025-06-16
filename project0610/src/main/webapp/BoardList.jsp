<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Board"%>
<%@page import="dao.BoardDao"%>
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
<title>게시판</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 20px;
    }

    .container {
        width: 80%;
        margin: 0 auto;
        background: #fff;
        padding: 30px;
        border-radius: 10px;
    }

    h2 {
        margin-bottom: 30px;
    }

    form[name="searchFrm"] {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
        flex-wrap: wrap;
    }

    #tsearch select,
    #tsearch input[type="text"] {
        padding: 8px;
        margin-right: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    #sBtn {
        padding: 8px 12px;
        background-color: #E0BBE4;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 14px;
        cursor: pointer;
    }

    #sBtn:hover {
        background-color: #D8BFD8;
    }

    #dBtn {
        margin-left: auto;
    }

    #dBtn .btn {
        padding: 8px 16px;
        background-color: #E0BBE4;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }

    #dBtn .btn:hover {
        background-color: #D8BFD8;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table th, table td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }

    table th {
        background-color: #fff;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #fff;
    }

    tr:hover {
        background-color: #f1f1f1;
    }

    .no-posts {
        text-align: center;
        padding: 20px;
        color: #777;
    }
</style>
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
                <input type="text" name="searchWord" id="search" placeholder="검색어를 입력하세요"
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
