<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FrontController.jsp</title>
</head>
<body>
    <h3>한 번의 매핑으로 여러 가지 요청 처리하기</h3>
    <!--서블릿에서 request 영역에 저장할 결괏값  -->
    ${ resultValue }
    <ol>
    	<!--클라이언트가 요청한 전체 경로 표시  -->
        <li>URI : ${ uri }</li>
        <li>요청명 : ${ commandStr }</li>
    </ol>    
    <ul>
    	<!--각 페이지로의 바로 가기 링크  -->
        <li><a href="regist.one">회원가입</a></li>
        <li><a href="login.one">로그인</a></li>
        <li><a href="freeboard.one">자유게시판</a></li> 
    </ul>
</body>
</html>


