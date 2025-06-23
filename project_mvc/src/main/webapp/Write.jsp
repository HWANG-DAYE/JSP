<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #fff;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 60%;
        margin: 50px auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
    }

    h2 {
        margin-bottom: 30px;
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        margin-bottom: 20px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
    }

    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    textarea {
        resize: vertical;
        height: 150px;
    }

    .button-group {
        text-align: right;
        margin-top: 20px;
    }

    .button2 {
        padding: 10px 20px;
        margin-left: 10px;
        background-color: #E0BBE4;
        border: none;
        border-radius: 4px;
        color: white;
        cursor: pointer;
        font-size: 14px;
    }

    .button2:hover {
        background-color: #D8BFD8;
    }
</style>
</head>
<body>
	<%@ include file="isLogin.jsp" %>
	<script>
		function formCheck(form) {
			console.log(form.title.value);
			console.lot(form.wtitle.value);
			if(form.title.value.trim()=="") {
				alert("제목을 입력하세요.");
				form.title.focus();
				return false;
			}
			if(form.content.value.trim()== ""){
				alert("내용을 입력하세요.");
				form.content.focus();
				return false;
			}
			return true;
		}
	</script>
	<%@include file="Navi.jsp" %>
    <div class="container">
        <h2>글쓰기</h2>
        <form action="WriteProcess.jsp" method="post" onsubmit="return formCheck(this)">
            <ul>
                <li>
                    <label for="wtitle">제목</label>
                    <input type="text" id="wtitle" name="title" required autofocus>
                </li>
                <li>
                    <label for="wcontent">내용</label>
                    <textarea id="wcontent" name="content" required></textarea>
                </li>
            </ul>
            <div class="button-group">
                <button type="submit" class="button2">작성완료</button>
                <button type="reset" class="button2">다시 입력</button>
                <button type="reset" class="button2" onclick="location.href='BoardList.jsp'">목록 보기</button>
            </div>
        </form>
    </div>
</body>
</html>
