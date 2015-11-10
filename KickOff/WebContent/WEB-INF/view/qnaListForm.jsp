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
			<a href="/KickOff/"><img src="img/mlogo.png" width="360px"
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
   						  <table width="940px" style="border:1px solid #DFDFDF;" cellpadding=0 cellspacing=0>
   							<tr bgcolor = "#000000"> 
								<td width=50 height="20" align=center></td>
								<td align=center style="padding-left:10px; width: 466px"><font color = "white"><b>제목</b></font></td>
								<td width=100 nowrap align=center class=eng style="width: 123px; "><font color = "white"><b>작성자</b></font></td>
								<td width=70 nowrap align=center class=eng style="width: 100px; "><font color = "white"><b>작성일</b></font></td>
								<td width=30 nowrap align=center class=eng style="width: 50px; "><font color = "white"><b>조회</b></font></td>
							</tr> 
   						<c:forEach var="qna" items="${QnAList}">
							<tr>    
								<td width=50 height="20" align=center><b>${qna.qnano}</b></td>
								<td align=center style="padding-left:10px; width: 466px">
								<a href="qnaDetail?qnano=${qna.qnano}&pageNumber=1"><b>${qna.title}</b></a></td>
								<td width=100 nowrap align=center class=eng style="width: 123px; "><b>${qna.writer}</b></td>
								<td width=70 nowrap align=center class=eng style="width: 100px; "><b>${qna.qnaDate.split(" ")[0]}</b></td>
								<td width=30 nowrap align=center class=eng style="width: 50px; "><b>${qna.hit}</b></td>
							</tr>
						</c:forEach>
						</table>
								<a href="qnaWriteForm"><img src = "img/writebtn.png"></a>
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
							<table width="600">
								<tr>
									<td colspan="5" align="center"><c:if test="${startPage>1}">
											<span> <a
												href="/KickOff/qnaListForm?pageNumber=${startPage-1}">이전</a>
											</span>
										</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:choose>
												<c:when test="${pageNumber == i }">
													<span> <a
														href="/KickOff/qnaListForm?pageNumber=${i}"
														style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
													</span>
												</c:when>
												<c:otherwise>
													<span> <a
														href="/KickOff/qnaListForm?pageNumber=${i}"
														style="text-decoration: none; color: gray;">${i}</a>&nbsp;
													</span>
												</c:otherwise>
											</c:choose>
										</c:forEach> <c:if test="${endPage < totalPageCount}">
											<span> <a
												href="/KickOff/qnaListForm?pageNumber=${endPage+1}">다음</a>
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