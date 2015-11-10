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
		  			<jsp:include page="main/comLogout.jsp" />
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
<table border="0" cellspacing="0" cellpadding="0" border = "1">
<tr bgcolor="#fdfdfd">
    <td rowspan="6" width = "20" align = "center"><img src = "img/question.png" width = "100"></td>
<tr>
    <td width="10" rowspan=""></td>
    <td class="ar_category" width="80"><b><font color="red">Question</font></b></td>
    <td class="ar_title" width = "300"><b>${QnADetail.title}</b></td>
</tr>
<tr>
    <td width="10"></td>
    <td class="name_title" width="80">작성자</td>
    <td class="ar_name" width = "300"><font color = "blue">${QnADetail.writer}</font></td>
</tr> 
<tr>
	<td width="10"></td>
    <td class="name_title" width="80">작성일시</td> 
    <td class="ar_date" width = "300">${QnADetail.qnaDate.split(" ")[0]}</td>
</tr>
<tr>
	<td width="10"></td>
    <td class="name_title" width="80">조회</td>
    <td class="ar_hit" width = "300">${QnADetail.hit}</td>
</tr>
<tr><td height="1" bgcolor="#efefef"></td></tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr><td></td></tr>
<tr height="300">
    <td valign="top"><div id="article_content">
         	<c:choose>
				<c:when test="${QnADetail.fileName != null}">
					<img src="/KickOff/img/${QnADetail.fileName}" width = "100%"><br>		
				</c:when>
			</c:choose>
			<c:choose>	
				<c:when test="${QnADetail.fileName == null}">
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${QnADetail.fileName2 != null}">
					<img src="/KickOff/img/${QnADetail.fileName2}" width = "100%"><br>							
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${QnADetail.fileName2 == null}">
				</c:when>
			</c:choose>
         	<c:choose>		 
				<c:when test="${QnADetail.fileName3 != null}">
					<img src="/KickOff/img/${QnADetail.fileName3}" width = "100%"><br>						
				</c:when>
			</c:choose>
         	<c:choose>	
				<c:when test="${QnADetail.fileName3 == null}">
				</c:when>
			</c:choose>
			<c:choose>
         	<c:when test="${QnADetail.contents != null}">
				   ${QnADetail.contents}<br>
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
	<tr width = "30"><th></th><th width = "170">아이디</th><th align="center" width = "500">내용</th><th></th></tr>
						<c:forEach var="qnareply" items="${QnAReply}">
							<tr>
								<td><img src = "img/answer.png" height = "50" width = "50"></td>
								<td width = "170" align = "center">${qnareply.replyid}</td>
								<td width = "470" align = "center">${qnareply.replycontent}</td>
								<c:choose>
									<c:when test="${(sessionScope.userLoginInfo.id != null) && (sessionScope.userLoginInfo.id == qnareply.replyid)}">
				<td width = "30"><input type="button" value="삭제"
				onClick="location.href='/KickOff/qnaReplyDelete?replyNum=${qnareply.replyNum}&qnano=${QnADetail.qnano}'"></td>
									</c:when>
									<c:when test="${(sessionScope.comLoginInfo.id != null) && (sessionScope.comLoginInfo.id == qnareply.replyid)}">
				<td width = "30"><input type="button" value="삭제"
				onClick="location.href='/KickOff/qnaReplyDelete?replyNum=${qnareply.replyNum}&qnano=${QnADetail.qnano}'"></td>
									</c:when>
									<c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
										<td><input type="button" value="삭제"
											onClick="location.href='/KickOff/qnaReplyDelete?replyNum=${qnareply.replyNum}&qnano=${QnADetail.qnano}'"></td>
									</c:when>
								</c:choose>
							</tr>
						</c:forEach>
						</table>
</center>
<center>

<form method="post" action="qnaReply" name="replyForm" id = "replyForm">
	<input type="hidden" name="writeNum" value="${QnADetail.qnano}">
    <c:if test="${sessionScope.userLoginInfo.id != null}">
		<input type="hidden" name="replyid" value="${sessionScope.userLoginInfo.id}">
	</c:if>
	<c:if test="${sessionScope.comLoginInfo.id != null}">
		<input type="hidden" name="replyid" value="${sessionScope.comLoginInfo.id}">
	</c:if>
    <input type="hidden" name="qnano" value="${QnADetail.qnano}">
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
 <table width="600" id = "repltinsertForm">
			<tr> 
			<center>
				<td colspan="5" align="center"><c:if test="${startPage>1}">
						<span> <a href="/KickOff/qnaDetail?qnano=${QnADetail.qnano}&pageNumber=${startPage-1}">이전</a>
						</span>
					</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${pageNumber == i }">
								<span> <a href="/KickOff/qnaDetail?qnano=${QnADetail.qnano}&pageNumber=${i}"
									style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
								</span>
							</c:when>
							<c:otherwise>
								<span> <a href="/KickOff/qnaDetail?qnano=${QnADetail.qnano}&pageNumber=${i}"
									style="text-decoration: none; color: gray;">${i}</a>&nbsp;
								</span>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${endPage < totalPageCount}">
					<span> <a href="/KickOff/qnaDetail?qnano=${QnADetail.qnano}&pageNumber=${endPage+1}">다음</a>
						</span>
					</c:if></td>
			</center>
			</tr>
        </table>
        <div align="center">
                <a href="qnaListForm">
	             <img src = "img/golistbtn.png"></a>
             <c:if test="${sessionScope.userLoginInfo.memGrade==6}">
             	<a href = "qnaUpdateForm?qnano=${QnADetail.qnano}">
               <img src = "img/gomodifybtn.png"></a>
             	 <a href = "qnaDelete?qnano=${QnADetail.qnano}&filename=${QnADetail.fileName}&filename2=${QnADetail.fileName2}&filename3=${QnADetail.fileName3}">
             	 <img src = "img/godelbtn.png"></a>
             </c:if><br><br>
            <hr>
        </div>
        <input type="hidden" name="title" value="${QnADetail.title}">
        <input type="hidden" name="writer" value="${QnADetail.writer}">
</div>
</div> <!-- contents -->
  <jsp:include page="main/bottom.jsp" />
</body>
</html>