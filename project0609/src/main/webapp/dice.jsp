<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주사위 던지기</title>
</head>
<body>
	<%
		int num = (int)(Math.random()*6)+1;
	%>
	<img src="img/dice<%=num%>.png" style="width:100px; height:100px">
	<input id="stop" type="button" onclick="stop()" value="멈춤">
	<input id="start" type="button" onclick="restart()" value="시작" disabled>
<script>
	let img = document.querySelector("img");
	
	function changeImg() {
		console.log("실행")
		let random = parseInt(Math.random()*6+1);
		img.src = "img/dice"+random+".png";
	}
	let stp = setInterval(changeImg, 1);
	function stop(){
		console.log(stp)
		clearInterval(stp);
		start.disabled=false;
		$("#stop").prop("disabled", true);
		console.log(stop.disabled)
	}
	function restart(){
		stp=setIntervel(changeImg, 1);
		start.disabled=true;
		$("#stop").prop("disabled", false);
	}
</script>
</body>
</html>