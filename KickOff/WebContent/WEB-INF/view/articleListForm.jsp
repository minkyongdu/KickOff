<%@page import="kickoff.model.beans.ArticleVO"%>
<%@page import="kickoff.model.beans.ArticlefileVO" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>물품 리스트</title>
</head>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	var param = document.location.href.split("=")[1];
	var newitem = "articleListFormDate?groupNum=" + param;
	var highitem = "articleListFormHigh?groupNum=" + param;
	var lowitem = "articleListFormLow?groupNum=" + param;
	$(document).ready(function(){
			$('#newitem').attr('href', newitem);
			$('#highitem').attr('href', highitem);
			$('#lowitem').attr('href', lowitem);
	});
</script>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<body class="kortext">
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
	<input type = "hidden" id = "param">
    <table>  
 	   	<tr>      
 	   		<td width = "2000px" align = "center"> 
 	   			<center>  <!-- 1 ~ 5 축구화 -->
 	   			<c:if test="${(param.groupNum == 1) || (param.groupNum == 2) || (param.groupNum == 3)
 	   			|| (param.groupNum == 4) || (param.groupNum == 5)}"> 
 	   			  	<jsp:include page="main/shoes.jsp" />
 	   			</c:if>
 	   			<c:if test="${(param.groupNum == 6) || (param.groupNum == 7) || (param.groupNum == 8) }">
 	   				<jsp:include page="main/Ball.jsp" />
 	   			</c:if>
 	   			<c:if test="${param.groupNum == 9}">
 	   				<jsp:include page="main/Clothes.jsp" />
 	   			</c:if>
 	   			<c:if test="${(param.groupNum == 10) || (param.groupNum == 11) || (param.groupNum == 12)
 	   			|| (param.groupNum == 13) || (param.groupNum == 14)}"> 
 	   			  	<jsp:include page="main/UniForm.jsp" />
 	   			</c:if>
 	   			<c:if test="${(param.groupNum == 15) || (param.groupNum == 16) || (param.groupNum == 17)
 	   			|| (param.groupNum == 18)}"> 
 	   			  	<jsp:include page="main/Bag.jsp" />
 	   			</c:if>
 	   			<c:if test="${(param.groupNum == 19) || (param.groupNum == 20) || (param.groupNum == 21)}"> 
 	   				<jsp:include page="main/Protect.jsp" />
 	   			</c:if>
 	   			<c:if test="${(param.groupNum == 22) || (param.groupNum == 23) || (param.groupNum == 24)
 	   			|| (param.groupNum == 25) || (param.groupNum == 26)}"> 
 	   			  	<jsp:include page="main/Match.jsp" />
 	   			</c:if>
 	   			<c:if test="${(param.groupNum == 27) || (param.groupNum == 28) || (param.groupNum == 29)}"> 
 	   			  	<jsp:include page="main/ETC.jsp" />
 	   			</c:if>
 	   			<!-- 차후 들어갈 내용 -->
 	   			</center> 
 	   		</td>
   	    </tr>
   	    <tr><td></td></tr>
	    <tr>   
	    	<td align = "center" width="1000px">
			    <a id="newitem">신상품순</a>
			    <a id="highitem">높은가격순</a> 
			    <a id="lowitem">낮은가격순</a>
		 	</td>
		 </tr>
	</table>
	<br><br>  
    <center>  
    <table id = "id">  
     <c:forEach var="article" items="${articleList}" varStatus="status">
    	<c:if test="${(status.index%5)==0}"> <tr> </c:if>
    		<td>
    		<table cellpadding="10" id = "selectImageTbl">
	    		<tr width = "50px" align="center">
	    	       	<td><a href ="articleDetail?articleNum=${article.articleNum}"><img src = "/KickOff/img/${article.imgFile1}" width="150" height="150"></a></td>
	    		</tr>
	         	<tr width = "50px">
			         	<td align = "center">${article.aname}</td>
	         	</tr> 
	         	<tr width = "50px">
			         	<td align = "center"><fmt:formatNumber value="${article.price}" groupingUsed="true" /></td>
	         	</tr>
		   	</table>
		   	</td>
		   <c:if test="${(status.index%5)==4 || status.last}"> </tr> </c:if>
		 </c:forEach>
 	</table>
 	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  </center>
  <center>
  <jsp:include page="main/bottom.jsp" />
  </center>
</body>
</html>