<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    ev.target.appendChild(document.getElementById(data));
}


</script>
<body>
	<div id="helpBox">
		<div id="active6">
			<input id="text" type="text" placeholder="제목을 입력해주세요.">
		</div>
	</div>
	<div class="contain">
		<div class="side">
				<div id="active">
								<div class="p4">벽</div>
								<div class="active8-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
									<img id="image94" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall1.png">
								</div>
								<div class="active8-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
									<img id="image95" draggable="true" ondragstart="drag(event)" src="resources/img/wall/wall2.png">
								</div>
								<div class="p4">문</div>
								<div class="active7-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
									<img id="image96" draggable="true" ondragstart="drag(event)" src="resources/img/door/door1.png">
								</div>
								<div class="active7-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
									<img id="image97" draggable="true" ondragstart="drag(event)" src="resources/img/door/door2.png">
								</div>
					<div class="p1">침대</div>
					<div id="active3">
						<div class="active3-1" ondrop="drop(event)" ondragover="allowDrop(event)">
							<img id="image9" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed1.png">
						</div>
						<div class="active3-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image10" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed2.png">
						</div>
						<div class="active3-3" ondrop="drop(event)"
							ondragover="allowDrop(event)">
							<img id="image11" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed3.png">
						</div>
						<div class="active3-4" ondrop="drop(event)"
							ondragover="allowDrop(event)">
							<img id="image12" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed4.png">
						</div>
						<div class="active3-5" ondrop="drop(event)"
							ondragover="allowDrop(event)">
							<img id="image13" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed5.png">
						</div>
						<div class="active3-5" ondrop="drop(event)"
							ondragover="allowDrop(event)">
							<img id="image14" draggable="true" ondragstart="drag(event)" src="resources/img/bed/bed6.png">
						</div>

					</div>
					<div class="p2">의자</div>
					<div id="active4">
						<div class="active4-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image15" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair1.png">
						</div>
						<div class="active4-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image16" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair2.png">
						</div>
						<div class="active4-3" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image17" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair3.png">
						</div>
						<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image18" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair4.png">
						</div>
						<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image19" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair5.png">
						</div>
						<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image20" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair6.png">
						</div>
						<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image21" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair7.png">
						</div>
						<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image22" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair8.png">
						</div>
						<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image23" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair9.png">
						</div>
						<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image24" draggable="true" ondragstart="drag(event)" src="resources/img/chair/chair10.png">
						</div>
					</div>
					<div class="p3">책상</div>
					<div id="active5">
						<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image25" draggable="true" ondragstart="drag(event)" src="resources/img/table/table1.png">
						</div>
						<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image26" draggable="true" ondragstart="drag(event)" src="resources/img/table/table2.png">
						</div>
						<div class="active5-3" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image27" draggable="true" ondragstart="drag(event)" src="resources/img/table/table5.png">
						</div>
						<div class="active5-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image28" draggable="true" ondragstart="drag(event)" src="resources/img/table/table4.png">
						</div>
						<div class="active5-5" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image29" draggable="true" ondragstart="drag(event)" src="resources/img/table/table6.png">
						</div>
						<div class="active5-6" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image30" draggable="true" ondragstart="drag(event)" src="resources/img/table/table7.png">
						</div>
						<div class="active5-7" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image31" draggable="true" ondragstart="drag(event)" src="resources/img/table/table8.png">
						</div>
						<div class="active5-8" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
							<img id="image32" draggable="true" ondragstart="drag(event)" src="resources/img/table/table9.png">
						</div>
						<div class="p3">소파</div>
						<div id="active3">
							<div class="active4-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image33" src="resources/img/sofa/sofa1.png">
							</div>
							<div class="active4-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image34" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa2.png">
							</div>
							<div class="active4-3" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image35" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa3.png">
							</div>
							<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image36" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa4.png">
							</div>
							<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image37" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa5.png">
							</div>
							<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image38" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa6.png">
							</div>
							<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image39" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa7.png">
							</div>
							<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image40" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa8.png">
							</div>
							<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image41" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa9.png">
							</div>
							<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
								<img id="image42" draggable="true" ondragstart="drag(event)" src="resources/img/sofa/sofa10.png">
							</div>
							<div class="p3">피아노</div>
							<div id="active5">
								<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
									<img id="image43" draggable="true" ondragstart="drag(event)" src="resources/img/piano/piano1.png">
								</div>
								<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
									<img id="image44" draggable="true" ondragstart="drag(event)" src="resources/img/piano/piano2.png">
								</div>
								<div class="p3">TV</div>
								<div id="active5">
									<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
										<img id="image45" draggable="true" ondragstart="drag(event)" src="resources/img/TV/TV1.png">
									</div>
									<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
										<img id="image46" draggable="true" ondragstart="drag(event)" src="resources/img/TV/TV2.png">
									</div>
									<div class="p3">냉장고</div>
									<div id="active5">
										<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image47" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator1.png">
										</div>
										<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image48" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator2.png">
										</div>
										<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image49" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator3.png">
										</div>
										<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image50" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator4.png">
										</div>
										<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image51" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator5.png">
										</div>
										<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image52" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator6.png">
										</div>
										<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image53" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator7.png">
										</div>
										<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image54" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator8.png">
										</div>
										<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image55" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator9.png">
										</div>
										<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
											<img id="image56" draggable="true" ondragstart="drag(event)"
												src="resources/img/refrigerator/refrigerator10.png">
										</div>
										<div class="p3">세탁기</div>
										<div id="active5">
											<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image57" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine1.png">
											</div>
											<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image58" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine2.png">
											</div>
											<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image59" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine3.png">
											</div>
											<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image60" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine4.png">
											</div>
											<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image61" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine5.png">
											</div>
											<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image62" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine6.png">
											</div>
											<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image63" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine7.png">
											</div>
											<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image64" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine8.png">
											</div>
											<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image65" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine9.png">
											</div>
											<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
												<img id="image66" draggable="true" ondragstart="drag(event)"
													src="resources/img/washingmachine/washingmachine10.png">
											</div>
											<div class="p3">식탁</div>
											<div id="active5">
												<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
													<img id="image67" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable1.png">
												</div>
												<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
													<img id="image68" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable2.png">
												</div>
												<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
													<img id="image69" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable3.png">
												</div>
												<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
													<img id="image70" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable4.png">
												</div>
												<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
													<img id="image71" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable5.png">
												</div>
												<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
													<img id="image72" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable6.png">
												</div>
												<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
													<img id="image73" draggable="true" ondragstart="drag(event)"
														src="resources/img/diningtable/diningtable7.png">
												</div>
												<div class="p3">드레서</div>
												<div id="active5">
													<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image74" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser1.png">
													</div>
													<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image75" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser2.png">
													</div>
													<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image76" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser3.png">
													</div>
													<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image77" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser4.png">
													</div>
													<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image78" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser5.png">
													</div>
													<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image79" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser6.png">
													</div>
													<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image80" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser7.png">
													</div>
													<div class="active5-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image81" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser8.png">
													</div>
													<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
														<img id="image82" draggable="true" ondragstart="drag(event)" src="resources/img/dresser/dresser9.png">
													</div>
													<div class="p3">옷장</div>
													<div id="active5">
														<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
															<img id="image83"
																src="resources/img/wardrobe/wardrobe1.png">
														</div>
														<div class="active4-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
															<img id="image84" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe2.png">
														</div>
														<div class="active4-3" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
															<img id="image85" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe3.png">
														</div>
														<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
															<img id="image86" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe4.png">
														</div>
														<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
															<img id="image87" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe5.png">
														</div>
														<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
															<img id="image88" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe6.png">
														</div>
														<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
															<img id="image89" draggable="true" ondragstart="drag(event)"
																src="resources/img/wardrobe/wardrobe7.png">
														</div>
														<div class="p3">화장대</div>
														<div id="active5">
															<div class="active5-1" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
																<img id="image90" draggable="true" ondragstart="drag(event)"
																	src="resources/img/dressingtable/dressingtable1.png">
															</div>
															<div class="active4-2" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
																<img id="image91" draggable="true" ondragstart="drag(event)"
																	src="resources/img/dressingtable/dressingtable2.png">
															</div>
															<div class="active4-3" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
																<img id="image92" draggable="true" ondragstart="drag(event)"
																	src="resources/img/dressingtable/dressingtable3.png">
															</div>
															<div class="active4-4" ondrop="drop(event)" 
							ondragover="allowDrop(event)">
																<img id="image93" draggable="true" ondragstart="drag(event)"
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
				<img id="help" type="image" src="resources/work/help.PNG">
				<!-- The Modal -->
				<div id="myModal1" class="modal1">

					<!-- Modal content -->
					<div class="modal-content1">
						<span class="close1">&times;</span>
						<p>드래그 해주세요.</p>
					</div>
				</div>
				<div class="big1">
					<div class="bg1 border-left border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="bg2 border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="bg1 border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="bg2 border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="bg1 border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="bg2 border-left border-right border-top"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top" ondrop="drop(event)"
						ondragover="allowDrop(event)"></div>

					<div class="bg1 border-left border-right border-top border-bottom"
					ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg1 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
					<div class="bg2 border-right border-top border-bottom"
						ondrop="drop(event)" ondragover="allowDrop(event)"></div>
				</div>
				<div id="active9">
					<button class="btn" id="btn2" type="submit">
						<img class="btn-img" src="resources/work/save.PNG">
					</button>
					<button class="btn" id="btn3" type="submit">
						<img class="btn-img" src="resources/work/exit.PNG">
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>