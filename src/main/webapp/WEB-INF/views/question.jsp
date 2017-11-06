<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/trois/resources/css/question.css">
<title>question</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<Script>
	$(document).ready(function(){
		var title = "";
		var contents = "";
		
		$("#inputText2").keydown(function(){
			var numChar = $(this).val().length;
			var maxNum = 50;
			var charRemain = maxNum - numChar;
			$("#textSpan > em").text(charRemain);
			
				if(charRemain < 0){
					$("#submitBtn").prop("disabled", true);
				}else {
					$("#submitBtn").prop("disabled", false);
				}
		});
		
		$("#submitBtn").off().on("click", function(){
			initData();
			createqna();
		});
		
		$("#logout").on("click", function(){
	    	location.href = "logout";
	    });
		
		$("#logo").on("click", function(){
			location.href = "main2";
		});
		
		function createqna(){
			$("#inputBox1").empty(); 
			$("#inputBox2").empty();
			$("#submit").empty();
			
   			$("#inputBox1").append("<p id='reqText1'>" + title + "</p>");
  			$("#inputBox2").append("<p id='reqText2'>" + contents + "</p>");
  			$('#inputBox2').html($('#reqText2').html().replace(/\n/g,"<br>"));
  			$("#submit").append('<button type="button" id="submitBtn2">돌아가기</button>');
  			
  			$("#submitBtn2").off().on("click", function(){
  				var url = "myroom"; 
  				$(location).attr('href',url);
  			});
		}
		
		function initData(){
			
			title = $("#inputText1").val();
			contents = $("#inputText2").val();
			
			if(($("#inputText1").val() == "") || ($("#inputText2").val() == "")){
				alert("내용을 입력하세요!");
				location.reload(true);
			}
			
			$.ajax({
				type:"post", // post 방식으로 통신 요청
				url:"questionRead", // test에서 만든 URL 호출
				data:{"contents": contents, "title": title} // 파라메터로 사용할 변수 값 객체 넣기
				}).done(function(d){ // 비동기식 데이터 가져오기
			var result = JSON.parse(d); // 가져온 데이터를 JSON 형식으로 형변환 하여 result 변수에 담기.
			});
		}
});
</Script>
</head>
<body>
<div class="trois">
    <div class="header">
        <div class="header-left">
            <img id="logo" src="resources/logo/logo.png">
        </div>
        <div class="header-center">
            <h1>Trois</h1>
        </div>
        <div class="header-right">
            <button id="logout">로그아웃</button>
        </div>
    </div>
    <div class="center">
        <div class="center-left">
            <ul>
            	<li><a href="myroom">마이룸</a></li>
				<li><a href="question" style="text-decoration: underline;">문의하기</a></li>
				<li><a href="myqna">나의문의내역</a></li>
				<li><a href="modify">회원정보수정/탈퇴</a></li>
				<li><a href="work">작업시작하기</a></li>
            </ul>
        </div>
        <div class="center-right">
            <div id="mainContent">
                <form action="" method="post">
                    <div id="mainBox">
                            <div id="subBox1">
                                <div id="textBox1">
                                    <p>제목</p>
                                </div>
                                <div id="inputBox1">
                                    <input type="text" id="inputText1" name="title" maxlength="10" placeholder="내용을 입력해주세요.">
                                </div>
                            </div>
                        <div id="subBox2">
                            <div id="textBox1">
                                <p>내용</p>
                            </div>
                            <div id="inputBox2">
                                <textarea id="inputText2" name="contents" placeholder="내용을 입력해주세요."></textarea>
                                <span id="textSpan"><em>50</em> / 50</span>
                            </div>
                        </div>
                        <div id="submit">
                            <input type="submit" id="submitBtn" value="확인">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer">
            <footer>
				상호 : Trois(주)<br> 장소 : 서울특별시 금천구 대륭테크노타운 3차 811호<br>
				 대표이사 : 공은비 김보경 김원중 박기윤 최승환 <br> Copyright (c) 2017 Trois all rights
				reserved. Trois는 안전하게 운영중입니다.
			</footer>
        </div>
 </div>
</body>
</html>