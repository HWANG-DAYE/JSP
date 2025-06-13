<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
ul {
list-style-type: none
}
</style>
<body>
	<form>
		<ul>
			 <li>
		         <label for="title">제목</label>
		         <input type="text" id="title" required autofocus>
		     </li>
		     <li>
		         <label for="content">내용</label>
		         <textarea id="content" required></textarea>
		     </li>
		</ul>
	</form>
	
<div>
	<button type="submit" class="button2">작성완료</button>
    <button type="reset" class="button2">다시 입력</button>
    <button type="reset" class="button2">목록 보기</button>
</div>
</body>
</html>