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
	$(document).ready(function(){
		$('#saveReply').click(function(){
			if($('#replycontent').val() == ""){
				alert('댓글 내용이 없습니다.');
				$('#replycontent').focus();
			}
			else
				{
					$('#replyForm').submit();
				}
		});
	});
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
			<a href="main"><img src="img/mlogo.png" width="360px"
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
    <td class="ar_category" width="80"><b><font color="red">공지</font></b></td>
    <td class="name_line"></td>
    <td class="ar_title" width = "300"><b>${NoticeDetail.title}</b></td>
    <td width="10"></td>
</tr>
</table>
    </td>
</tr>
<tr><td height="1" bgcolor="#efefef"></td></tr>
<tr>
    <td>
<table border="0" cellspacing="0" cellpadding="0">
<tr>
    <td width="10"></td>
    <td class="name_title" width="80">작성자</td>
    <td class="ar_name" width = "300"><font color = "blue">관리자</font></td>
</tr> 
<tr>
	<td width="10"></td>
    <td class="name_title" width="80">작성일시</td>
    <td class="ar_date" width = "300">${NoticeDetail.noticeDate.split(" ")[0]}</td>
</tr>
<tr>
	<td width="10"></td>
    <td class="name_title" width="80">조회수</td>
    <td class="ar_hit" width = "300">${NoticeDetail.hit}</td>
</tr>
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
				<c:when test="${NoticeDetail.fileName != null}">
					<img src="/KickOff/img/${NoticeDetail.fileName}" width = "100%"><br>		
				</c:when>
			</c:choose>
			<c:choose>	
				<c:when test="${NoticeDetail.fileName == null}">
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${NoticeDetail.fileName2 != null}">
					<img src="/KickOff/img/${NoticeDetail.fileName2}" width = "100%"><br>							
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${NoticeDetail.fileName2 == null}">
				</c:when>
			</c:choose>
         	<c:choose>		
				<c:when test="${NoticeDetail.fileName3 != null}">
					<img src="/KickOff/img/${NoticeDetail.fileName3}" width = "100%"><br>						
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${NoticeDetail.fileName3 == null}">
				</c:when>
			</c:choose>
			<c:choose>
         	<c:when test="${NoticeDetail.contents != null}">
				   ${NoticeDetail.contents}<br>
			</c:when>
			</c:choose>
			
    <br></div></td>
</tr>
</table>
</div>
<br>
<br>
<center>
	<table style="border: 1px solid #999; background-color: #F5F5F5;">
	<tr width = "30"><th width = "170">아이디</th><th align="center" width = "500">내용</th><th></th></tr>
						<c:forEach var="reply" items="${NoticeReply}">
							<tr>
								<td width = "170" align = "center">${reply.replyid}</td>
								<td width = "470" align = "center">${reply.replycontent}</td>
								<c:choose>
									<c:when test="${(sessionScope.userLoginInfo.id != null) && (sessionScope.userLoginInfo.id == reply.replyid)}">
				<td width = "30"><input type="button" value="삭제"
				onClick="location.href='/KickOff/noticeReplyDelete?replyNum=${reply.replyNum}&noticeno=${NoticeDetail.noticeno}'"></td>
									</c:when>
									<c:when test="${(sessionScope.comLoginInfo.id != null) && (sessionScope.comLoginInfo.id == reply.replyid)}">
				<td width = "30"><input type="button" value="삭제"
				onClick="location.href='/KickOff/noticeReplyDelete?replyNum=${reply.replyNum}&noticeno=${NoticeDetail.noticeno}'"></td>
									</c:when>
									<c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
										<td><input type="button" value="삭제"
											onClick="location.href='/KickOff/noticeReplyDelete?replyNum=${reply.replyNum}&noticeno=${NoticeDetail.noticeno}'"></td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
						<tr height = "20"><td colspan = "3"></td></tr>
						</table>
</center>
<center>
<form method="post" action="noticeReply" name="replyForm" id = "replyForm">
	<input type="hidden" name="writeNum" value="${NoticeDetail.noticeno}">
	<c:if test="${sessionScope.userLoginInfo.id != null}">
		<input type="hidden" name="replyid" value="${sessionScope.userLoginInfo.id}">
	</c:if>
	<c:if test="${sessionScope.comLoginInfo.id != null}">
		<input type="hidden" name="replyid" value="${sessionScope.comLoginInfo.id}">
	</c:if>
    <input type="hidden" name="noticeno" value="${NoticeDetail.noticeno}">
    <table style="background-color: #F5F5F5;" >
    <tr height = "20">
    	<td colspan = "4"></td>
    </tr>
    <c:if test="${sessionScope.userLoginInfo.id != null || sessionScope.comLoginInfo.id != null}">
    	<tr>
    		<%-- <td>ID</td><td>${sessionScope.userLoginInfo.id}</td> --%>
    		<td width = "30"></td> 
    		<td><textarea name="replycontent" rows="3" cols="65" id = "replycontent"></textarea></td>
    		<td><img src = "img/savebtn.jpg" id = "saveReply"></td>
    		<td width = "30"></td>
    	</tr>
   	</c:if>
    <tr height = "20">
    	<td colspan = "4"></td>
    </tr>
    </table>
</form>
</center>
</div>

 <table width="600">
			<tr>
			<center>
				<td colspan="5" align="center"><c:if test="${startPage>1}">
						<span> <a href="/KickOff/noticeDetail?noticeno=${NoticeDetail.noticeno}&pageNumber=${startPage-1}">이전</a>
						</span>
					</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${pageNumber == i }">
								<span> <a href="/KickOff/noticeDetail?noticeno=${NoticeDetail.noticeno}&pageNumber=${i}"
									style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
								</span>
							</c:when>
							<c:otherwise>
								<span> <a href="/KickOff/noticeDetail?noticeno=${NoticeDetail.noticeno}&pageNumber=${i}"
									style="text-decoration: none; color: gray;">${i}</a>&nbsp;
								</span>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${endPage < totalPageCount}">
					<span> <a href="/KickOff/noticeDetail?noticeno=${NoticeDetail.noticeno}&pageNumber=${endPage+1}">다음</a>
						</span>
					</c:if></td>
			</center>
			</tr>
        </table>
        <div align="center">
                <a href="noticeListForm">
	             <img src = "img/golistbtn.png"></a>
             <c:if test="${sessionScope.userLoginInfo.memGrade==6}">
             	<a href = "noticeUpdateForm?noticeno=${NoticeDetail.noticeno}">
               <img src = "img/gomodifybtn.png"></a>
             	 <a href = "noticeDelete?noticeno=${NoticeDetail.noticeno}&filename=${NoticeDetail.fileName}&filename2=${NoticeDetail.fileName2}&filename3=${NoticeDetail.fileName3}">
             	 <img src = "img/godelbtn.png"></a>
             </c:if><br><br>
            <hr>
        </div>
        <input type="hidden" name="title" value="${NoticeDetail.title}">
        <input type="hidden" name="writer" value="${NoticeDetail.writer}">
</div>
</div> <!-- contents -->
  <jsp:include page="main/bottom.jsp" />
</body>
</html>