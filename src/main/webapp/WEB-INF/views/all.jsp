<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/myroom.css">
<title>Trois</title>
<style>
/* width가 다른 내용 */
.center-right .ul-head li {
	margin: 0;
	padding-top: 35px;
	font-size: 20px;
	text-align: center;
	width: calc((100% / 5) - 6px);
	height: 50px;
	display: inline-block;
	float: left;
	border-bottom: 1px solid green;
	border-right: 1px solid green;
}

.center-right .ul-body li {
	margin: 0;
	padding-top: 16px;
	font-size: 20px;
	text-align: center;
	width: calc((100% / 5) - 6px);
	height: 50px;
	display: inline-block;
	float: left;
	border-bottom: 1px solid green;
	border-right: 1px solid green;
}	
</style>
<script>
$(document).ready(function() {
	
	var hash = location.hash; // url 주소 중 마지막 부분에 #~~로 되어 있는 부분 가져오기.
	if(hash == ""){ // #으로 되어 있는 주소가 없다면 고정 값으로 변경
		hash = "#myroom";	
	}
	$(".center-left ul li a").on("click", function(){
		hash = $(this).attr("href"); // a 태그 선택 시 속성값인 href의 값을 hash 변수에 넣기.
		htmlLoad(); // div 화면에 적용 함수 호출
	});
	function htmlLoad(){
		// 가져 올 화면 정보 주소 생성
		var url = "/trois/" + hash.substr(1, hash.length);
		// div 태그 속에 url에서 가져온 데이터 넣기.
		$(".center .center-right").load(url, function(d, s, x){
			if(s == "error"){ // 오류 발생 시 (404, 500) 등등...
				alert("잘 못 된 주소를 입력하셨습니다. 처음으로 돌아 가기.");
				location.href = "myroom"; // 화면 다시 읽어 오게 만든다.
			}
		});
	}
	htmlLoad(); // div 화면에 적용 함수 호출

});
</script>
</head>
<body>
	<div class="trois">
		<div class="header">
			<div class="header-left">
				<h1>logo</h1>
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
					<li><a href="#myroom">마이룸</a></li>
					<li><a href="#">문의하기</a></li>
					<li><a href="#myqna">나의문의내역</a></li>
					<li><a href="#modify">회원정보수정/탈퇴</a></li>
				</ul>
			</div>
			<div class="center-right">
<!-- 				<div class="ul-head"> -->
<!-- 					<ul> -->
<!-- 						<li>순서</li> -->
<!-- 						<li>제목</li> -->
<!-- 						<li>캡쳐</li> -->
<!-- 						<li>날짜</li> -->
<!-- 						<li>삭제</li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div class="ul-body"> -->
<!-- 					<ul> -->
<!-- 						<li>1</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>2</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>3</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>4</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>5</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>6</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>7</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>8</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 					<ul> -->
<!-- 						<li>9</li> -->
<!-- 						<li>은</li> -->
<!-- 						<li>비</li> -->
<!-- 						<li>다</li> -->
<!-- 						<li><button>삭제</button></li> -->
<!-- 					</ul> -->
<!-- 				</div> -->
<!-- 				<div class="button-list"> -->
<!-- 					<button type="button">&lt;</button> -->
<!-- 					<button type="button" class="button-bg">1</button> -->
<!-- 					<button type="button">2</button> -->
<!-- 					<button type="button">3</button> -->
<!-- 					<button type="button">4</button> -->
<!-- 					<button type="button">5</button> -->
<!-- 					<button type="button">&gt;</button> -->
<!-- 				</div> -->
			</div>
		</div>
		<div class="footer">
			<footer>
				상호 : Trois(주)<br> 장소 : 서울특별시 금천구 대륭테크노타운 3차 811호<br> 대표이사
				: 공은비 김보경 김원중 박기윤 최승환 <br> Copyright (c) 2017 Trois all rights
				reserved. Trois는 안전하게 운영중입니다.
			</footer>
		</div>
	</div>
</body>
</html>
