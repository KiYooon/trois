<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html>
<head>
<title>Trois</title>
<link rel="stylesheet" href="resources/css/modify.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    padding-left: 20%;
    left: 0;
    top: 0;
    width: 50%; /* Full width */
    height: 45%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
}
/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}
.modal-content h2{
    text-align: center;
}
.modal-content li {
    list-style: none;
}
/* The Close Button */
.close1, .close2, .close3 {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}
<!-- modify -->
.center .center-right li{
    list-style: none;
}
.header .header-right li{
    text-align: center;
    list-style: none;
    padding-top: 15px;
    padding-left: 45px;
    width: 130px;
    height: 20px;
}
.header .header-right li a{
    text-decoration: none;
}
.inline-block{
    display: inline-block;
}
</style>
<script>
	var email = "";
	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var id = "";
	var pwd = "";
	
	$(document).ready(function(){
		$("#email").attr("pattern : ");
	    // Get the modal
	    var modal1 = document.getElementById("updatepwd");
	    var modal2 = document.getElementById('updateemail');
	    var modal3 = document.getElementById('deleteuser');
	    // Get the button that opens the modal
	    var btn1 = document.getElementById("modifypwd");
	    var btn2 = document.getElementById("modifyemail");
	    var btn3 = document.getElementById("del_n");
	
	    // Get the <span> element that closes the modal
	    var span1 = document.getElementsByClassName("close1")[0];
	    var span2 = document.getElementsByClassName("close2")[0];
	    var span3 = document.getElementsByClassName("close3")[0];
	
	    // When the user clicks the button, open the modal 
	    btn1.onclick = function() {
	        modal1.style.display = "block";    
	    }
	    btn2.onclick = function() {
	        modal2.style.display = "block";    
	    }
	    btn3.onclick = function() {
	        modal3.style.display = "block";    
	    }
	
	    // When the user clicks on <span> (x), close the modal
	    span1.onclick = function() {
	        modal1.style.display = "none";
	    }
	    span2.onclick = function() {
	        modal2.style.display = "none";
	    }
	    span3.onclick = function() {
	        modal3.style.display = "none";
	    }
	
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	        if (event.target == modal1) {
	            modal1.style.display = "none";
	        }else if(event.target == modal2){
	            modal2.style.display = "none";
	        }else if(event.target == modal3){
	            modal3.style.display = "none";
	        }
	    }
	    
	    $("#okemail").on("click", function(){
	    	email = $("#email").val();
	    	
	    	if(email == ""){
	    		alert("확인해주세요.");
	    	}else if(regex.test(email) == false) {
				alert("잘못된 이메일 형식입니다.");
			}else{
	    	
			    $.ajax({
					type : "post",
					url : "modifyemail",
					data : {
						"email" : email
					},
					datatype : "json"
		
				}).done(function(result) {
					console.log(result);
					email = result.email;
					console.log(email);
				});
			
			}
	    });

		$("#okpwd").on("click", function(){
			if($("#newpwd1").val() == $("#newpwd2").val()){
		    	alert("성공하였습니다.");
			}else if($("#newpwd1").val() != $("#newpwd2").val()){
				alert("확인해주세요");
			}
		});
		
	    
	    $("#nopwd").on("click", function(){
	    	location.href = "modify";
	    });
	    
	    $("#noemail").on("click", function(){
	    	location.href = "modify";
	    });
	    
	    $("#nodeleteuser").on("click", function(){
	    	location.href = "modify";
	    });

		$("#logout").on("click", function(){
	    	location.href = "logout";
	    });
		
		$("#logo").on("click", function(){
			location.href = "main";
		});
		
		
	});
</script>
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
					<li><a href="question">문의하기</a></li>
					<li><a href="myqna">나의문의내역</a></li>
					<li><a href="modify" style="text-decoration: underline;">회원정보 수정/탈퇴</a></li>
					<li><a href="work">작업시작하기</a></li>
				</ul>
			</div>
			<div class="center-right">
			<h2>회원정보 수정</h2>
			<div class="usermodify">
				<ul>
					<li>PWD : <button type="submit" id="modifypwd">비밀번호 변경</button></li>
					<li>Email : <button type="submit" id="modifyemail">이메일 변경</button></li>
				</ul>
			</div>
			<hr>
			<h2>회원 탈퇴</h2>
			<div class="userdelete">
				<ul>
					<li>탈퇴하시려면 탈퇴 버튼을 눌러주세요.</li>
					<li class="inline-block"><button type="submit" id="del_n">탈퇴</button></li>
				</ul>
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
	<!-- The Modal 비밀번호 변경 modal -->
	<div id="updatepwd" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close1">&times;</span>
			<h2>비밀번호 변경</h2>
			<form action="modifypwd" method="post">
				<ul>
					<li>비밀번호 : <input type="password" id="newpwd1" name="newpwd1" placeholder="입력하세요" maxlength="50"></li>
					<li>비밀번호 : <input type="password" id="newpwd2" name="newpwd2" placeholder="입력하세요" maxlength="50"></li>
					<li class="inline-block"><button type="submit" id="okpwd">확인</button></li>
					<li class="inline-block"><button type="button" id="nopwd">취소</button></li>
				</ul>
			</form>
		</div>
	</div>

	<!-- The Modal 이메일 변경 modal -->
	<div id="updateemail" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close2">&times;</span>
			<h2>이메일 변경</h2>
			<form action="" method="post">
				<ul>
					<li>email : <input type="email" id="email" name="email" placeholder="입력하세요" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" maxlength="50"></li>
					<li class="inline-block"><button type="submit" id="okemail">확인</button></li>
					<li class="inline-block"><button type="button" id="noemail">취소</button></li>
				</ul>
			</form>
		</div>
	</div>

	<!-- The Modal 회원 탈퇴 modal -->
	<div id="deleteuser" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close3">&times;</span>
			<h2>회원 탈퇴</h2>
			<form action="deleteuser" method="post">
				<ul>
					<li>회원을 정말로 탈퇴하시겠습니까?</li>
					<li class="inline-block"><button type="submit" id="okdeleteuser">확인</button></li>
					<li class="inline-block"><button type="button" id="nodeleteuser">취소</button></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>