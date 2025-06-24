<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모장</title>
<style>
	@font-face {
	    font-family: 'NanumSquareNeo-Variable';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
	    font-family: 'NanumSquareNeo-Variable';
		padding:0px;
		margin:0px;
	}
	#memo{
		display:flex;
		flex-direction:column;
		width:80%;
		margin:0 auto;
	}
	#wtitle, #wcontent{
		width:80%;
		margin:0 auto;
	}
	h2{
		width:80%;
		height:50px;
		text-align:Left;
		border-bottom:1px solid #ccc;
		margin:10px auto;
		line-height:50px;
	}
	#wcontent{
		width:80%;
		height:300px;
		margin-bottom:10px;
		resize:none;
		padding:10px;
	}
	input[type='submit']{
		padding:10px;
		background-color:#004D40;
		color:white;
		cursor:pointer;
		margin: 0 auto;
	}
	#wcontainer{
		display:flex;
		flex-direction:column;
		width:80%;
		margin:0 auto;
	}
	#wtitle{
		padding:10px;
	}
	#wcontainer label{
		font-size:17px;
		transform:translateX(115px);
		margin:10px 0;
	}
	#wbtns{
		display:flex;
		justify-content:flex-end;
	}
	#wbtns button{
		margin-right:10px;
		border:1px solid #d3d3d3;
		width:70px;
		height:35px;
		background-color:#fff;
	}
	#wbtns button:hover{
		cursor:pointer;
	}
</style>
</head>
<body>
	<script>
		if(${not empty paam.writeError}){
			alert('작성 실패')
		}
		function formCheck(form){
			if(form.title.value.trim().length == 0){
				alert("제목을 입력하세요.");
				form.title.focus();
				return false;
			}
			if(form.content.value.trim().length==0){
				alert("내용을 입력하세요.");
				form.content.focus();
				return false;
			}
			
			return true;
		}
	
	</script>
	<%@ include file="./Navi.jsp" %>
	<h2>글쓰기</h2>
	<form action='<c:url value="/write"/>' method="post" onsubmit="return formCheck(this)">
		<div id="wcontainer">
			<label for="wtitle">제목</label>
			<input id="wtitle" type="text" name="title" value="${board.title }">
			<label for="wcontent">내용</label>
			<textarea id="wcontent" name="content">${board.content }</textarea>
			<div id="wbtns">		
				<button type="submit">작성완료</button>
				<button type="reset">다시 입력</button>
				<button type="reset" onclick="location.href='list'">목록 보기</button>
			</div>
		</div>
	</form>
	
	
</body>
</html>