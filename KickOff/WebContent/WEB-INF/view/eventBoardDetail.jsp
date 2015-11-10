<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 글보기</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<script type="text/javascript">
</script>
<body>
<div class="wrap">
		<div class="header" align="center">
			<div class="toparea" align="right">
			<c:choose>
			<c:when test="${sessionScope.userLoginInfo.memGrade == 1}">
					<jsp:include page="main/memLogout.jsp" />
				</c:when> 
	  			<c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
		  			<jsp:include page="main/comLogout.jsp" />>
		  		</c:when>
	  			<c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
					<jsp:include page="main/memLogout.jsp" />
				</c:when> 
				<c:when test="${(sessionScope.userLoginInfo == null || sessionScope.comLoginInfo.comGrade == null )}">
					<jsp:include page="main/selectLogin.jsp" /> 
				</c:when>
			</c:choose>
			</div>
			<a href="/KickOff/"><img src="img/mlogo.png" width="360px"
				height="160px"></a>
</div> <!-- header end -->
  <jsp:include page="main/menubar.jsp" />
<div class="contents"><!-- 글 내용-->
<img src="img/customercenter.png" usemap="#Map">
<map name="Map">
			    <area shape="rect" coords="651,34,716,58" href="noticeListForm">
			    <area shape="rect" coords="770,35,817,56" href="eventListForm">
			    <area shape="rect" coords="866,36,901,54" href="qnaListForm">
		      </map>
		<div>
			<div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="7"></td></tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td height="2" bgcolor="#bebebe" class="none">&nbsp;</td></tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr bgcolor="#fdfdfd">
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
    <td width="10"></td>
    <td class="ar_category" width="80"><img src="img/nextBtn.png"></td>
    <td class="name_line"></td>
    <td class="ar_title" width = "300"><b>${eventDetail.title}</b></td>
    <td width="10"></td>
</tr>
</table>
    </td>
</tr>
<tr><td height="1" bgcolor="#efefef"></td></tr>
<tr>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
</table>
    </td>
</tr>
<tr><td height="1" bgcolor="#efefef"></td></tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td></td></tr>
<tr height="300">
    <td valign="top"><div id="article_content">
         	<c:choose>
				<c:when test="${eventDetail.fileName != null}">
					<img src="/KickOff/img/${eventDetail.fileName}" width = "100%" height = "1000px"><br>		
				</c:when>
			</c:choose>
			<c:choose>	
				<c:when test="${eventDetail.fileName == null}">
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${eventDetail.fileName2 != null}">
					<img src="/KickOff/img/${eventDetail.fileName2}" width = "100%"><br>							
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${eventDetail.fileName2 == null}">
				</c:when>
			</c:choose>
         	<c:choose>		
				<c:when test="${eventDetail.fileName3 != null}">
					<img src="/KickOff/img/${eventDetail.fileName3}" width = "100%"><br>						
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${eventDetail.fileName3 == null}">
				</c:when>
			</c:choose>
			<br></div></td>
</tr>
</table>
</div>
<br>
<br>
</div>
        <div align="center">
                <a href="eventListForm"> 
	             <img src = "img/golistbtn.png"></a>
             <c:if test="${sessionScope.userLoginInfo.memGrade==6}">
             	<a href = "eventUpdateForm?eventno=${eventDetail.eventno}">
               <img src = "img/gomodifybtn.png"></a>
             	 <a href = "eventDelete?eventno=${eventDetail.eventno}&filename=${eventDetail.fileName}&filename2=${eventDetail.fileName2}&filename3=${eventDetail.fileName3}">
             	 <img src = "img/godelbtn.png"></a>
             </c:if><br><br>
            <hr>
        </div>
        <input type="hidden" name="title" value="${eventDetail.title}">
        <input type="hidden" name="writer" value="${eventDetail.writer}">
</div>
</div> <!-- contents -->
  <jsp:include page="main/bottom.jsp" />
</body>
</html>