<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
<html>
    <head>
        <title>Trois</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <style>
            * {
              -webkit-box-sizing: border-box;
              -moz-box-sizing: border-box;
              box-sizing: border-box;
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
            }
            .footer{
                width: 100%;
                height: 94px;
                display: block;
                border-top: 1px solid;
            }
            .footer footer{
                text-align: center;
            }
            .center-right ul {
                padding: 0;
                width: 90%;
                margin-left: 5%;
                clear: both;
                list-style: none; 
            }
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
            
            .center .center-left li{
                list-style: none;
            }
            .center-right li:first-child {    
                border-left: 1px solid green;
            }
            .center-right .ul-head ul:first-child li {
                height: 50px;
                background-color: silver;
                padding-top: 10px;
                border-top: 1px solid green;
                border-bottom: 1px solid green;
            }
            .button-list {
                height: 100px;
                clear: both;
                text-align: center;
                padding-top: 35px;
            }
            .button-list button {
                width: 80px;
                height: 30px;
                border: 0px;
                border-radius: 4px;
                cursor: pointer;
            }
            .button-bg {
                background-color: #5050d8;
            }
            #logout{
                margin-left: 113px;
                margin-top: 28px;
            }
        </style>
        <script>
            $(document).ready(function(){
                var index = 1;
                $("button").on("click",function(){
                    $("button").removeClass("button-bg");
                    $(this).addClass("button-bg");
                    if($("button").index(this) == 0){
                        if(index > 0){
                            var t = index * 5;
                            for(var i = 1; i < 6; i++){
                                $("button").eq(i).text(t - (5 - i));
                            }
                            index--;
                        }
                        $("button").removeClass("button-bg");
                        $("button").eq(1).addClass("button-bg");
                    }else if($("button").index(this) == 6){
                        if(index < 5){
                            var t = index * 5;
                            for(var i = 1; i < 6; i++){
                                $("button").eq(i).text(t - (5 - i));
                            }
                            index++;
                        }
                        $("button").removeClass("button-bg");
                        $("button").eq(5).addClass("button-bg");
                    }
                });
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
                        <li><a href="myroom.html" style="text-decoration: underline;">마이룸</a></li>
                        <li><a href="#">문의하기</a></li>
                        <li><a href="myqna.html">나의문의내역</a></li>
                        <li><a href="modify.html">회원정보수정/탈퇴</a></li>
                    </ul>
                </div>
                <div class="center-right">
                    <div class="ul-head">
                        <ul>
                            <li>순서</li>
                            <li>제목</li>
                            <li>캡쳐</li>
                            <li>날짜</li>
                            <li>삭제</li>
                        </ul>
                    </div>
                    <div class="ul-body">
                        <ul>
                            <li>1</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>2</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>3</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>4</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>5</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>6</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>7</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>8</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                        <ul>
                            <li>9</li>
                            <li>은</li>
                            <li>비</li>
                            <li>다</li>
                            <li><button>삭제</button></li>
                        </ul>
                    </div>
                    <div class="button-list">
                        <button type="button">&lt;</button>
                        <button type="button" class="button-bg">1</button>
                        <button type="button">2</button>
                        <button type="button">3</button>
                        <button type="button">4</button>
                        <button type="button">5</button>
                        <button type="button">&gt;</button>
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
    </body>
</html>
 