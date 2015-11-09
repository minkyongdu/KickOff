<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="kickoff.model.beans.NoticeVO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
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
	  			<c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
		  			<jsp:include page="main/comLogout.jsp" />
		  		</c:when>
	  			<c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
					<jsp:include page="main/memLogout.jsp" />
				</c:when> 
				<c:when test="${(sessionScope.userLoginInfo == null) || (sessionScope.comLoginInfo == null)}">
		  			<jsp:include page="main/selectLogin.jsp" /> 
				</c:when>
			</c:choose>
			</div>
			<a href="main"><img src="img/mlogo.png" width="360px"
				height="160px"></a>
</div> <!-- header end -->
<jsp:include	page="main/menubar.jsp" />
 <div class="contents" align="center">
	<br>
	<table width=950px align=center cellpadding=0 cellspacing=0>
		<tr>
			<td><img src="img/customercenter.png" border="0" align="left" usemap="#Map">
			  <map name="Map">
			    <area shape="rect" coords="651,34,716,58" href="noticeListForm">
			    <area shape="rect" coords="770,35,817,56" href="eventListForm">
			    <area shape="rect" coords="866,36,901,54" href="qnaListForm">
		      </map>
	    <br>
					<br>
					<center>  
   						  <table width="940px" style="border:1px solid #DFDFDF;" cellpadding=0 cellspacing=0">
   							<tr bgcolor="#000000"> 
								<td align=center style="padding-left:10px; width: 100px"><font color = "white"><b>EVENT</b></font></td>
								<td width=300 nowrap align=center class=eng style="width: 300px; "><font color = "white"><b>SUBJECT</b></font></td>
							</tr>
							<hr>
   						<c:forEach var="event" items="${eventList}">
							<tr> 
								 
								<td style="padding-left:10px; width: 300px" rowspan="6"><center>
								<img src = "/KickOff/img/${event.fileName}" width="350" height = "150"></center></td>
								<td>
									<tr>
										<td></td>
									</tr>
									<tr>
										<td width=70 nowrap align=left class=eng style="width: 300px; ">
										<b>이벤트 제목 : ${event.title}</b></td>
									</tr>
									<tr>
										<td width=70 nowrap align=left class=eng style="width: 300px; ">
										<b>이벤트 기간 : ${event.eventDate.split(" ")[0]}~</b></td>
									</tr>
									<tr>
										<td width=70 nowrap align=left class=eng style="width: 300px; ">
										<b>이벤트 내용 : ${event.contents}</b></td>
									</tr>
									<tr>
										<td width=70 nowrap align=right class=eng style="width: 300px; ">
										<a href="eventDetail?eventno=${event.eventno}&pageNumber=1">
										<img src = "img/detailbtn.png"></a></td>
									</tr>
								</td>
							</tr> 
						</c:forEach>
						</table>
						<center>
							<c:if test="${sessionScope.userLoginInfo.memGrade == 6}">
										<a href="eventWriteForm"><img src = "img/writebtn.png"></a>
							</c:if>
						</center>
					<br>
					<center>  
      				<!-- 찾기 버튼
      				<table cellpadding=0 cellspacing=0>
      					<tr>
					        <td>
					        	<select name="birth_yy" size="1" tabindex='9' height="30px">
                                    <option value='이름' selected="selected">글쓴이</option>
                                    <option value='내용'>글제목</option>
                                    <option value='제목'>글내용</option>
                              </select>
                            </td>
         					<td>
         						&nbsp;<input name="searchform" style="border:1px solid #DFDFDF;width:300; height:21px">
         					</td> 
         					<td>
         						&nbsp;<a href=""><img src=" img/searchbtn.png"></a>
         					</td>
      					</tr>
					</table> -->
					<input type = "hidden" id = "writeNum" value = "${event.eventno}">
							<table width="600">
								<tr>
									<td colspan="5" align="center"><c:if test="${startPage>1}">
											<span> <a
												href="/KickOff/eventListForm?pageNumber=${startPage-1}">이전</a>
											</span>
										</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:choose>
												<c:when test="${pageNumber == i }">
													<span> <a
														href="/KickOff/eventListForm?pageNumber=${i}"
														style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
													</span>
												</c:when>
												<c:otherwise>
													<span> <a
														href="/KickOff/eventListForm?pageNumber=${i}"
														style="text-decoration: none; color: gray;">${i}</a>&nbsp;
													</span>
												</c:otherwise>
											</c:choose>
										</c:forEach> <c:if test="${endPage < totalPageCount}">
											<span> <a
												href="/KickOff/eventListForm?pageNumber=${endPage+1}">다음</a>
											</span>
										</c:if></td>
									</tr>
								</tr>
							</table>
						</center>
				<tr>  
				</tr>
			</center>
			</table>
</div> <!-- contents -->
  <jsp:include page="main/bottom.jsp" />
</body>
</html>