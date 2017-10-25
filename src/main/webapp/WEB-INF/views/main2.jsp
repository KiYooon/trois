<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/main2.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
<header>
    <div class="head-1">
        <img src="data:image/png;base64,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" id="headimg">
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
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6_KABpjFj6tQYiSrvMe5cMEXuE41UaE4naH_Vkwizl-SlgC1cDg" class="img-top img-left">
            </div>
            <div class="body-2-1">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6_KABpjFj6tQYiSrvMe5cMEXuE41UaE4naH_Vkwizl-SlgC1cDg" class="img-top img-right">
            </div>
            <div class="body-2-1">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6_KABpjFj6tQYiSrvMe5cMEXuE41UaE4naH_Vkwizl-SlgC1cDg" class="img-bottom img-left">
            </div>
            <div class="body-2-1">
                <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6_KABpjFj6tQYiSrvMe5cMEXuE41UaE4naH_Vkwizl-SlgC1cDg" class="img-bottom img-right">
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
        <button type="button" id="start">시작</button>
    </div>
    <div class="body-4">
        <footer><p id=fp>Copyright.</p></footer>
    </div>



</div>
	
</body>
</html>