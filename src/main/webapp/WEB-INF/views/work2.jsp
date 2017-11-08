<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String ws_no = request.getParameter("ws_no");
	if(ws_no == null){
		response.sendRedirect("main");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/trois/resources/work.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>작업화면</title>
</head>
<script type="text/javascript" src="/trois/resources/js/html2canvas.js"></script>
<script>
var ws_no = <%=ws_no%>;
var ws_class = "";
var ws_src = "";
var ws_index = "";
var addItems = [];
var addItems2 = [];
var imgdown = "";
$(document).ready(function() {
	
	$.ajax({
		type : "post", // post 방식으로 통신 요청
		url : "workSelectData", // Spring에서 만든 URL 호출
		data : {ws_no: ws_no} // 파라메터로 사용할 변수 값 객체 넣기
	}).done(function(result) { // 비동기식 데이터 가져오기
		addItems2 = result.list;
		$("#text").val(result.workSave.title);
		createItems();
	}).fail(function(d,s,x){
		alert("ajax 안됨");
	});
	
	function createItems(){
		for(var i = 0; i < addItems2.length; i++){
			$(".big1 div").eq(addItems2[i].indexs).append('<img id="item' + addItems2[i].indexs + '" class="' + addItems2[i].class1 + '" draggable="true" ondragstart="drag(event)" src="' + addItems2[i].src + '">');
			addItems.push({"id": 'item' + addItems2[i].indexs,"class1": addItems2[i].class1, "src": addItems2[i].src, "index":addItems2[i].indexs});
		}
	}
	
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
	
	$("#forA").hide();
	;;;;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
	$("#btn1").off().on("click", function(){
		
		if(confirm("이미지 저장을 하시겠습니까?")){
			$("#btn1").hide();
			
			html2canvas($("#main"), {
				onrendered: function(canvas){
					
					imgdown = canvas.toDataURL();
					 imgEvent();
		               // toDataURL() 가져온 데이터를 주소값으로 변경 하는 부분
// 		                $("div").html("<img src='" + img + "'>");
		               // 특정 위치에 화면으로 표현 하는 부분
				}
			});
	    }else{ 
	    alert("취소되었습니다.");
	    }
	});
	
	function imgEvent(){
        var title = $("#text").val();
        if(title == ""){
           title = "img.png";
        } 
        var html = '<a href="' + imgdown + '" download="' + title + '">다운로드</a>';
        $("#forA").show();
        $("#forA").html(html);
        
        $("#forA a").on("click", function(){
        	$("#forA").hide();
        	$("#btn1").show();
        });
     }
	
	//<img class="btn-img" src="resources/work/imagesave.PNG">
     
     $("form").submit(function( event ) {
          event.preventDefault(); // 자동으로 submit 막기!
          var formData = new FormData();
          formData.append('file', imgdown);
     });
	

	$("#btn3").click(function(){
		if(confirm("나가시겠습니까?")){
	    location.href="myroom";
	    }else{ 
	    alert("취소되었습니다.");
	    }
	});
	
	$("#btn2").on('click', function () {
	    if(confirm("저장을 하시겠습니까?")){
	    	if((addItems == null) || ($("#text").val() == "")){
	    		alert("제목이나 도구를 확인해 주세요.");
	    	}else if((addItems != null) && ($("#text").val() != "")){
			    	$.ajax({
						type : "post", // post 방식으로 통신 요청
						url : "workUpdate", // Spring에서 만든 URL 호출
						data : {list: JSON.stringify(addItems), title: $("#text").val(), ws_no: ws_no} // 파라메터로 사용할 변수 값 객체 넣기
					}).done(function(result) { // 비동기식 데이터 가져오기
						if(result.state == 1){
							location.href = "myroom";
						}else{
							alert("처음부터 하시길.. ㅋ");
							location.href = "main";
						}
					}).fail(function(d,s,x){
						alert("ajax 안됨");
					});
	    	}
	    }else{
	    	alert("취소되었습니다.");
	    }
	});
});

function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    $.each($("#active img"), function( index, value ) {
    	if(data.substr(data.indexOf("resources"), data.length) == $(value).attr("src")) { 
    		$(ev.target).append('<img id="item' + $(".big1 div").index(ev.target) + '" class="' + $(value).attr("class") + '" draggable="true" ondragstart="drag(event)" src="' + $(value).attr("src") + '">');
    		addItems.push({"class1": $(value).attr("class"), "src":$(value).attr("src"), "index":$(".big1 div").index($(ev.target))});
    	}
    });
}

function drop2(ev) {
	ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    for(var i = 0; i < addItems.length; i++){
		if(data == addItems[i].id){
			$(".big1 div").eq(addItems[i].index).empty();
			addItems.splice(i, 1);
		}    	
    }
}


</script>
<body>
	<div id="helpBox">
		<div id="active6">
			<input id="text" type="text" placeholder="제목을 입력해주세요.">
			<img id="help" type="image" src="resources/work/help.PNG">
		</div>
	</div>
	<div class="contain">
		<div class="side">
				<div id="active">
								<div class="p4">벽</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall3.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image94" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall1.png">
								</div>
								<div class="active8-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image95" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall2.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall4.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall5.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall6.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall7.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall8.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall9.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall10.png">
								</div>
								<div class="active8-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image40" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall11.png">
								</div>
								<div class="p4">문</div>
								<div class="active7-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image96" draggable="true" ondragstart="drag(event)" src="resources/img/door/door1.png">
								</div>
								<div class="active7-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image97" draggable="true" ondragstart="drag(event)" src="resources/img/door/door2.png">
								</div>
								<div class="active7-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image97" draggable="true" ondragstart="drag(event)" src="resources/img/door/door3.png">
								</div>
								<div class="active7-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image97" draggable="true" ondragstart="drag(event)" src="resources/img/door/door4.png">
								</div>
					<div class="p1">침대</div>
					<div id="active3">
						<div class="active3-1" ondrop="drop2(event)" ondragover="allowDrop(event)">
							<img class="image9" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed1.png">
						</div>	
						<div class="active3-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image10" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed2.png">
						</div>
						<div class="active3-3" ondrop="drop2(event)"
							ondragover="allowDrop(event)">
							<img class="image11" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed3.png">
						</div>
						<div class="active3-4" ondrop="drop2(event)"
							ondragover="allowDrop(event)">
							<img class="image12" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed4.png">
						</div>
						<div class="active3-5" ondrop="drop2(event)"
							ondragover="allowDrop(event)">
							<img class="image13" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed5.png">
						</div>
						<div class="active3-5" ondrop="drop2(event)"
							ondragover="allowDrop(event)">
							<img class="image14" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed6.png">
						</div>

					</div>
					<div class="p2">의자</div>
					<div id="active4">
						<div class="active4-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image15" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair1.png">
						</div>
						<div class="active4-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image16" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair2.png">
						</div>
						<div class="active4-3" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image17" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair3.png">
						</div>
						<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image18" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair4.png">
						</div>
						<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image19" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair5.png">
						</div>
						<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image20" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair6.png">
						</div>
						<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image21" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair7.png">
						</div>
						<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image22" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair8.png">
						</div>
						<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image23" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair9.png">
						</div>
						<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image24" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair10.png">
						</div>
					</div>
					<div class="p3">책상</div>
					<div id="active5">
						<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image25" draggable="true" ondragstart="drag(event)" src="resources/img/table/table1.png">
						</div>
						<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image26" draggable="true" ondragstart="drag(event)" src="resources/img/table/table2.png">
						</div>
						<div class="active5-3" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image27" draggable="true" ondragstart="drag(event)" src="resources/img/table/table5.png">
						</div>
						<div class="active5-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image28" draggable="true" ondragstart="drag(event)" src="resources/img/table/table4.png">
						</div>
						<div class="active5-5" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image29" draggable="true" ondragstart="drag(event)" src="resources/img/table/table6.png">
						</div>
						<div class="active5-6" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image30" draggable="true" ondragstart="drag(event)" src="resources/img/table/table7.png">
						</div>
						<div class="active5-7" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image31" draggable="true" ondragstart="drag(event)" src="resources/img/table/table8.png">
						</div>
						<div class="active5-8" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
							<img class="image32" draggable="true" ondragstart="drag(event)" src="resources/img/table/table9.png">
						</div>
						<div class="p3">소파</div>
						<div id="active3">
							<div class="active4-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image33" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa1.png">
							</div>
							<div class="active4-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image34" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa2.png">
							</div>
							<div class="active4-3" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image35" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa3.png">
							</div>
							<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image36" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa4.png">
							</div>
							<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image37" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa5.png">
							</div>
							<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image38" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa6.png">
							</div>
							<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image39" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa7.png">
							</div>
							<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image41" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa9.png">
							</div>
							<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
								<img class="image42" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa10.png">
							</div>
							<div class="p3">피아노</div>
							<div id="active5">
								<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image43" draggable="true" ondragstart="drag(event)" src="resources/img/piano/piano1.png">
								</div>
								<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
									<img class="image44" draggable="true" ondragstart="drag(event)" src="resources/img/piano/piano2.png">
								</div>
								<div class="p3">TV</div>
								<div id="active5">
									<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
										<img class="image45" draggable="true" ondragstart="drag(event)" src="resources/img/TV/TV1.png">
									</div>
									<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
										<img class="image46" draggable="true" ondragstart="drag(event)" src="resources/img/TV/TV2.png">
									</div>
									<div class="p3">냉장고</div>
									<div id="active5">
										<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image47" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator1.png">
										</div>
										<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image48" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator2.png">
										</div>
										<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image49" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator3.png">
										</div>
										<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image50" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator4.png">
										</div>
										<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image51" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator5.png">
										</div>
										<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image53" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator7.png">
										</div>
										<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image54" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator8.png">
										</div>
										<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image55" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator9.png">
										</div>
										<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
											<img class="image56" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator10.png">
										</div>
										<div class="p3">세탁기</div>
										<div id="active5">
											<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image57" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine1.png">
											</div>
											<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image58" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine2.png">
											</div>
											<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image59" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine3.png">
											</div>
											<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image60" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine4.png">
											</div>
											<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image61" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine5.png">
											</div>
											<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image62" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine6.png">
											</div>
											<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image63" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine7.png">
											</div>
											<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image64" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine8.png">
											</div>
											<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
												<img class="image66" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine10.png">
											</div>
											<div class="p3">식탁</div>
											<div id="active5">
												<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
													<img class="image67" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable1.png">
												</div>
												<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
													<img class="image68" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable2.png">
												</div>
												<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
													<img class="image69" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable3.png">
												</div>
												<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
													<img class="image70" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable4.png">
												</div>
												<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
													<img class="image71" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable5.png">
												</div>
												<div class="p3">드레서</div>
												<div id="active5">
													<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image74" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser1.png">
													</div>
													<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image75" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser2.png">
													</div>
													<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image76" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser3.png">
													</div>
													<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image77" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser4.png">
													</div>
													<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image78" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser5.png">
													</div>
													<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image79" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser6.png">
													</div>
													<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image80" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser7.png">
													</div>
													<div class="active5-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image81" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser8.png">
													</div>
													<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
														<img class="image82" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser9.png">
													</div>
													<div class="p3">옷장</div>
													<div id="active5">
														<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
															<img class="image83" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe1.png">
														</div>
														<div class="active4-2" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
															<img class="image84" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe2.png">
														</div>
														<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
															<img class="image86" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe4.png">
														</div>
														<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
															<img class="image87" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe5.png">
														</div>
														<div class="p3">화장대</div>
														<div id="active5">
															<div class="active5-1" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
																<img class="image90" draggable="true" ondragstart="drag(event)"
																	src="resources/img/dressingtable/dressingtable1.png">
															</div>
															<div class="active4-3" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
																<img class="image92" draggable="true" ondragstart="drag(event)"
																	src="resources/img/dressingtable/dressingtable3.png">
															</div>
															<div class="active4-4" ondrop="drop2(event)" 
							ondragover="allowDrop(event)">
																<img class="image93" draggable="true" ondragstart="drag(event)"
																	src="resources/img/dressingtable/dressingtable4.png">
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</div>
						</div>
				</div>
		<div class="right">
			<div id="main">
				
				<!-- The Modal -->
				<div id="myModal1" class="modal1">

					<!-- Modal content -->
					<div class="modal-content1">
						<span class="close1">&times;</span>
						<p>왼쪽 카테고리에 있는 모형들을 판 안으로 옮겨주세요.
					       <br>이미지 저장: 버튼을 누르고 다운로드를 눌러주세요 png파일로 저장됩니다.
			               <br>저장: 버튼을 누르면 마이룸안에 저장이 됩니다.
			               <br>나가기: 마이룸으로 이동되면서 저장되어 있는 목록들이 보입니다.</p>
					</div>
				</div>
				<div class="big1">
					<div class="border-left border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="border-left border-right border-top border-bottom"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
				</div>
				<div id="active9">
				<button class="btn" id="btn1" type="submit">
						<img class="btn-img" src="resources/work/capture.PNG">
					</button>
					<button class="btn" id="btn2" type="submit">
						<img class="btn-img" src="resources/work/modify.PNG">
					</button>
					<button class="btn" id="btn3" type="submit">
						<img class="btn-img" src="resources/work/exit.PNG">
					</button>
					<div id="forA"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>