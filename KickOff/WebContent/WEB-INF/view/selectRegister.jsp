<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 선택지</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</head>
<body>
<div class="wrap">
  <div class="header" align="center">
	  	<div class="toparea" align="right">
	  		<c:choose>
	  			<c:when test="${sessionScope.userLoginInfo.memGrade == 1}">
		  			<jsp:include page="main/memLogout.jsp" />
	  			</c:when>
	  			<c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
		  			<jsp:include page="main/memLogout.jsp" />
	  			</c:when>
		  		<c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
		  			<jsp:include page="main/comLogout.jsp" />
		  		</c:when>
		  		<c:when test="${(sessionScope.userLoginInfo == null) || (sessionScope.comLoginInfo == null)}">
		  			<jsp:include page="main/selectLogin.jsp" /> 
				</c:when>
	  		</c:choose>
		</div>
 	<a href="/KickOff/"><img src="img/mlogo.png" width="360px" height="160px"></a>
  </div> <!-- header end -->
<tr>
			<td width="150" height="20" colspan="2">
			<jsp:include page="main/menubar.jsp" /></td>
		</tr>

 <div class="contents" align="center">
 <img src="img/fregister.png">
<table width="200" border="0" cellspacing="100">
  <tr>
    <td><a href="regterm"><img src="img/normaljoin.png"></a></td>
    <td><a href="comregterm"><img src="img/comjoin.png" width="200" height="300"></a></td>
  </tr>
</table>
</center>
</div> <!-- contents -->

  <tr>
 		<td width = "150" height = "150" colspan="2">
			<jsp:include page="main/bottom.jsp" />
		</td>
</tr>
</body>
</html>