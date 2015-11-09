<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<script>
<!-- 공지사항 글 수정 유효성 검사 -->
$(document)
		.ready(
				function() {
					$('#update')
							.click(
									function() {
										if ($('#title').val() == ""
												&& $('#contents').val() == "") {
											alert('제목 및 내용을 입력해주세요.');
											$('#title').focus();
											return false
										} else if ($('#title').val() == "") {
											alert('제목을 입력해주세요.');
											$('#title').focus();
											return false;
										} else if ($('#contents').val() == "") {
											alert('내용을 입력해주세요.');
											$('#contents').focus();
											return false;
										} else if (document
												.getElementById('files[0]').value != null) {
											var img = document
													.getElementById('files[0]').value;
											img = img.slice(
													img.indexOf(".") + 1)
													.toLowerCase();
											if (img != "jpg"
													&& img != "png"
													&& img != "gif"
													&& img != "bmp") {
												alert('이미지 파일만 등록 가능합니다.');
												return false;
											}//확장자를 확인합니다.
										} else if (document
												.getElementById('files[1]').value != null) {
											var img1 = document
													.getElementById('files[1]').value;
											img1 = img1.slice(
													img.indexOf(".") + 1)
													.toLowerCase();
											if (img1 != "jpg"
													&& img1 != "png"
													&& img1 != "gif"
													&& img1 != "bmp") {
												alert('이미지 파일만 등록 가능합니다.');
												return false;
											}//확장자를 확인합니다.
										} else if (document
												.getElementById('files[2]').value != null) {
											var img2 = document
													.getElementById('files[2]').value;
											img2 = img2.slice(
													img.indexOf(".") + 1)
													.toLowerCase();
											if (img2 != "jpg"
													&& img2 != "png"
													&& img2 != "gif"
													&& img2 != "bmp") {
												alert('이미지 파일만 등록 가능합니다.');
												return false;
											}//확장자를 확인합니다.	  
										} else {
											$("#noticeupdate").submit();
										}
									});
				});
</script>
<script>
<!--파일추가 버튼 클릭시 append를 이용하여 <input type="file" 이 생성됨 -->
$(document).ready(function() {
	$('#addFile').click(function() { 
		var fileIndex = $('#fileview tr').length; //<table id="fileview"> 밑에 tr 갯수을 fileIndex에 담음
		if (Number(fileIndex) >= '3') { //file Upload 갯수를 3개로 제한
			alert('FILE UPLOAD는 3개만 가능 합니다.');
			return;
		}
		var i = $('#fileview tr').length;
		if(Number(i) >= '3'){
			return;
		}
		$('#fileview').append(
				'<tr><td>'
					+ '   <input type="file" id="files['+ fileIndex +']" name="files['+ fileIndex +']" onchange="imageURL'+(i+1)+'(this)" />'
					+ '</td></tr>');
		});
		
});
</script>
<script type="text/javascript">
function imageURL1(input) {

	//이미지 확장자 유효성 검사 
	var img = document.getElementById('files[0]').value; //파일을 추가한 input 박스의 값
	img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	if (img != "jpg" && img != "png" && img != "gif" && img != "bmp") { //확장자를 확인합니다.
		alert('이미지 파일만 등록 가능합니다.');
		return;
	}

	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#img1').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

function imageURL2(input) {

	//이미지 확장자 유효성 검사 
	var img = document.getElementById('files[1]').value; //파일을 추가한 input 박스의 값
	img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	if (img != "jpg" && img != "png" && img != "gif" && img != "bmp") { //확장자를 확인합니다.
		alert('이미지 파일만 등록 가능합니다.');
		return;
	}

	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#img2').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
function imageURL3(input) {
	//이미지 확장자 유효성 검사 
	var img = document.getElementById('files[2]').value; //파일을 추가한 input 박스의 값
	img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	if (img != "jpg" && img != "png" && img != "gif" && img != "bmp") { //확장자를 확인합니다.
		alert('이미지 파일만 등록 가능합니다.');
		return;
	}

	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#img3').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
</head>

<body>
<div class="wrap">
		<div class="header" align="center">
			<div class="toparea" align="right">
			<c:choose>
	  			<c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
					<jsp:include page="main/memLogout.jsp" />
				</c:when> 
				<c:when test="${(sessionScope.userLoginInfo == null)}">
					<jsp:include page="main/selectLogin.jsp" /> 
				</c:when>
			</c:choose>
			
			</div>
			<a href="main"><img src="img/mlogo.png" width="360px"
				height="160px"></a>
		</div>
		<div id="menu">
  	<jsp:include page="main/menubar.jsp" />
  </div>
  <div class="contents" align="center">
  <img src="img/customercenter.png" usemap="#Map">
<map name="Map">
			    <area shape="rect" coords="651,34,716,58" href="noticeListForm">
			    <area shape="rect" coords="770,35,817,56" href="eventListForm">
			    <area shape="rect" coords="866,36,901,54" href="qnaListForm">
		      </map>
	<form id= "qnaUpdate" action="qnaUpdate" method="post" enctype="multipart/form-data">
	<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
      	<script type="text/javascript">
      	location.href='loginForm';
      	</script>
      	</c:when>
	</c:choose>
	</c:if>
	<input type="hidden" name="qnano" value="${qnaUpdateForm.qnano}">
	    <center>
    <table cellpadding="4">
       <tr> 
         <th width = "200" align = "center">제목</th><td>  
         <input type = "text" id = "title" name = "title" size="114" value = "${qnaUpdateForm.title}">
         </td>
       </tr>
       <tr> 
         <th width = "200" align ="center">작성자</th><td>${qnaUpdateForm.writer}</td>
       </tr>
       <tr> 
        	<th width = "200" align = "center">내용</th>
        	<td>
       			<c:choose>
				<c:when test="${qnaUpdateForm.fileName != null}">
					  <img id="img1" src="/KickOff/img/${qnaUpdateForm.fileName}" width="95%"><br>
					<input type="hidden" value="${qnaUpdateForm.fileName}" name="fileName">
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${qnaUpdateForm.fileName == null}">
					<img id="img1" src=""><br>
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${qnaUpdateForm.fileName2 != null}">
					<img id="img2" src="/KickOff/img/${qnaUpdateForm.fileName2}" width = "95%"><br>
					<input type="hidden" value="${qnaUpdateForm.fileName2}" name="fileName2">
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${qnaUpdateForm.fileName2 == null}">
					<img id="img2" src=""><br>
				</c:when>  
			</c:choose> 
         	<c:choose>		 
				<c:when test="${qnaUpdateForm.fileName3 != null}">
					<img id="img3" src="/KickOff/img/${qnaUpdateForm.fileName3}" width = "95%"><br>		
					<input type="hidden" value="${qnaUpdateForm.fileName3}" name="fileName3">	
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${qnaUpdateForm.fileName3 == null}">
					<img id="img3" src=""><br>
				</c:when>
			</c:choose>
			<textarea rows="7" cols="85" id="contents" name = "contents" >${qnaUpdateForm.contents}</textarea>
			
       		</td>
       </tr>
       <tr>
       	<th width = "50" align = "cetner">이미지첨부</th>
       <tr>
							<td align="center"><img src="img/ImageAdd.png" id="addFile"></td>
							<td>
								<table id="fileview">

								</table>
							</td>
						</tr>
       <tr></tr><tr></tr>
      </table>
      <img src = "img/gomodifybtn.png" id = "update">
      <input type = "image" src = "img/golistbtn.png" onclick="location.href='qnaListForm'">
      <!-- <input type="button" value="수정" id="update">
      <input type="button" value="목록" onclick="location.href = 'noticeListForm'"> -->
	
	<input type="hidden" id = "writer" name="writer" value="${qnaUpdateForm.writer}">
  </center>
</form>
 <center>
  	<jsp:include page="main/bottom.jsp" /> <!-- footer end --><!-- wrap end -->
</center>
</body>
</html>