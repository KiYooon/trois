<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trois</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/trois/resources/js/main.js">
	
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
				<button id="login">로그인</button>
				<!--             The Modal -->
				<div id="myModal" class="modal">
					<!--                Modal content -->
					<div class="modal-content">
						<span class="close">&times;</span>
						<form method="post">
							<div class="logintable">
								<p>
									<label for="id">ID : </label> <input type="text" id="loginid">
								</p>
								<p>
									<label for="pw">PW : </label> <input type="password"
										id="loginpwd">
								</p>
								<button type="button" id="iplogin">Login</button>
								<button type="button" id="findid">ID찾기</button>
								<button type="button" id="settingpw">비밀번호 재설정</button>
							</div>
						</form>
					</div>
				</div>


				<button type="button" id="join">회원가입</button>
				<!-- The Modal -->
				<div id="myModal2" class="modal">
					<!-- Modal content -->
					<form action="" method="post">
						<div class="modal-content2">
							<span class="close">&times;</span>
							<div class="jointable">
								<p>
									<label for="id">ID : </label> <input type="text" id="createid"
										name="id">
									<button type="button" id="overlap">중복확인</button>
								</p>
								<p>
									<label for="pw">PW : </label> <input type="password" id="pwd"
										name="pwd">
								</p>
								<p>
									<label for="name">Name : </label> <input type="text" id="name"
										name="name">
								</p>
								<p>
									<label for="email">E-MAIL : </label> <input type="text"
										id="email" name="email">
								</p>



								<button type="button" value="회원가입" id="ipjoin" disabled="disabled">회원가입</button>

							</div>
						</div>
					</form>
				</div>

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
		
	</div>
	<div class="body-4">
		<footer>
			<p id=fp>상호 : Trois(주)<br> 장소 : 서울특별시 금천구 대륭테크노타운 3차 811호<br> 대표이사
				: 박기윤 김원중 최승환 김보경 공은비 <br> Copyright (c) 2017 Trois all rights
				reserved. Trois는 안전하게 운영중입니다.</p>
		</footer>
	</div>



	</div>
	<script>
		//    $("#login").on("click", function(){
		//       alert(";;;;;");
		//       $("#myModal").css("display","block")
		//    });

		//    Get the modal

		//       var modal = $("myModal");
		//       var modal2 = $("myModal2");

		//       // Get the button that opens the modal
		//       var btn = $("login");
		//       var btn2 = $("join");

		var id = "";
		var name = "";
		var pwd = "";
		var email = "";
		var loging = "";
		var del_yn = "";

		// Get the <span> element that closes the modal
		var tr = "<span class='close'>&times;</span>" + "<p>"
				+ "<label for='name'>Name : </label>"
				+ "<input type='text' id='name'>" + "</p>" + "<p>"
				+ "<label for='email'>E-mail : </label>"
				+ "<input type='text' id='email'>" + "</p>"
				+ "<input type='submit' value='찾기' id='findid2'>";

		var tr3 = "<span class='close'>&times;</span>" + "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='loginid'>" + "</p>" + "<p>"
				+ "<label for='pw'>PW : </label>"
				+ "<input type='password' id='loginpwd'>" + "</p>"

				+ "<button type='button' id='iplogin'>로그인</button>"

				+ "<button type='button' id='findid'>ID찾기</button>"
				+ "<button type='button' id='settingpw'>비밀번호 재설정</button>";

		var tr4 = "<p>" + "<label for='name'>Name : </label>"
				+ "<input type='text' id='name'>" + "</p>" + "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='id'>" + "</p>" + "<p>"
				+ "<label for='changepw'>비밀번호 변경 : </label>"
				+ "<input type='password' id='changepw'>" + "</p>"
				+ "<button type='button' id='change'>변경</button>";

		var tr5 = "비밀번호가 변경되었습니다.<br>변경된 비밀번호로 로그인 해 주세요."
				+ "<button type='button' id='okpw'>확인</button>";

		//       var tr6 = "회원가입이 완료되었습니다."
		//          + "<button type='button' id='okjoin'>확인</button>";

		var tr7 = "<span class='close'>&times;</span>"
				+ "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='id'> <input type='submit' id='overlap' value='중복확인'>"
				+ "</p>" + "<p>" + "<label for='pw'>PW : </label>"
				+ "<input type='password' id='pw'>" + "</p>" + "<p>"
				+ "<label for='name'>Name : </label>"
				+ "<input type='text' id='name'>" + "</p>" + "<p>"
				+ "<label for='email'>E-MAIL : </label>"
				+ "<input type='text' id='email'>" + "</p>" + "<form>"
				+ "<input type='submit' value='회원가입' id='ipjoin'>" + "</form>";

		var tr8 = "<span class='close'>&times;</span>" + "<p>"
				+ "<label for='id'>ID : </label>"
				+ "<input type='text' id='loginid2'>" + "</p>" + "<p>"
				+ "<label for='pw'>PW : </label>"
				+ "<input type='password' id='loginpwd2'>" + "</p>"

				+ "<button type='button' id='iplogin2'>로그인</button>"

				+ "<button type='button' id='findid'>ID찾기</button>"
				+ "<button type='button' id='settingpw'>비밀번호 재설정</button>";

		var span = $("close")[0];
		var span2 = $("close")[1];

		function btnLogin() {//메인화면에서 로그인버튼으로 로그인
			$("#login").off().on("click", function() {
				// alert("띠용");
				$("#myModal").css("display", "block");
				btnFindid();
				btnSettingpw()
			});
		}

		function btnSpan() {//팝업창닫기
			$("span").off().on("click", function() {
				$("#myModal").css("display", "none");
				$("#myModal2").css("display", "none");
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

				$.ajax({
					type : "post",
					url : "findid",
					data : {
						"name" : name,
						"email" : email
					}
				}).done(function(result) {
					//                console.log(result);
					//                console.log(result.name);
					if (result.name == null || result.email == null) {
						alert("이름 혹은 이메일을 확인해주세요.");
					} else {
						findid = result.findid;
						alert("회원님의 아이디는 " + findid.id + " 입니다.");
					}
					$(".modal-content").html(tr3);

					$("#iplogin").off().on("click", function() {
						login();
					});
					btnFindid();
					btnSettingpw();
					btnSpan();
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
				$(".modal-content").html(tr5);

				$("#okpw").off().on("click", function() {
					$(".modal-content").html(tr3);
					// 이벤트 다시 생성
					$("#iplogin").off().on("click", function() {
						login();
					});
					btnFindid();
					btnSettingpw()
					btnSpan();
				});
			});
		}
		function btnChangePW() {
			id = $("#id").val();
			name = $("#name").val();
			var pw = $("#changepw").val();

			$.ajax({
				type : "post",
				url : "updatepw",
				data : {
					"id" : id,
					"name" : name,
					"pw" : pw
				}
			}).done(function(result) {
				//             console.log(result);
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
				//             console.log(result.join);
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
			$.ajax({
				type : "post",
				url : "Userlogin",
				data : {
					"id" : id,
					"pwd" : pwd,
				//                "del_yn" : del_yn
				}
			}).done(function(result) {
				console.log(result);
				loging = result.login;
				console.log(loging);
				if (loging != null) {
					if (id == "admin" && pwd == "1234") {
						location.href = "admin";
					} else if (loging.del_yn == "n") {
						alert("탈퇴된 회원입니다.");
					} else {
						location.href = "main2";
					}
				} else {
					alert("아이디와 비밀번호를 확인하세요.");
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
				//             console.log(result);
				//             console.log(result.login);
				if (result.login != null) {
					location.href = "main2";
				} else {
					alert("아이디 혹은 패스워드를 확인하세요.");
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
				console.log(result.checkid);
				if (result.checkid == null) {
					alert("사용 가능한 아이디 입니다.");
					$("#ipjoin").attr("disabled", false);
				} else {
					alert("사용 불가능한 아이디 입니다.")
				}
			});
		}

		// 시작 부분...
		btnLogin();
		btnSpan();
		btnjoin();

		// When the user clicks the button, open the modal 
		//       btn.onclick = function() {
		//           modal.style.display = "block";
		//       }
		//    btn2.onclick = function() {
		//        modal2.style.display = "block";
		//    }

		//    // When the user clicks on <span> (x), close the modal
		//    span.onclick = function() {
		//        modal.style.display = "none";
		//    }
		//    span2.onclick = function() {
		//        modal2.style.display = "none";
		//    }
	</script>
</body>
</html>