<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충청북도 밥맛 좋은 집</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>

/* $(documnet).ready(function(){}) */
	$(function() {
	    $('#searchBtn').click(function() {
	   		let searchWrd = '';
	   		let startNum = 1;
	   		console.log(searchWrd)
	      $.ajax({
	        url : "https://apis.data.go.kr/6430000/goodRestaService1/getGoodResta1?serviceKey=vEkltMi8qRjyVDR8gI%2FgDlf6SA0ZgPoOGCCeZ5aEwRWZQk6fs%2BYPd0NIC3an4YgoO3AJ4b5SPG%2FsPlrM%2BOxZvQ%3D%3D&currentPage=1&perPage=10",  // 요청 URL
			type : "get",                  // HTTP 메서드
	        dataType : "json",      // 응답 데이터 형식
	        success : sucFuncJson,  // 요청 성공 시 호출할 메서드 설정
	        error : errFunc         // 요청 실패 시 호출할 메서드 설정
	      });
	    });
	});
	// 검색 성공 시 결과를 화면에 뿌려줍니다.
	function sucFuncJson(d) {
		console.log(d.header.totalRows)
		let str = ""
		$.each(d.body, function(index,value) {
			str +="<ul>";
			str +="<li>"+value.BSSH_NM+"</li>";
			str +="<li>"+value.SIGUN_NM+" "+value.DETAIL_ADRES +"</li>";
			str +="<li>"+value.RM+"</li>";
			str +="</ul><hr>"
		})
		$("#searchResult").html(str);
	    
	}
	// 실패 시 경고창을 띄워줍니다.
	function errFunc(request, status, error){ alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error) }
</script>

<style>
    ul{border:2px #cccccc solid;}
</style>
</head>
<body>
<div>
    <div>
        <form id="searchFrm">
            한 페이지에 10개씩 출력됨 <br />
            <select id="startNum">
                <option value="1">1페이지</option>
                <option value="2">2페이지</option>
                <option value="3">3페이지</option>
                <option value="4">4페이지</option>
                <option value="5">5페이지</option>
            </select>
            <input type="text" id="keyword" placeholder="검색어를 입력하세요." />
            <button type="button" id="searchBtn">검색 요청</button>
        </form>
    </div>
    <div class="row" id="searchResult">
        여기에 검색 결과가 출력됩니다.
    </div>
</div>

</body>
</html>