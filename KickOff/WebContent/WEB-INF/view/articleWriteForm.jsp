<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>  
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src = "js/imgWatch.js"></script>
<script type="text/javascript" src = "js/sizeamount.js"></script>
<script type="text/javascript"> 
 
/*  $('#productinsert').click(function(){
	  if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp")
		  {
		  	alert('해당 파일은 업로드 할 수 없습니다.');
		  	$('#files[0]').focus();
		  	return false;
		  }
  }); */
//파일을 선택시 이미지 미리보기
	function groupNum() { 
		var wind = null;
		 wind =  window.open('/KickOff/articleGroup', "articleGroup",
		         "toolbar=no ,width=300 ,height=500 ,directories=no,"
		               + "status=yes,scrollbars=yes,menubar=no");
		}
</script>
<body>
	<form method="post" name= "productForm" id="productForm" action="articleInsert" name="productForm"
       enctype="multipart/form-data">
      <c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
      	<script type="text/javascript">
      	location.href='loginForm';
      	</script>
      	</c:when>
	</c:choose>
	</c:if>
	<table border = "1">
		<tr>
			<td>제품이름 : </td><td><input type = "text" id="Aname" name = "Aname"></td>
		</tr>
		<tr>
			<td>가격 : </td><td><input type = "text" id="price" name = "price"></td>
		</tr>
		<tr>
			<td width = "400">분류 번호 : 
			<input type = "text" id = "groupNum" name = "groupNum" size = "2" readonly>
			<a href = "javascript:groupNum();" id="groupImg">
				<img src = "임시사진">
			</a>
			<input type = "button" id = "selectbutton" value = "사이즈 선택하기">
			</td>
		</tr>
		<tr>
			<td colspan = "6"><center>사이즈/갯수</center></td>
		</tr> 
		<tr>
			<td colspan="6"><center>미리보기</center></td>
		</tr>
		<tr>
			<td></td>
			<td><img src = "" id= "img1" width="150" height="150"></td>
			<td><img src = "" id= "img2" width="150" height="150"></td>
			<td><img src = "" id= "img3" width="150" height="150"></td>
			<td><img src = "" id= "img4" width="150" height="150"></td>
			<td><img src = "" id= "img5" width="150" height="150"></td>
		</tr>
		<tr>
			<td> 
				 <table id = "fileview">

				 </table>
			</td>
		</tr>
		<tr>
			<td>
				<table id = "sizeamountview">
				 
				</table> 
			</td> 
		</tr> 
	</table>
	<input type = "hidden" name= "companyNum" id = "companyNum" value = "${sessionScope.comLoginInfo.companyNum}">
	<input type ="submit" id="productinsert" value = "작성하기">
	<input type="button" id="addFile"  value="이미지추가">
	<input type = "button" id = "restartSizeamount" onclick="location.href='articleWriteForm'" value = "다시 작성하기">
	<input type="button" id="addEngamount" value = "영어사이즈&수량">
	<input type="button" id="addNumamount" value = "숫자사이즈&수량">
	<input type="button" id="addNoneamount" value = "기본사이즈&수량">
	<input type="button" id = "addSocksamount" value = "양말사이즈&수량">
	<input type= "button" id = "addGlovesamount" value = "장갑사이즈&수량">
	</form>
</body>
</html>