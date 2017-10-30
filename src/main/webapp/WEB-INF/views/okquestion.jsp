<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HashMap<String, Object> map = (HashMap<String, Object>) request.getAttribute("selectqnaAll");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/trois/resources/css/okquestion.css">
<title>okquestion</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
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
            <button id="logout" onclick="location.href = 'logout';">로그아웃</button>
        </div>
    </div>
    <div class="center">
        <div class="center-left">
            <p id="ad">관리자 페이지</p>
            <ul>
				<li><a href="myroom">마이룸</a></li>
				<li><a href="question" style="text-decoration: underline;">문의하기</a></li>
				<li><a href="myqna">나의문의내역</a></li>
				<li><a href="modify">회원정보수정/탈퇴</a></li>
            </ul>
        </div>
        <div id="mainContent">
            <div id="mainBox">
                    <div id="subBox1">
                        <div id="textBox1">
                            <p>제목</p>
                        </div>
                        <div id="reqBox1">
                        	<p id="reqText1"><%= map.get("title") %></p>
                        </div>
                    </div>
                <div id="subBox2">
                    <div id="textBox2">
                        <p>문의 내용</p>
                    </div>
                    <div id="reqBox2">
                    	<p id="reqText2">값값</p>
                    </div>
                </div>
            </div>
            <div id="mainBox2">
                <div id="subBox3">
                    <div id="textBox3">
                        <p><%= map.get("contents") %></p>
                    </div>
                    <div id="reqBox3">
                    	<p id="reqText3"><%= map.get("answer") %></p>
                    </div>
                    <div id="submit">
                        <button type="button" id="backBtn">돌아가기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
            <footer>
		                상호 :  Trois(주)<br>
		                장소재지 : 서울특별시 금천구 대륭테크노타운 3차 811호<br>
		                대표이사 : 박기윤 김원중 최승환 김보경 공은비<br>
		               s Copyright (c) 2017  Trois all rights reserved. Trois는 안전하게 운영중입니다.
            </footer>
        </div>
</div>
</body>
</html>