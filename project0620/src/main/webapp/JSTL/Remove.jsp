<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 변수 선언 --> 
<c:set var="scopeVar" value="Page_Value" />
<c:set var="scopeVar" value="Request_Value" scope="request" />
<c:set var="scopeVar" value="Session_Value" scope="session" />
<c:set var="scopeVar" value="Application_Value" scope="application" />
<html>
<head><title>JSTL - remove</title></head>
<body>
    <h4>출력하기</h4>
    <ul>
        <li>scopeVar : ${ scopeVar }</li><!--가장 좁은 영역부터 검색시작됨  -->
        <li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
        <li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
        <li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
    </ul>

    <h4>session 영역에서 삭제하기</h4>
    <c:remove var="scopeVar" scope="session" />
    <ul>
        <li>sessionScope.scopeVar : ${ sessionScope.scopeVar }</li>
    </ul>

    <h4>scope 지정 없이 삭제하기</h4>
    <c:remove var="scopeVar" /><!-- 모든 영역의 변수가 삭제됨, 따로 영역을 지정하지 않으면 -->
    <ul>
        <li>scopeVar : ${ scopeVar }</li>
        <li>requestScope.scopeVar : ${ requestScope.scopeVar }</li>
        <li>applicationScope.scopeVar : ${ applicationScope.scopeVar }</li>
    </ul>
</body>
</html>

