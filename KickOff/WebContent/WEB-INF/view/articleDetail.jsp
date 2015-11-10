<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src = "js/jquery.js"></script>
<script type="text/javascript">
	// 이미지 위에 올릴시 이미지 변경
	$(document).ready(function(){
		$('#img2').mouseover(function(){
			var img = $('#img2').attr("src");
			$('#img1').attr("src", img); 
		}).mouseout(function(){
			var imgs = "/KickOff/img/${article.imgFile1}"; 
			$('#img1').attr("src", imgs);
		});
		$('#img3').mouseover(function(){
			var img = $('#img3').attr("src");
			$('#img1').attr("src", img);
		}).mouseout(function(){
			var imgs = "/KickOff/img/${article.imgFile1}"; 
			$('#img1').attr("src", imgs);
		}); 
		$('#img4').mouseover(function(){
			var img = $('#img4').attr("src");
			$('#img1').attr("src", img);
		}).mouseout(function(){
			var imgs = "/KickOff/img/${article.imgFile1}"; 
			$('#img1').attr("src", imgs);
		});
		$('#img5').mouseover(function(){
			var img = $('#img5').attr("src");
			$('#img1').attr("src", img); 
		}).mouseout(function(){
			var imgs = "/KickOff/img/${article.imgFile1}"; 
			$('#img1').attr("src", imgs);
		});
	});
	function test()
	{
		var amount = document.getElementById("amount").value;
		var numtext = /^[0-9]*$/;
		if(amount == ""){
			alert('수량을 입력해 주세요.');
			return false;
		}
		else if (numtext.test(amount) == false)
		{
			alert('숫자만 입력해 주세요.');
			return false;
		}
		document.articleOrder.submit();
		return true;
	}
	function insertEpliogue()
	{
		var insertEpli = document.getElementById("contents").value;
		var stars = document.getElementById("star").value;
		if(insertEpli == "")
		{ 
			alert('후기를 입력해 주세요.');
			return false;
		}
		else if (stars == "평점입력")
		{
			alert('매기실 평점을 선택해 주세요.');
			return false;
		}
		document.epilogueReplyForm.submit();
		return true;
	}
</script>
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
<img src = "img/detailbanner.png">
<br><br><br>
<form action="articleOrderForm" method="post" name="articleOrder" id = "articleOrder" onsubmit="return test();">
<table width="800" height="400" border="0">
  <tr>
    <td colspan="3"><table width="400" height="300" border="0">
      <tr>
      <td width = "50"></td>
        <td style="border:1px solid #ccc;">
        	<c:choose>
					<c:when test="${article.imgFile1 != null}">
						<img src ="/KickOff/img/${article.imgFile1}" width = "400" height = "400" id = "img1">
					</c:when>
		</c:choose>
        </td>
      </tr>
    </table></td>
    <td width="400" rowspan="2">
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <tr>
       	 <td width = "50"></td>
          <td align = "right"><b>상품명</b></td>
        </tr>
      </table>
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <tr>
        <td width = "50"></td>
          <td align = "right">${article.aname}</td>
        </tr>
      </table>
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <tr>
        <td width = "50"></td>
          <td align = "right"><b>가격</b></td>
        </tr>
      </table>
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <tr>
        <td width = "50"></td>
          <td align = "right"><fmt:formatNumber value="${article.price}" groupingUsed="true" /></td>
        </tr>
      </table>
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <tr>
        <td width = "50"></td>
          <td align = "right"><b>분류번호</b></td>
        </tr>
      </table>
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <tr>
        <td width = "50"></td>
          <td align = "right">${article.groupNum}번</td>
        </tr>
      </table>
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <tr>
        <td width = "50"></td>
          <td align = "right"><b>사이즈 & 수량 </b></td> 
        </tr>
      </table>
      <table width="400" height="50px" style="border:1px solid #ccc; border-top:none; border-left: none; border-right: none;">
      <tr>
      <td width = "200">
      </td>
        <td align = "center">
        <select name="Asize" size="1">
              <c:forEach var="item" items="${articleSize}">
              <option>
                <c:out value="사이즈 : ${item.asize} : 재고 : ${item.amount}" />
                </option>
              </c:forEach>
       </select> 
       <br>
        <input type="text" name="amount" id = "amount">
        </td>
      </tr> 
    </table>
      <p align="center"></p> 
    <p align = "center"><input type = "image" id = "order" src = "img/prodbuy.png" height = "70" width="150"></p></td>
  </tr>
  <tr>
    <td colspan="3"><table width="400" height="100" border="0px">
      <tr>
        <td width="100"> 
    	<c:choose>
					<c:when test="${article.imgFile2 != null}">
						<img src ="/KickOff/img/${article.imgFile2}" width = "100" height = "100" id ="img2">
					</c:when>
		</c:choose>
    </td>
    <td width="100">
    	<c:choose>
					<c:when test="${article.imgFile3 != null}">
						<img src ="/KickOff/img/${article.imgFile3}" width = "100" height = "100" id ="img3">
					</c:when>
		</c:choose>
    </td>
    <td width="100">
    	<c:choose>
					<c:when test="${article.imgFile4 != null}">
						<img src ="/KickOff/img/${article.imgFile4}" width = "100" height = "100" id = "img4">
					</c:when>
		</c:choose>
    </td>
    <td width="100">
    	<c:choose>
					<c:when test="${article.imgFile5 != null}">
						<img src ="/KickOff/img/${article.imgFile5}" width = "100" height = "100" id ="img5">
					</c:when>
		</c:choose>
    </td>
      </tr>
    </table></td>
  </tr>
</table>
<input type = "hidden" name = "articleNum" value = "${article.articleNum}">
</form> 
<table>
<tr>
        <td> 
    	<c:choose> 
					<c:when test="${article.imgFile2 != null}">
						<img src ="/KickOff/img/${article.imgFile2}" width = "800" height = "600" id ="img2">
					</c:when>
		</c:choose>
   		 </td>
</tr>
<tr>
    <td>
    	<c:choose>
					<c:when test="${article.imgFile3 != null}">
						<img src ="/KickOff/img/${article.imgFile3}" width = "800" height = "600" id ="img3">
					</c:when>
		</c:choose>
    </td>
</tr>
<tr>
    <td>
    	<c:choose>
					<c:when test="${article.imgFile4 != null}">
						<img src ="/KickOff/img/${article.imgFile4}" width = "800" height = "600" id = "img4">
					</c:when>
		</c:choose>
    </td>
</tr>
<tr> 
    <td>
    	<c:choose>
					<c:when test="${article.imgFile5 != null}">
						<img src ="/KickOff/img/${article.imgFile5}" width = "800" height = "600" id ="img5">
					</c:when>
		</c:choose>
    </td>
</tr>
</table>
</center>
<br><br><br><br>
<form method="post" action="epilogueReply" name="epilogueReplyForm">
<input type="hidden" name="articleNum" value="${article.articleNum}">
<table cellpadding="5" align="center">   
    <tr bgcolor="black">  
       <th width="150"><font color = "white">아이디</font></th>
       <th width="250"><font color = "white">내용</font></th>
       <th width="200" colspan="2"><font color = "white">평점</font></th>
    </tr>
       <c:forEach var="epiloguereply" items="${EpilogueReply}">
         <tr>
            <td align = "center">${epiloguereply.id}</td>
            <td>${epiloguereply.content}</td>
            <td>
            	<c:if test="${epiloguereply.star =='1'}">★</c:if>
            	<c:if test="${epiloguereply.star =='2'}">★★</c:if>
            	<c:if test="${epiloguereply.star =='3'}">★★★</c:if>
            	<c:if test="${epiloguereply.star =='4'}">★★★★</c:if>
            	<c:if test="${epiloguereply.star =='5'}">★★★★★</c:if>
            </td>
            <td align ="center"><input type="button" value="삭제" 
            onclick="location.href='/KickOff/epilogueReplyDelete?articleNum=${article.articleNum}&buyepliNum=${epiloguereply.buyepliNum}'"></td>
         </tr>
       </c:forEach>
</table>
 <table width="600" align="center">
	<tr>
		<td colspan="5" align="center">
			<c:if test="${startPage>1}">
				<span> 
					<a href="/KickOff/articleDetail?articleNum=${article.articleNum}&pageNumber=${startPage-1}">이전</a>
				</span>
			</c:if> 
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${pageNumber == i }">
						<span>
							<a href="/KickOff/articleDetail?articleNum=${article.articleNum}&pageNumber=${i}"
									style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
						</span>
					</c:when>
				<c:otherwise>
					<span> 
						<a href="/KickOff/articleDetail?articleNum=${article.articleNum}&pageNumber=${i}"
									style="text-decoration: none; color: gray;">${i}</a>&nbsp;
					</span>
				</c:otherwise>
				</c:choose>
			</c:forEach>
				<c:if test="${endPage < totalPageCount}">
					<span>
						<a href="/KickOff/articleDetail?articleNum=${article.articleNum}&pageNumber=${endPage+1}">다음</a>
					</span>
				</c:if>
		</td>
	</tr> 
</table>
</form>
<br>
<form method="post" action="epilogueReply" name="epilogueReplyForm" 
			id = "epilogueReplyForm" onsubmit="return insertEpliogue();">
<table align="center" style="border: 1px solid #999;">
 	<tr>   
    	<td>내용</td>  
    	<td><input type="text" name="content" id = "contents" size="50" placeholder = "내용을 입력하세요."></td>
    	<td>
    	평점 <select name="star" id = "star">
    				<option selected>평점입력</option>
    				<option value="1">★</option>
    				<option value="2">★★</option>
    				<option value="3">★★★</option>
    				<option value="4">★★★★</option>
    				<option value="5">★★★★★</option>
    		  </select> 
    	</td>
    	<td><input type="submit" value="입력"></td>
    </tr>
 </table>
 <input type="hidden" name="articleNum" value="${article.articleNum}">
 <input type="hidden" name="id" value="${sessionScope.userLoginInfo.id}">
 </form>
 <center>
  <jsp:include page="main/bottom.jsp" />
 </center>
</body>
</html>