
<%@page import="dto.Board"%>
<%@page import="util.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<style>
	#vtable{
		margin:0 auto;
		border-collapse: collapse;
	}
	#vtitle{
		width:80%;
		height:50px;
		text-align:Left;
		border-bottom:1px solid #ccc;
		margin:10px auto;
		line-height:50px;
	}
	
	#vtable td, #vtable th{
		height:30px;
	}
	#board_title{
		font-size:35px;
		width:80%;
		margin:0 auto;
		text-align:left;
	}
	#writer{
		font-color:#ccc;
		font-weight:bold;
		margin:8px 0;
	}
	#vinfo{
		width:80%;
		margin:10px auto;
	}
	
	#vcontent{
		width:79%;
		height:400px;
		margin:0 auto;
		border:1px solid #ccc;
		border-radius : 6px;
		padding:10px;
	}
	#btns{
		display:flex;
		width:80%;
		margin:10px auto;
		justify-content:flex-end;
	}
	#btns button{
		margin-right:10px;
		border:1px solid #d3d3d3;
		width:70px;
		height:35px;
		background-color:#fff;
	}
	#btns button:hover{
		cursor:pointer;
	}
</style>
</head>
<body>
<jsp:include page="./Navi.jsp" />
<h4 id="vtitle">상세 보기(View)</h4>
<form name="writeFrm" >
    <input type="hidden" name="num" value="${dto.num }"  id="num"/>  <!-- 공통 링크 -->
    <h3 id="board_title">${dto.title }</h3>
	<div id="vinfo">
		<div id="writer">${dto.name }</div>
		<span>${dto.postDate }</span>
		<span>조회 ${dto.viewCnt }</span>
	</div>
	<div id="vcontent">
		${dto.strcontent }
	</div>
	<div id="btns">
	<c:if test="${not empty dto.id && dto.id eq sessionScope.id }">
	<button type="button" onclick="location.href='edit?num=${dto.num}'">수정하기</button>
    <button type="button" onclick="deletePost()">삭제하기</button>
	</c:if>
        <button type="button" onclick="location.href='list'">목록 보기</button>
        <c:url value="/list2" var="url">
        	<c:if test="${not empty param.searchWord }">
        		<c:param name = "searchField"  value="${param.searchField }" />
        		<c:param name = "searchWord" value="${param.searchWord }" />
        	</c:if>
			<c:param name="page" value="${empty param.page ? 1 : param.page }" />
        </c:url>
        <button type="button" onclick="location.href='${url}'">목록 보기2</button>
     </div>
</form>
<script>
	function deletePost(){
		let check = confirm("정말로 삭제하시겠습니까?");
		if(!check) return;
		let num = document.viewFrm;	//document.querySelector("#")랑 같은 의미 document.name속성
		frm.method = "post";
		frm.action = "delete";
		frm.submit();
	}
</script>
</body>
</html>