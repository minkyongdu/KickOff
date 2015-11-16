<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src = "js/imgWatchFix.js"></script>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<script src = "js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {   
    $('#addFile').click(function() { 
       var fileIndex = $('#fileview tr').length; //<table id="fileview"> 밑에 tr 갯수을 fileIndex에 담음
       if (Number(fileIndex) >= '5') { //file Upload 갯수를 5개로 제한
          alert('FILE UPLOAD는 5개만 가능 합니다.');
          return;
       }
       var i = $('#fileview tr').length;
       if(Number(i) >= '5'){
          return;
       }
       $('#fileview').append(
             '<tr><td>'
                + '   <input type="file" id="files['+ fileIndex +']" name="files['+ fileIndex +']" onchange="imageURL'+(i+1)+'(this)" />'
                + '</td></tr>'); 
    });
 });
</script> 
<body class="kortext">
<div class="wrap"> 
  <div class="header" align="center">
        <div class="toparea" align="right">
        <c:choose>
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
  <jsp:include page="main/menubar.jsp" />
  </div>
  <center>
  <img src = "img/prodmodifybanner.png">
  <img src = "img/direction.png">
  </center> 
<form method="post" name= "productForm" id="productForm" action="articleFixUpdate" name="productForm"
       enctype="multipart/form-data">
<input type = "hidden" name = "companyNums" value = "${sessionScope.comLoginInfo.companyNum}" >
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose>
      	<c:when test="${sessionScope.comLoginInfo.id == null}">
      		<script type="text/javascript">
      		location.href='loginForm';
      		</script>
      	</c:when>
	</c:choose>
</c:if>          
<center>
<table width="710" height="100%" border="0" cellspacing="0">
  <tr>
    <td colspan="2" align="center" valign="middle"
                           style="border: 1px solid #ccc; border-left: none; border-right: none;">
                           <table width="300" border="0" cellspacing="0">
      <tr>
        <td width="80" height="100" align="right" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">분류
      :</td>
        <td width="20" valign="middle"  style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">&nbsp;</td>
        <td width="200" align="left" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">
        <input type="text" id="groupNum"
					name="groupNum" size="2" readonly="readonly" value="${article.groupNum}"/>
   		</td>
      </tr>
      <tr>
        <td width="80" height="100" align="right" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">제품명
      : </td>
        <td width="20" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">&nbsp;</td>
        <td width="200" align="left" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">
          <input type="text" id="Aname" name="Aname" size = "30" value="${article.aname}"/>
        </span></td>
      </tr>
      <tr>
        <td width="80" height="100" align="right" valign="middle">가격
      : </td>
        <td width="20" valign="middle">&nbsp;</td>
        <td width="200" align="left" valign="middle"><span style="border: 1px solid #ccc; border-top: none; border-left: none;">
          <input type="text" id="price" name="price" size = "30" value="${article.price}"/>
        </span></td>
      </tr>
    </table></td>
    <td width="400" height="350" align="center" valign="top"
                           style="border: 1px solid #ccc; border-left: none; border-right: none;"><p>사이즈 &amp; 수량</p>
      <p>
        <c:forEach var="item" items="${articleSize}" varStatus="status">
                	사이즈 : <input type="text" name="asize${status.index}" value="${item.asize}" size="1" readonly> 수량 : <input type="text" name="amount${status.index}" value="${item.amount}" size="1"><br>
              	</c:forEach>
         <input type="hidden" name="articleNum" id="articleNum" value="${article.articleNum}" />
        </p>
      <p>&nbsp;</p>
      <table id="sizeamountview">
      
      </table>
      </p></td>
  </tr>
  <tr>
    <td width="300" height="300" colspan="2" align="center" valign="middle"
                           style="border: 1px solid #ccc; border-top: none; border-left: none; border-right:none;"><table width="200" border="0">
      <tr>
        	<td height="150px" align="center" valign="middle">
        	<img src="/KickOff/img/${article.imgFile1}" alt="" width="300" height="300" id="img1" />
        	 
			<input type="hidden" value="${article.imgFile1}" name="imgFile1">
			<input type="hidden" value="${article.imgFile2}" name="imgFile2">
			<input type="hidden" value="${article.imgFile3}" name="imgFile3">
			<input type="hidden" value="${article.imgFile4}" name="imgFile4">
			<input type="hidden" value="${article.imgFile5}" name="imgFile5">
        	</td>
        </tr>
      </table></td>
    <td align="center" valign="middle"
                           style="border: 1px solid #ccc; border-top: none; border-left: none; border-right: none;">이미지 업로드
      <input type="button" id="addFile" value="이미지추가" /> <p>
                           <table id="fileview">
 
                          </table></td>
  </tr>
  <tr>    
    <td colspan="3" align="center" valign="middle">  
    <br><br>
    <input type = "image" src = "img/produpload.png" id = "productinserts">
      <a href="/KickOff/comCompanyArticleList?companyNum=${sessionScope.comLoginInfo.companyNum}"><img src="img/back.png" /></a>
      </td>  
    </tr>
</table>
</center>
</form> 
<br><br>
<center>
<jsp:include page="main/bottom.jsp" />
</center>
</body>
</html>