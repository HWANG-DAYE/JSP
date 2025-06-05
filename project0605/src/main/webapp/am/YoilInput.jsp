<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요일 입력기</title>
</head>
<body>
	<h2> 요일 입력기</h2>
	<form action=" /YoilTeller.jsp" method="post">
	<div id="input">
		<label>연 : <input type="text" name="y"></label>
		<label>월 : <input type="text" name="m"></label>
		<label>일 : <input type="text" name="d"></label>	
	</div>
	<div id="btn">
		<input type="submit" value="입력">
	</div>
	</form>
</body>
</html>