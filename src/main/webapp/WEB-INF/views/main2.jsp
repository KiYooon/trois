<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/main2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function() {
	$("#myroom").on("click", function(){
// 		alert("ㅗ");
    	location.href = "myroom";
    });
	
	$("#logout").on("click", function(){
    	location.href = "logout";
    });
	
	$("#headimg").on("click", function(){
		location.href = "main2";
	});
});
</script>
</head>
<body>
	<div class="container">
<header>
    <div class="head-1">
        <img
			src="resources/logo/logo.png"
			id="headimg">
    </div>
    <div class="head-2">
        <h1>Trois</h1>
    </div>
    <div class="head-3"> 
        
        <button type="button" id="myroom">마이룸</button>
        <button type="button" id="logout">로그아웃</button>
    </div>
</header>
    <div class="body">
        <div class="body-1">   
        </div>
        
        <div class="body-2">

            <div class="body-2-1">
				<img
					src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory&fname=http%3A%2F%2Fcfile2.uf.tistory.com%2Fimage%2F164E27194A445D4645B738"
					class="img-top img-left">
			</div>
			<div class="body-2-1">
				<img
					src="http://cfs12.blog.daum.net/image/25/blog/2008/06/27/11/02/48644a1713204&filename=%EC%9D%B8%ED%85%8C0.jpg"
					class="img-top img-right">
			</div>
			<div class="body-2-1">
				<img
					src="http://cfile23.uf.tistory.com/image/163E96274BA4292175965B"
					class="img-bottom img-left">
			</div>
			<div class="body-2-1">
				<img
					src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXDbq_hrvlODtIieMLMPTSSG1PfSkuxL05GEj1TtFt2R06Po-w"
					class="img-bottom img-right">
			</div>
            <div class="body-2-3">
                <div>
                    <div class="body-2-3-1"></div>
                    <div class="body-2-3-2"></div>
                </div>
            </div>
        </div>
        
        <div class="body-1">
        </div>

    </div>
    <div class="body-3">
        <button type="button" id="start" onclick="location.href = 'work';">시작</button>
    </div>
    <div class="body-4">
        <footer>
        	<p id=fp>상호 : Trois(주)<br> 장소 : 서울특별시 금천구 대륭테크노타운 3차 811호<br> 대표이사
				: 박기윤 김원중 최승환 김보경 공은비 <br> Copyright (c) 2017 Trois all rights
				reserved. Trois는 안전하게 운영중입니다.</p>
        </footer>
    </div>



</div>
	
</body>
</html>