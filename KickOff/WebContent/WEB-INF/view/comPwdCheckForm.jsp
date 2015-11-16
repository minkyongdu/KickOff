<%@page import="kickoff.model.beans.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<body class="kortext">
<div class="wrap">
   <div class="header" align="center">
      <div class="toparea" align="right">
           <c:choose>
            <c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
               <jsp:include page="main/comLogout.jsp" />
            </c:when>
         </c:choose>
         <c:choose>
            <c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
               <jsp:include page="main/memLogout.jsp" />
            </c:when>
         </c:choose>
      </div>
       <a href="/KickOff/"><img src="img/mlogo.png" width="360px" height="160px"></a>
     </div> <!-- header end -->
   <jsp:include page="main/menubar.jsp" />
   <c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
      	<script type="text/javascript">
      	location.href='loginForm';
      	</script>
      	</c:when>
	</c:choose>
	</c:if>
   <div class="contents" align="center">
      <img src="img/cominfomodify.png">
      <form action = "comPasswordCheck">
      <br><br><br><br><br><br>  
      	<input type = "hidden" id = "id" name = "id" value = "${sessionScope.comLoginInfo.id}">
				<table width="273" height="218" border="1">
					<tr>
						<td height="47" align="center" valign="middle">
						<img src = "img/modifyready.png"></td> 
					</tr>
					<tr>
						<td height="68" align="center" valign="middle">
						<input type="password" id = "password" name = "password"/></td>
					</tr>
					<tr>
						<td height="48" align="center" valign="middle"> 
						<input type="image" src="img/enterAddbtn.png"/></td>
					</tr>
				</table> 
			</form>
      <!-- contents -->
      <br><br><br><br><br><br>
   <div class="footer" align="center">
        <img src="img/copyright.png" width="960px" height="150px"> 
     </div> <!-- footer end -->
</div><!-- wrap end -->
</body>
</html>