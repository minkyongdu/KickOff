<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KICK OFF</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link href="css/slide.css" rel="stylesheet" type="text/css" />
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


<tr><td width = "150" height = "20" colspan="2">
			<jsp:include page="main/menubar.jsp" />
		</td></tr>

<script type="text/javascript" src="js/imgslide.js"></script>
<div class="contents" align="center">
 <div class="image_list" id="image_list_3">
	<div class="images" style="display:block"><img src="img/event1.png" /></div>
	<div class="images"><img src="img/event2.png" /></div>
	<div class="images"><img src="img/event3.jpg" /></div>
</div>
<ul class="no_label" id="label_3">
	<li><img src="img/1_on.jpg" oversrc="img/1_on.jpg" outsrc="img/1.jpg" /></li>
	<li><img src="img/2.jpg" oversrc="img/2_on.jpg" outsrc="img/2.jpg" /></li>
	<li><img src="img/3.jpg" oversrc="img/3_on.jpg" outsrc="img/3.jpg" /></li>
</ul>
<script type="text/javascript">
<!--
var j3 = {
	"list_area":"image_list_3",
	"moveAt":"200", //현재 숫자에서 다음이미지까지 이동시간
	"roll_time":"3000",  //숫자,이미지 넘어가는시간
	"move_time":"100", //현재 이미지에서 다음이미지까지 이동시간
	"direction":"right",
	"label":"label_3",
	labelType : "img"
};
new RollImage(j3);
//oj1.setRoll();
//-->
</script>
<br>
<hr> 
<p><br>
  <img src="img/space.png" width="50" height="20" align="left">
  <img src="img/new.png" align="left">
  <br>
  <br>
</p>
<table width="200" border="0">
  	<tr>
  	<c:forEach var="article" items="${NewArticleList}" varStatus="status">
    		<td> 
    		<table style="border: 1px solid #999;" cellpadding="10" id = "selectImageTbl">
	    		<tr>
	    	       	<td><a href ="articleDetail?articleNum=${article.articleNum}"><img src = "/KickOff/img/${article.imgFile1}" width="220" height="220"></a></td>
	    		</tr> 
	         	<tr>
			         	<td align ="center"><b>${article.aname}</b></td>
	         	</tr>  
	         	<tr>  
			         	<td align = "center"><fmt:formatNumber value="${article.price}" groupingUsed="true" /></td>
	         	</tr>
		   	</table>
		   	</td>
	 </c:forEach>
	</tr>
</table>
<p><br>
  <img src="img/space.png" width="50" height="20" align="left">
  <img src="img/best.png" align="left">
  <br>
  <br>
</p>
<table width="200" border="0">
  <tr>
    <td><img src="img/best_item1.png" width="220" height="220"></td>
    <td><img src="img/best_item2.png" width="220" height="220"></td>
    <td><img src="img/best_item3.png" width="220" height="220"></td>
    <td><img src="img/best_item4.png" width="220" height="220"></td>
  </tr>
  <tr>
    <td align="center">이름</td>
    <td align="center">이름</td>
    <td align="center">이름</td>
    <td align="center">이름</td>
  </tr>
  <tr>
    <td align="center">가격</td>
    <td align="center">가격</td>
    <td align="center">가격</td>
    <td align="center">가격</td>
  </tr>
  <br>
  <br>
  <br>
</table>
  </div> <!-- contents -->

 <tr>
 		<td width = "150" height = "150" colspan="2">
			<jsp:include page="main/bottom.jsp" />
		</td>
</tr>

</body>
</html>