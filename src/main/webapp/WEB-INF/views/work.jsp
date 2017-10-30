<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/trois/resources/work.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>작업화면</title>
</head>
<script type="text/javascript" src="/trois/resources/js/html2canvas.js"></script>
<script>
$(document).ready(function() {
	$(".tab_sub2,.tab_sub3").hide();
	// Get the modal
	var modal = document.getElementById('myModal1');

	// Get the button that opens the modal
	var btn = document.getElementById("help");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close1")[0];

	// When the user clicks the button, open the modal 
	btn.onclick = function() {
	    modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	    modal.style.display = "none";
	}
	$("#btn3").click(function(){
		if(confirm("나가시겠습니까?")){
	    location.href="/trois/main";
	    }else{ 
	    alert("취소되었습니다.");
	    }
		});
	$("#btn2").on('click', function () {
	    if(confirm("저장을 하시겠습니까?")){
	    	alert("저장되었습니다.");
	    }else{
	    alert("취소되었습니다.");
	    }
		});
	$("#btn1").on('click', function () {
	    if(confirm("이미지 저장을 하시겠습니까?")){
	    	alert("저장되었습니다.");
	    }else{
	    alert("취소되었습니다.");
	    }
		});
	$("#btn4").click(function() {
	    $(".tab_sub1").show();
	    $(".tab_sub2,.tab_sub3").hide();
	     $("#brand_tab1").addClass("port_back");
	     $("#brand_tab2,#brand_tab3").removeClass("port_back");
	 });
	 $("#btn5").click(function() {
	     $(".tab_sub2").show();
	     $(".tab_sub1,.tab_sub3").hide();
	     $("#brand_tab2").addClass("port_back");
	     $("#brand_tab1,#brand_tab3").removeClass("port_back");
	  });
	  $("#btn6").click(function() {
	      $(".tab_sub3").show();
	      $(".tab_sub1,.tab_sub2").hide();
	      $("#brand_tab3").addClass("port_back");
	      $("#brand_tab1,#brand_tab2").removeClass("port_back");
	  });
});

</script>
<body>
<div id="helpBox">
     <div id="active6">
         <input id="text" type="text" placeholder="제목을 입력해주세요.">
     </div>     
     </div>
<div class="contain">
    <div class="side">
    <div class="rf tab_sub1">
        <div id="active">
                <div class="p1">침대</div>
                    <div id="active3">
                        <div class="active3-1">
                             <input id="image9" type="image" src="resources/work/%EC%B9%A8%EB%8C%801.PNG">
                        </div>
                        <div class="active3-2">
                             <input id="image10" type="image" src="resources/work/%EC%B9%A8%EB%8C%801.PNG">
                        </div>
                        <div class="active3-3">
                             <input id="image11" type="image" src="resources/work/%EC%B9%A8%EB%8C%801.PNG">
                        </div>
                        <div class="active3-4">
                             <input id="image12" type="image" src="resources/work/%EC%B9%A8%EB%8C%801.PNG">
                        </div>
                    </div>
            <div class="p2">의자</div>
            <div id="active4">
            <div class="active4-1">
                <input id="image13" type="image" src="resources/work/%EC%9D%98%EC%9E%90.PNG">
                </div>
                <div class="active4-2">
                  <input id="image14" type="image" src="resources/work/%EC%9D%98%EC%9E%90.PNG">
                </div>
            </div>
            <div class="p3">책상</div>
            <div id="active5">
            <div class="active5-1">
                <input id="image15" type="image" src="resources/work/%EC%9D%98%EC%9E%90.PNG">
      
                     </div>
                <div class="active5-2">
                  <input id="image16" type="image" src="resources/work/%EC%9D%98%EC%9E%90.PNG">   
                 </div>
                 </div>
                 </div>
         </div>
         <div class="contain2">
                  <div class="side2">
                  <div class="rm tab_sub2">
                  <div id="active10">
                    <div id="active">
                    <div class="p4">문</div>
                        <div class="active7-1">
                             <input id="image9" type="image" src="resources/work/%EB%AC%B8.PNG">
                        </div>
                        <div class="active7-2">
                             <input id="image10" type="image" src="resources/work/%EB%AC%B8.PNG">
                        </div>
                        <div class="active7-3">
                             <input id="image11" type="image" src="resources/work/%EB%AC%B8.PNG">
                        </div>
                        <div class="active7-4">
                             <input id="image12" type="image" src="resources/work/%EB%AC%B8.PNG">
                              </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
             <div class="contain2">
                  <div class="side2">
                  <div class="rm tab_sub3">
                  <div id="active10">
                    <div id="active">
                    <div class="p4">벽</div>
                        <div class="active8-1">
                             <input id="image9" type="image" src="resources/work/%EB%B2%BD.PNG">
                        </div>
                        <div class="active8-2">
                             <input id="image11" type="image" src="resources/work/%EB%B2%BD.PNG">
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
             <div id="active1">
                     <div>
                       <li id="brand_tab1" class="port_back">
<button class="btn" id="btn4" type="submit"><img class="btn-img" src="resources/work/%EA%B0%80%EA%B5%AC.PNG"></button>
</li></div>
                 <div>
                  <li id="brand_tab2">
                  <button class="btn" id="btn5" type="submit"><img class="btn-img" src="resources/work/%EB%AC%B8.PNG"></button>
                  <li></div>
                 <div>
                  <li id="brand_tab3">
                 <button class="btn" id="btn6" type="submit"><img class="btn-img" src="resources/work/%EB%B2%BD.PNG"></button>
                 <li></div> 
        </div>
        </div>
    <div class="right">
        <div id="main">
            <input id="help" type="image" src="resources/work/help.PNG">
<!-- The Modal -->
<div id="myModal1" class="modal1">

  <!-- Modal content -->
  <div class="modal-content1">
    <span class="close1">&times;</span>
    <p>드래그 해주세요.</p>
  </div>

</div>
<div class="big1">
                <div class="bg1 border-left border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>

                <div class="bg2 border-left border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>

                <div class="bg1 border-left border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>

                <div class="bg2 border-left border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>

                <div class="bg1 border-left border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>

                <div class="bg2 border-left border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>
                <div class="bg2 border-right border-top"></div>
                <div class="bg1 border-right border-top"></div>

                <div class="bg1 border-left border-right border-top border-bottom"></div>
                <div class="bg2 border-right border-top border-bottom"></div>
                <div class="bg1 border-right border-top border-bottom"></div>
                <div class="bg2 border-right border-top border-bottom"></div>
                <div class="bg1 border-right border-top border-bottom"></div>
                <div class="bg2 border-right border-top border-bottom"></div>
                <div class="bg1 border-right border-top border-bottom"></div>
                <div class="bg2 border-right border-top border-bottom"></div>
                <div class="bg1 border-right border-top border-bottom"></div>
                <div class="bg2 border-right border-top border-bottom"></div>
                <div class="bg1 border-right border-top border-bottom"></div>
                <div class="bg2 border-right border-top border-bottom"></div>
            </div>
            <div id="active9">
                <button class="btn" id="btn1" type="submit"><img class="btn-img" src="resources/work/imagesave.PNG"></button>
                <button class="btn" id="btn2" type="submit"><img class="btn-img" src="resources/work/save.PNG"></button>
                <button class="btn" id="btn3" type="submit"><img class="btn-img" src="resources/work/exit.PNG"></button>
            </div>
        </div>
    </div>
</div>
</body>
</html>