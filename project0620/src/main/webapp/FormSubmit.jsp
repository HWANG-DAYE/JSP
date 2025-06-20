<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표헌언어 - 폼값 처리</title>
</head>
<body>
    <form name="frm" method="post" action="FormResult.jsp">
        이름 : <input type="text" name="name" ><br>
        성별 : <input type="radio" name="gender" value="Man" >남자
              <input type="radio" name="gender" value="Woman">여자<br>
        학력 :
            <select name="grade">
                <option value="ele">초</option>
                <option value="mid">중</option>
                <option value="high">고</option>
                <option value="uni">대</option>
     
            </select><br>
        관심 사항 : 
            <input type="checkbox" name="inter" value="pol">정치
            <input type="checkbox" name="inter" value="eco">경제
            <input type="checkbox" name="inter" value="ent">연예
            <input type="checkbox" name="inter" value="spo">운동<br>
        <input type="submit" value="전송하기">
    </form>
    <h3>EL 폼값 전송 받기</h3>
    <ul>
    	<li>이름 : ${param.name}</li>
    	<li>성별 : ${param.gender}</li>
    	<li>학력 : ${param.grade}</li>
    	<li>관심사항 : ${param.inter}</li>
    	<li>관심사항 : ${paramValue.inter[0]}</li>
    	<li>관심사항 : ${paramValue.inter[1]}</li>
    	<li>관심사항 : ${paramValue.inter[2]}</li>
    	<li>관심사항 : ${paramValue.inter[3]}</li>
    </ul>
</body>
</html>