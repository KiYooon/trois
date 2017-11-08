<%@page import="java.util.HashMap"%>
<%@page import="org.omg.PortableInterceptor.USER_EXCEPTION"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trois</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/trois/resources/js/main.js"></script>
<script>
	$(document).ready(function(){
		
		$("#email").attr("pattern", "[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*");
		
		var id = "";
		var name = "";
		var pwd = "";
		var email = "";
		var loging = "";
		var del_yn = "";

		// Get the <span> element that closes the modal
		var tr = "<span class='close'>&times;</span>" + "<p>"
				+ "<label for='name'>Name : </label>"
				+ "<input type='text' id='name' maxlength='10'>" + "</p>" + "<p>"
				+ "<label for='email'>E-mail : </label>"
				+ "<input type='email' id='email' maxlength='50'>" + "</p>"
				+ "<input type='submit' value='찾기' id='findid2'>";

		var tr3 = "<span class='close'>&times;</span>" + "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='loginid' maxlength='10'>" + "</p>" + "<p>"
				+ "<label for='pw'>PW : </label>"
				+ "<input type='password' id='loginpwd' maxlength='50'>" + "</p>"

				+ "<button type='button' id='iplogin'>로그인</button>"

				+ "<button type='button' id='findid'>ID찾기</button>"
				+ "<button type='button' id='settingpw'>비밀번호 재설정</button>";

		var tr4 = "<p>" + "<label for='name'>Name : </label>"
				+ "<input type='text' id='name' maxlength='20'>" + "</p>" + "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='id' maxlength='10'>" + "</p>" + "<p>"
				+ "<label for='changepw'>비밀번호 변경 : </label>"
				+ "<input type='password' id='changepw' maxlength='50'>" + "</p>"
				+ "<button type='button' id='change'>변경</button>";

		var tr5 = "비밀번호가 변경되었습니다.<br>변경된 비밀번호로 로그인 해 주세요." + "<button type='button' id='okpw'>확인</button>";

		var tr7 = "<span class='close'>&times;</span>"
				+ "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='id' maxlength='10'> <input type='submit' id='overlap' value='중복확인'>"
				+ "</p>" + "<p>" + "<label for='pw'>PW : </label>"
				+ "<input type='password' id='pw' maxlength='50'>" + "</p>" + "<p>"
				+ "<label for='name'>Name : </label>"
				+ "<input type='text' id='name' maxlength='20'>" + "</p>" + "<p>"
				+ "<label for='email'>E-MAIL : </label>"
				+ "<input type='email' id='email' maxlength='50'>" + "</p>" + "<form>"
				+ "<input type='submit' value='회원가입' id='ipjoin'>" + "</form>";

		var tr8 = "<span class='close'>&times;</span>" + "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='loginid2' maxlength='10'>" + "</p>" + "<p>"
				+ "<label for='pw'>PW : </label>"
				+ "<input type='password' id='loginpwd2' maxlength='50'>" + "</p>"

				+ "<button type='button' id='iplogin2'>로그인</button>"

				+ "<button type='button' id='findid'>ID찾기</button>"
				+ "<button type='button' id='settingpw'>비밀번호 재설정</button>";

		var span = $("close")[0];
		var span2 = $("close")[1];

		var regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
		
		function btnLogin() {//메인화면에서 로그인버튼으로 로그인
			$("#login").off().on("click", function() {
				$("#myModal").css("display", "block");
				btnFindid();
				btnSettingpw()
			});
		}

		function btnSpan() {//팝업창닫기
			$("span").off().on("click", function() {
				$("#myModal").css("display", "none");
				$("#myModal2").css("display", "none");
				location.reload(true);
			});
		}

		function btnFindid() {//id찾기
			$("#findid").on("click", function() {
				$(".modal-content").html(tr);
				btnFindid2();
				btnSpan();
			});
		}

		function btnFindid2() {//이름, email입력 후 찾기 버튼
			$("#findid2").off().on("click", function() {

				name = $("#name").val();
				email = $("#email").val();
				
				if (name == null || email == null) {
					alert("이름 혹은 이메일을 입력해주세요.");
					return false;
				}else if(regex.test(email) == false) {
					alert("잘못된 이메일 형식입니다.");
					return false;
				}

				$.ajax({
					type : "post",
					url : "findid",
					data : {
						"name" : name,
						"email" : email
					}
				}).done(function(result) {
					findid = result.findid;
					if(findid == null){
						alert("아이디가 없습니다. 정확한 정보를 입력해 주세요.")
					}else{
						alert("회원님의 아이디는 " + findid.id + " 입니다.");
						
						$(".modal-content").html(tr3);

						$("#iplogin").off().on("click", function() {
							login();
						});
						btnFindid();
						btnSettingpw();
						btnSpan();
					}
					
				});

				//             $(".modal-content").html(tr2);

				//             $("#okid").off().on("click", function() {
				//                $(".modal-content").html(tr3);
				//                // 이벤트 다시 생성
				//                btnFindid();
				//                btnSettingpw();
				//                btnSpan();
				//             });
			});
		}
		function btnSettingpw() {//비밀번호 재설정
			$("#settingpw").off().on("click", function() {
				//             alert("메롱");
				$(".modal-content").html(tr4);

				btnChange();
			});
		}
		function btnChange() {//
			$("#change").off().on("click", function() {
				btnChangePW();
// 				$(".modal-content").html(tr5);
				
			});
		}
		function btnChangePW() {
			id = $("#id").val();
			name = $("#name").val();
			var pw = $("#changepw").val();
			if((pw == "") || (id == "") || (name == "")){
				alert("정보를 정확히 입력해주세요");
				location.href = "main";
// 					return false;
			}
			$.ajax({
				type : "post",
				url : "updatepw",
				data : {
					"id" : id,
					"name" : name,
					"pw" : pw
				}
			}).done(function(result) {
				$(".modal-content").html(tr5);
				$("#okpw").off().on("click", function() {
					location.reload(true);
// 					$(".modal-content").html(tr3);
					
// 					// 이벤트 다시 생성
// 					$("#iplogin").off().on("click", function() {
// 						login();
// 					});
// 					btnFindid();
// 					btnSettingpw()
// 					btnSpan();
				});
			});
		}
		function btnjoin() {
			$("#join").off().on("click", function() {
				//             alert("띠용");
				$("#myModal2").css("display", "block");
				btnSpan();
				btnipjoin();
			});
		}
		function btnipjoin() {
			$("#ipjoin").off().on("click", function() {
				//             $(".modal-content2").html(tr6);
				createUser();
				btnokjoin();
			});
		}

		function btnokjoin() {
			$("#okjoin").off().on("click", function() {
				$("#myModal2").css("display", "none");

				$(".modal-content2").html(tr7);
				btnjoin();
			});

		}

		function createUser() { //계정 생성 ajax
			id = $("#createid").val();
			pwd = $("#pwd").val();
			name = $("#name").val();
			email = $("#email").val();

			if (id == "" || pwd == "" || name == "" || email == "") {
				alert("값을 모두 입력해주세요.");
				return false;
			} else if(regex.test(email) == false) {
				alert("잘못된 이메일 형식입니다.");
				return false;
			}

			$.ajax({
				type : "post",
				url : "/trois/Userjoin",
				data : {
					"id" : id,
					"pwd" : pwd,
					"name" : name,
					"email" : email
				}

			}).done(function(result) {
				alert("회원가입이 성공하였습니다!");

				$(".modal-content2").html(tr8);

				$("#iplogin2").off().on("click", function() {
					login2();
				});
				btnFindid();
				btnSettingpw();
				btnSpan();
			});
		}

		$("#iplogin").off().on("click", function() {
			login();
		});

		function login() {//modal-content
			id = $("#loginid").val();
			pwd = $("#loginpwd").val();
			// 		 del_yn = "n";
			if(id == "" || pwd == ""){
				alert("아이디와 비밀번호를 입력해 주세요.");
				return false;
			}
			$.ajax({
				type : "post",
				url : "Userlogin",
				data : {
					"id" : id,
					"pwd" : pwd,
				//                "del_yn" : del_yn
				}
			}).done(function(result) {
				loging = result.login;
				if (loging != null) {
					if (id == "admin" && pwd == "1234") {
						location.href = "admin";
					} else if (loging.del_yn == "n") {
						alert("탈퇴된 회원입니다.");
						location.href = 'logout';
					}else {
						location.href = "main";
					}
				} else {
					alert("아이디와 비밀번호를 확인하세요.");
// 					location.reload(true);
					location.href = 'logout';
				}
			});
		}
		function login2() {//modal-content2
			id = $("#loginid2").val();
			pwd = $("#loginpwd2").val();
			$.ajax({
				type : "post",
				url : "Userlogin",
				data : {
					"id" : id,
					"pwd" : pwd
				}
			}).done(function(result) {
				if (result.login != null) {
					location.reload(true);
				} else {
					alert("아이디 혹은 패스워드를 확인하세요.");
					window.location.reload(true);
				}
			});
		}
		$("#overlap").on("click", function() {
			btnOverlap();
		});
		function btnOverlap() {
			var id = $("#createid").val();

			if (id == "") {
				alert("아이디를 입력해주세요.");
				return false;
			}

			$.ajax({
				type : "post",
				url : "checkid",
				data : {
					"id" : id
				},
				datatype : "json"

			}).done(function(result) {
				if (result.checkid == null) {
					alert("사용 가능한 아이디 입니다.");
					$("#ipjoin").attr("disabled", false);
				} else {
					alert("사용 불가능한 아이디 입니다.")
				}
			});
		}
		
		$("#headimg").on("click", function(){
			location.href = "main";
		});
		
		function init(){
			$.post("LoginCheck").done(function(result){
				if(result.status == 1){
					// 로그인 되었을때 사용
					$(".head-3").html('<button type="button" id="myroom">마이룸</button><button type="button" id="logout">로그아웃</button>');
					$(".body-3").html('<button type="button" id="start">시작</button>');
					$("#myroom").on("click", function(){
				    	location.href = "myroom";
				    });
					
					$("#logout").on("click", function(){
				    	location.href = "logout";
				    });
					
					$("#start").on("click", function(){
						location.href = "work";
					});
				}else{
					// 로그아웃 되었을때 사용
					$(".head-3").html('<button id="login">로그인</button><button type="button" id="join">회원가입</button>');
					btnLogin();
					btnSpan();
					btnjoin();
				}
			});
		}
		
		// 시작 부분...
		init();
	});
</script>
</head>
<body>
<div class="trois">
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
			<div class="head-3"></div>
			
			<!--             로그인 후 -->
<!-- 				<button type="button" id="myroom">마이룸</button> -->
<!--         		<button type="button" id="logout">로그아웃</button> -->
        	<!--             로그인 전 -->
<!-- 				<button id="login">로그인</button> -->
<!-- 				<button type="button" id="join">회원가입</button> -->
				
				<!--             The Modal -->
				<div id="myModal" class="modal">
					<!--                Modal content -->
					<div class="modal-content">
						<span class="close">&times;</span>
						<form method="post">
							<div class="logintable">
								<p>
									<label for="id">ID : </label> <input type="text" id="loginid" maxlength='10'>
								</p>
								<p>
									<label for="pw">PW : </label> <input type="password"
										id="loginpwd" maxlength='50'>
								</p>
								<button type="button" id="iplogin">Login</button>
								<button type="button" id="findid">ID찾기</button>
								<button type="button" id="settingpw">비밀번호 재설정</button>
							</div>
						</form>
					</div>
				</div>
				<!-- The Modal -->
				<div id="myModal2" class="modal">
					<!-- Modal content -->
					<form action="" method="post">
						<div class="modal-content2">
							<span class="close">&times;</span>
							<div class="jointable">
								<p>
									<label for="id">ID : </label> <input type="text" id="createid"
										name="id" maxlength='10'>
									<button type="button" id="overlap">중복확인</button>
								</p>
								<p>
									<label for="pw">PW : </label> <input type="password" id="pwd"
										name="pwd" maxlength='50'>
								</p>
								<p>
									<label for="name">Name : </label> <input type="text" id="name"
										name="name" maxlength='20'>
								</p>
								<p>
									<label for="email">E-MAIL : </label> <input type="email"
										id="email" name="email" maxlength='50'>
								</p>



								<button type="button" value="회원가입" id="ipjoin" disabled="disabled">회원가입</button>

							</div>
						</div>
					</form>
				</div>

		</header>
	</div>
	<div class="body">
		<div class="body-1"></div>

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

		<div class="body-1"></div>

	</div>
	<div class="body-3">
		<!--             로그인 후 -->
<!-- 			<button type="button" id="start" onclick="location.href = 'work';">시작</button> -->
	</div>
	<div class="body-4">
		<footer>
			<p id=fp>상호 : Trois(주)<br> 장소 : 서울특별시 금천구 대륭테크노타운 3차 811호<br> 
			대표이사 : 공은비 김보경 김원중 박기윤 최승환  
			<br> Copyright (c) 2017 Trois all rights reserved. Trois는 안전하게 운영중입니다.</p>
		</footer>
	</div>
</div>
</body>
</html>