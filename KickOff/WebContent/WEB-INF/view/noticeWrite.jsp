<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글쓰기</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<script>
	<!-- 공지사항 글 입력 유효성 검사 -->
	   $(document).ready(function (){
	      $('#insert').click(function() {
	         var img = document.getElementById('files[0]').value; //파일을 추가한 input 박스의 값
	         img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	         var img1 = document.getElementById('files[1]').value; //파일을 추가한 input 박스의 값
	         img1 = img1.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	         var img2 = document.getElementById('files[2]').value; //파일을 추가한 input 박스의 값
	         img2 = img2.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	         
	         if($('#title').val()==""&&$('#content').val()==""&&$('#writer').val()==""){
	            alert('제목과 내용을 입력해주세요.');
	            $('#title').focus();
	         }else if($('#title').val()==""){
	            alert('제목을 입력해주세요.');
	            $('#title').focus();
	         }else if($('#content').val()==""){
	            alert('내용을 입력해주세요.');
	            $('#content').focus();
	         }else if($('#writer').val()==""){
	            alert("로그인을 해주세요.");
	            location.href='loginForm';
	         }else if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
	            alert('이미지 파일만 등록 가능합니다.');
	            return false;
	         }else if(img1 != "jpg" && img1 != "png" &&  img1 != "gif" &&  img1 != "bmp"){ //확장자를 확인합니다.
	            alert('이미지 파일만 등록 가능합니다.');
	            return false;
	         }else if(img2 != "jpg" && img2 != "png" &&  img2 != "gif" &&  img2 != "bmp"){ //확장자를 확인합니다.
	            alert('이미지 파일만 등록 가능합니다.');
	            return false;
	         }else{
	            $("#form").submit();
	         }
	      });
	   });
</script>
<script type="text/javascript">
//첫번째 이미지 
function imageURL1(input) {
	//이미지 확장자 유효성 검사 
	var img = document.getElementById('files[0]').value; //파일을 추가한 input 박스의 값
	img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
		alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
		return;
	}
	if($('#'))
	//파일을 선택시 이미지 미리보기
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
		    $('#img1').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}

//2번째 이미지
function imageURL2(input) {
	
	//이미지 확장자 유효성 검사 
	var img = document.getElementById('files[1]').value; //파일을 추가한 input 박스의 값
	img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
		alert('이미지 파일만 등록 가능합니다.');
		return;
	}
	
	//파일을 선택시 이미지 미리보기
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img2').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
	
}
//3번째 이미지
function imageURL3(input) {
	//이미지 확장자 유효성 검사 
	var img = document.getElementById('files[2]').value; //파일을 추가한 input 박스의 값
	img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
		alert('이미지 파일만 등록 가능합니다.');
		return;
	}
	
	//파일을 선택시 이미지 미리보기
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img3').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
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
				<img src="img/space.png" width="10px" height="20px">
					<jsp:include page="main/selectLogin.jsp" /> 
				</c:when>
			</c:choose>
			
			</div>
			<a href="main"><img src="img/mlogo.png" width="360px"
				height="160px"></a>
		</div> <!-- header end -->
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

<form method="post" id="form" action="noticeinsert" name="form" enctype="multipart/form-data">
	  <c:choose>
	  <c:when test="${sessionScope.userLoginInfo.memGrade != 6}">
         <script type="text/javascript">
         location.href='loginForm';
         </script>
      </c:when>
   </c:choose> 
  <tr>
    <td width="120" align = "center" colspan="2"><font size="5"><b>공지사항 작성</b></font></td>
  </tr>
  <center> 
  <table> 
  <tr></tr><tr></tr>
  <tr>
    <td align = "center">글제목</td>
    <td valign="middle"><input type=text id="title" name=title style=" width:700px"></td>
  </tr>
  <tr>
    <td align = "center">글내용</td>
    <td valign="middle"><textarea id = "content" name = "contents" style="width: 700px; height: 200px;"></textarea></td>
  </tr>
  <tr>
  	<td align = "center">미리보기</td>
	<td align = "center"> 
		<img id="img1" src="" height="150" width="230">	
		<img id="img2" src="" height="150" width="230">
		<img id="img3" src="" height="150" width="230">
	</td>  
  </tr>
  <tr>
    <td align = "center"><img src = "img/ImageAdd.png" id = "addFile"></td>
    	<td>
    		<table id="fileview">
    	
    		</table> 
    	</td>
  </tr>
  <tr> 
    <td colspan="2" align="center" valign="middle">  
    </td>
    </tr>
  <tr>
    <td colspan="2" align="center" valign="middle">
    <input type = "image" src = "img/writebtn.png" id = "insert">&nbsp;&nbsp;
    <a href = "main"><img src = "img/sback.png"></a></td>
    </tr>

</table>
</center>
<input type="hidden" name="writer"
					value="${sessionScope.userLoginInfo.name}">
			<input type="hidden" name="boardNum" 
				value="1"> <!-- 공지사항 번호 : 1번 -->
</form>
</div>
</div> <!-- contents -->
 <center>
  	<jsp:include page="main/bottom.jsp" /> <!-- footer end --><!-- wrap end -->
</center>
</body>
</html>