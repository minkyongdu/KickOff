<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src = "js/imgWatch.js"></script>
<script type="text/javascript" src = "js/sizeamount.js"></script>
<script type="text/javascript">
</script>
<body>
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
  <img src = "img/writeformbanner.png">
  <img src = "img/direction.png">
  </center> 
<form method="post" name= "productForm" id="productForm" action="articleFixUpdate" name="productForm"
       enctype="multipart/form-data">
<input type = "hidden" name = "companyNums" value = "${sessionScope.comLoginInfo.companyNum}" >
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
      	<script type="text/javascript">
      	location.href='loginForm';
      	</script>
      	</c:when>
	</c:choose>
	</c:if>       
<center>
<table width="700" height="100%" border="0">
  <tr>
    <td width="200" align="right"><table width="150" height="100%" border="0">
      <tr>
        <td height="150px" align="center" valign="middle"><img src="/KickOff/img/${article.imgFile1}" alt="" width="150" height="150" id="img1" /></td>
        <td><input type="hidden" value="${article.imgFile1}" name="imgFile1"></td>
      </tr>
      <tr>
        <td height="150px" align="center" valign="middle"><img src="/KickOff/img/${article.imgFile2}" alt="" width="150" height="150" id="img2" /></td>
      	<td><input type="hidden" value="${article.imgFile2}" name="imgFile2"></td>
      </tr>
      <tr>
        <td height="150px" align="center" valign="middle"><img src="/KickOff/img/${article.imgFile3}" alt="" width="150" height="150" id="img3" /></td>
		<td><input type="hidden" value="${article.imgFile3}" name="imgFile3"></td>      
      </tr>
      <tr>
        <td height="150px" align="center" valign="middle"><img src="/KickOff/img/${article.imgFile4}" alt="" width="150" height="150" id="img4" /></td>
      	<td><input type="hidden" value="${article.imgFile4}" name="imgFile4"></td>
      </tr>
      <tr>
        <td height="150px" align="center" valign="middle"><img src="/KickOff/img/${article.imgFile5}" alt="" width="150" height="150" id="img5" /></td>
      	<td><input type="hidden" value="${article.imgFile5}" name="imgFile5"></td>
      </tr>
    </table></td>
    <td width="500"><table width="400" height="700" border="0">
      <tr>
        <td height="35" align="right" style="border:1px solid #ccc; border-top:none; border-left:none; border-right:none;">분류번호 :          
          <input type="text" id="groupNum"
					name="groupNum" size="2" readonly="readonly" value="${article.groupNum}"/>
        </td>
        </tr>
      <tr>
        <td align="right" style="border:1px solid #ccc; border-top:none; border-left:none; border-right:none;">제품명 :          
          <input type="text" id="Aname" name="Aname" size = "30" value="${article.aname}"/></td>
        </tr>
      <tr>
        <td align="right" style="border:1px solid #ccc; border-top:none; border-left:none; border-right:none;">가격 :          
          <input type="text" id="price" name="price" size = "30" value="${article.price}"/></td>
        </tr>
      <tr>
        <td height="310" align="right" valign="top" style="border:1px solid #ccc; border-top:none; border-left:none; border-right:none;">
        <p>사이즈 & 수량 </p>
          <p>
              	<c:forEach var="item" items="${articleSize}" varStatus="status">
                	사이즈 : <input type="text" name="asize${status.index}" value="${item.asize}" size="1" readonly> 수량 : <input type="text" name="amount${status.index}" value="${item.amount}" size="1"><br>
              	</c:forEach>
            <input type="hidden" name="articleNum" id="articleNum"
			value="${article.articleNum}" />
          </p>
          <p>
          <table id = "sizeamountview">
				 
		  </table>
          </p>
          </td>
      </tr>
      <tr>
        <td height="196" align="right" valign="top" style="border:1px solid #ccc; border-top:none; border-left:none; border-right:none;"><p>이미지 업로드 
          <input
			type="button" id="addFile" value="이미지추가" />
        </p>
          <p>
         	<table id = "fileview">

			</table> 
          </p>
         </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="middle">
    	<input type="image" src="img/produpload.png" id ="productinsert" />
      <a href="/KickOff/comCompanyArticleList?companyNum=${sessionScope.comLoginInfo.companyNum}"><img src="img/back.png" /></a></td>
    </tr>
    <input type="image" src="img/produpload.png" id ="productinsert" />
</table>
</center>
</form>
<center>
<jsp:include page="main/bottom.jsp" />
</center>
</body>
</html>