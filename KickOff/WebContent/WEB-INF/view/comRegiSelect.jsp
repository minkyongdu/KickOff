<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
  <jsp:include page="main/menubar.jsp" />
  <center>  
	<div class="contents">
		<img src="img/companyonly.png">
		  <img src="img/companypage.png" border="0" usemap="#Map">
          <map name="Map">
            <area shape="poly" coords="549,390,302,298,301,34,319,34,338,36,360,40,379,46,409,57,430,68,452,82,478,102,501,124,520,151,538,183,551,214,561,253,564,285,565,322" href="articleWriteForm">
            <area shape="poly" coords="49,400,299,299,299,32,274,33,251,36,232,41,210,47,181,59,150,77,121,98,87,133,59,177,40,225,29,287,31,338,35,355" href="comCompanyArticleList?companyNum=${sessionScope.comLoginInfo.companyNum}">
            <area shape="poly" coords="300,302,50,402,76,452,103,484,137,515,185,544,237,561,294,568,380,556,431,534,476,502,522,451,538,417,549,395" href="comOrderList?companyNum=${sessionScope.comLoginInfo.companyNum}">
          </map>
	</div>
</center>	
</div>  
<center>
<jsp:include page="main/bottom.jsp" />
</center>	
</body>
</html>