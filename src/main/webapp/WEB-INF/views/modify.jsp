<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html>
    <head>
        <title>Trois</title>
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
                width: 30%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                /*background-color: rgb(0,0,0);*/ /* Fallback color */
                /*background-color: rgba(0,0,0,0.4);*/ /* Black w/ opacity */
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
            
            html, body{
                margin: 0;
                padding: 0;
            }
            .trois{
                width: 100vw;
                height: 100vh;
            }
            .header{
                width: 100%;
                height: 79px;
                display: block;
                border-bottom: 1px solid;
            }
            .header .header-left{
                width: calc(15% - 1px);
                height: 100%;
                float: left;
                border-right: 1px solid;
            }
            .header .header-center{
                width: 70%;
                height: 100%;
                float: left;
            }
            .header h1{
                margin: 0;
                padding: 0;
                text-align: center;
                font-size: 50px;
                padding-top: 7px;
            }
            .header .header-right{
                width: calc(15% - 1px);
                height: 100%;
                float: right;
                border-left: 1px solid;
            }
            .center{
                width: 100%;
                height: calc(100vh - 180px);
                display: block;
            }
            .center .center-left{
                width: calc(10% - 1px);
                height: 100%;
                float: left;
                border-right: 1px solid;
            }
            .center .center-left a{
                text-decoration: none;
            }
            .center .center-right{
                width: 90%;
                height: 100%;
                float: right;
                /*padding-left: 5%;*/
            }
            .center .center-right li{
                list-style: none;
            }
            .footer{
                width: 100%;
                height: 99px;
                display: block;
                border-top: 1px solid;
            }
            .footer footer{
                text-align: center;
            }
            .center .center-left li{
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
            $(document).ready(function(){
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
                    <ul>
                        <li><a href="#">LOGOUT</a></li>
                    </ul>
                </div>
            </div>
            <div class="center">
                <div class="center-left">
                    <ul>
                        <li><a href="myroom.html">마이룸</a></li>
                        <li><a href="#">문의하기</a></li>
                        <li><a href="myqna.html">나의문의내역</a></li>
                        <li><a href="mo" style="text-decoration: underline;">회원정보 수정/탈퇴</a></li>
                    </ul>
                </div>
                <div class="center-right">
                    <div class="usermodify">
                        <ul>
                            <h2>회원정보 수정</h2>
                            <li>이름 : 김보경</li><br>
                            <li>ID : BBO</li><br>
                            <li>PWD : <button type="button" id="modifypwd">비밀번호 변경</button></li><br>
                            <li>Email : <button type="button" id="modifyemail">이메일 변경</button></li><br>
                        </ul>
                    </div>
                    <hr>
                    <div class="userdelete">
                        <ul>
                            <h2>회원 탈퇴</h2>
                            <li>탈퇴하시려면 탈퇴 버튼을 눌러주세요.</li><br>
                            <li class="inline-block"><button type="submit" id="del_n">탈퇴</button></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer">
                <footer>
                    상호 :  Trois(주)<br>
                    장소재지 : 서울특별시 금천구 대륭테크노타운 3차 811호<br>
                    대표이사 : 박기윤 김원중 최승환 김보경 공은비<br>
                    Copyright (c) 2017  Trois all rights reserved. Trois는 안전하게 운영중입니다.
                </footer>
            </div>
        </div>
        <!-- The Modal 비밀번호 변경 modal -->
        <div id="updatepwd" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close1">&times;</span>
                <ul>
                    <h2>비밀번호 변경</h2>
                    <li>비밀번호 : <input type="text" placeholder="입력하세요"></li><br>
                    <li>비밀번호 확인 : <input type="text" placeholder="입력하세요"></li><br>
                    <li class="inline-block"><button type="submit">확인</button></li>
                    <li class="inline-block"><button type="submit">취소</button></li>
                    
                </ul>
            </div>
        </div>
        
        <!-- The Modal 이메일 변경 modal -->
        <div id="updateemail" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close2">&times;</span>
                <ul>
                    <h2>이메일 변경</h2>
                    <li>email : <input type="text" placeholder="입력하세요"></li><br>
                    <li class="inline-block"><button type="submit">확인</button></li>
                    <li class="inline-block"><button type="submit">취소</button></li>
                </ul>
            </div>
        </div>
        
        <!-- The Modal 회원 탈퇴 modal -->
        <div id="deleteuser" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close3">&times;</span>
                <ul>
                    <h2>회원 탈퇴</h2>
                    <li>회원을 정말로 탈퇴하시겠습니까?</li><br>
                    <li class="inline-block"><button type="submit">확인</button></li>
                    <li class="inline-block"><button type="submit">취소</button></li>
                </ul>
            </div>
        </div>
    </body>
</html>