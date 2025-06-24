<%@page import="util.PageHandler"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dto.Board"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

* {
	padding: 0;
	margin: 0;
	text-align: center;
	font-family: 'NanumSquareNeo-Variable';
}

table {
	width: 80%;
	border-collapse: collapse;
	margin: 0 auto;
	border: none;
}

th {
	color: black;
	border-bottom: 3px solid gray;
	border-top: 3px solid gray;
	height: 50px;
}

td {
	border-bottom: 1px solid #f2f2f2;
	height: 40px;
}

a {
	text-decoration: none;
	color: black;
}

.border-none {
	border: none;
}

h2 {
	width: 80%;
	height: 50px;
	text-align: left;
	margin: 10px auto;
	line-height: 50px;
}

select[name="searchField"] {
	height: 30px;
	width: 50px;
}

#search {
	height: 28px;
	width: 250px;
}

#sBtn {
	height: 30px;
	width: 30px;
	background-color: white;
}

#sBtn:hover, .btn:hover {
	cursor: pointer;
}

#tsearch {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
}

.btn {
	border: 1px solid #d3d3d3;
	width: 70px;
	height: 35px;
	background-color: #fff;
	line-height: 30px;
	margin-top: 10px;
}

#dBtn {
	width: 64%;
	display: flex;
	justify-content: flex-end;
}

#page {
	margin: 10px;
	position: absolute;
	top: 270px;
	left: 36%;
	width: 319px;
}

.check {
	color: red;
	border: 1px solid #e5e7ea;
}

#blist {
	
}

#lcontent {
	width: 80%;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	position: relative;
}

#page a {
	display: inline-block;
	width: 30px;
	height: 30px;
	border-radius: 4px;
	line-height: 30px;
}

#page a:hover {
	background-color: #e5e7ea;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://kit.fontawesome.com/fd1f3e5f64.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="./Navi.jsp" />
	<!-- 공통 링크 -->

	<h2>회원제 게시판</h2>
	<!-- 검색폼 -->
	<form name="searchFrm" method="get" onsubmit="return formcheck(this)">
		<table class="border-none" id="tsearch">
			<tr class="border-none">
				<!--     	<td id="tdlike">
    		<button id="like" type="button" onclick="flike()">조회수순</button>
    	</td> -->
				<td class="border-none"><select name="searchField">
						<option value="title"
							${empty param.searchField || "title" eq param.searchField ? "selected" : "" }>제목</option>
						<option value="content"
							${param.searchField eq "content" ? "selected" : "" }>내용</option>
				</select> <input type="text" name="searchWord" id="search"
					value="${not empty param.searchWord ? param.searchWord : '' }">
					<button
						class="fa-lg fa-sharp fa-solid fa-magnifying-glass border-none"
						id="sBtn"></button></td>
			</tr>
		</table>
	</form>


	<!-- 게시물 목록 테이블(표) -->
	<div id="lcontent">
		<table id="bList">
			<!-- 각 칼럼의 이름 -->
			<tr>
				<th width="10%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="10%">조회수</th>
				<th width="15%">작성일</th>
			</tr>
			<!-- 목록의 내용 -->
			<c:choose>
				<c:when test="${empty blist }">
					<tr>
						<td colspan="5" align="center">등록된 게시물이 없습니다^^*</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${blist }" var="dto">
						<tr>
							<td>${dto.num }</td>
							<!--게시물 번호-->
							<td>
								<!--제목(+ 하이퍼링크)--> <a
								href="view?num=${dto.num }&page=${ph.page }">${dto.title }</a>
							</td>
							<td>${dto.id }</td>
							<!--작성자 아이디-->
							<td>${dto.viewCnt }</td>
							<!--조회수-->
							<td>${dto.postDate }</td>
							<!--작성일-->
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div>
		<c:if test="${ph.showPrev }">
			<a href='<c:url value="list?page=${ph.beginPage-1 }"/>'>&lt;</a>
		</c:if>
		<c:forEach begin="${ph.beginPage }" end="${ph.endPage }" var="i">
			<c:choose>
				<c:when test="${ph.page eq i }">
					<a class='check' href='<c:url value="list?page=${i }"/>'>&nbsp;${i } </a>
				</c:when>
				<c:otherwise>
					<a href='<c:url value="list?page=${i }"/>'>&nbsp;${i } </a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${ph.showNext }">
			<a href='<c:url value="list?page=${ph.endPage+1 }"/>'>&gt;</a>
		</c:if>
	</div>
	<div id="dBtn">
		<button class="btn" type="button" onclick="location.href='write'">글쓰기</button>
	</div>
	<script>
		function formcheck(frm) {
			if (frm.searchWord.value.trim().length == 0) {
				alert("검색어를 입력해주세요");
				frm.searchWord.focus();
				return false;
			}

		}
	</script>
</body>
</html>