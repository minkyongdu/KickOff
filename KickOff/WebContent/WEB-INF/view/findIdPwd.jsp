<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>통합 찾기</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</head>
<body>
<div class="wrap">
  <div class="header" align="center">
	  	<div class="toparea" align="right">
	  		<jsp:include page="main/selectLogin.jsp" />
		</div>
 	<a href="main"><img src="img/mlogo.png" width="360px" height="160px"></a>
  </div> <!-- header end -->
  <jsp:include page="main/menubar.jsp" />
 <div class="contents" align="center">
 <img src="img/findidpwd.png">
 <form action = "IDfindhandel"> 
 	<table width="600px" height="130px" border="0">
  <tr>
    <td align="right" valign="middle" style="width: 182px; ">이름</td>
    <td align="left" valign="middle"><input type="text" size="29" name = "name"/></td>
  </tr>
  <tr>
    <td align="right" valign="middle">이메일</td>
    <td align="left" valign="middle"><input type="text" size="29" name = "email" /></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="middle" style="height: 30px; "><input type="image" src="img/findidbtn.png" /></td>
  </tr>
</table>
</form>
	<br>
	<hr>
	<table width="600px" height="130px" border="0">
<form action= "passwordfindhandel">
	  <tr>
	    <td align="right" valign="middle"  style="width: 182px; ">아이디</td>
	    <td align="left" valign="middle"><input type="text" size="29" name = "id"/></td>
	  </tr>
	  <tr>
	    <td align="right" valign="middle">비밀번호 질문</td>
	    <td align="left" valign="middle">
	    	<select name = "pwdQ">
	    		<option selected>선택</option>
	    		<option>사는 곳이 어디입니까?</option>
                <option>어머니의 성함은?</option>
                <option>아버지의 성함은?</option>
                <option>내가 태어난 곳은?</option>
                <option>내가 다닌 초등학교는?</option>
                <option>나의 좌우명은?</option>
	    	</select>
	    </td>
	  </tr>
	  <tr>
	    <td align="right" valign="middle">비밀번호 답변</td>
	    <td align="left" valign="middle"><input type="text" size="29" name = "pwdA"/></td>
	  </tr>
	  <tr>
	    <td colspan="2" align="center" valign="middle" style="height: 30px;"><input type="image" src="img/findpwdbtn.png" /></td>
	  </tr>
</table>
 </div> 
 </form>
 <!-- contents -->
  
  <div class="footer" align="center">
  	<img src="img/copyright.png" width="960px" height="150px"> 
  </div> <!-- footer end -->
</div> <!-- wrap end -->
</body>
</html>