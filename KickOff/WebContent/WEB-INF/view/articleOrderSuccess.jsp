<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<body class="kortext">
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
         <script type="text/javascript">
         location.href='loginForm';
         </script>
         </c:when>
   </c:choose>
   </c:if>
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
  </div>
  <center> 
<jsp:include page="main/menubar.jsp" />
  </center>
  </div> 
<center>
   <img src="img/success.png">
   <br>
   <img src="img/successgo.png">
   <meta http-equiv="refresh" content="2;url=/KickOff/memOrderList?id=${sessionScope.userLoginInfo.id}">
</center>

 <center>
  <jsp:include page="main/bottom.jsp" />
 </center>
</body>
</html>