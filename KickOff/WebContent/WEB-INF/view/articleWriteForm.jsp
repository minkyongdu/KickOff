<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src = "js/imgWatch.js"></script>
<script type="text/javascript" src = "js/sizeamount.js"></script>
<script type="text/javascript">
function groupNum() { 
   var wind = null;
    wind =  window.open('/KickOff/articleGroup', "articleGroup",
            "toolbar=no ,width=300 ,height=500 ,directories=no,"
                  + "status=yes,scrollbars=yes,menubar=no");
   }
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
  <img src = "img/writeformbanner.png">
  <img src = "img/direction.png">
  </center> 
<form method="post" name= "productForm" id="productForm" action="articleInsert" name="productForm"
       enctype="multipart/form-data">
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
         <script type="text/javascript">
         location.href='loginForm';
         </script>
         </c:when>
   </c:choose>
   </c:if>       
<center>
<div class="engtext">
<table width="710" height="100%" border="0" cellspacing="0">
  <tr>
    <td colspan="2" align="center" valign="middle"
                           style="border: 1px solid #ccc; border-left: none; border-right: none;"><table width="300" border="0" cellspacing="0">
      <tr>
        <td width="80" height="100" align="right" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">분류
      :</td>
        <td width="20" valign="middle"  style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">&nbsp;</td>
        <td width="200" align="left" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;"><input type="text" id="groupNum" name="groupNum" size="2"
                           readonly="readonly" />
      <a href="javascript:groupNum();"
                           id="groupImg"> <img src="img/numsearch.png" alt=""
                              style="vertical-align: top;" /></a></td>
      </tr>
      <tr>
        <td width="80" height="100" align="right" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">제품명
      : </td>
        <td width="20" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">&nbsp;</td>
        <td width="200" align="left" valign="middle" style="border: 1px solid #ccc; border-top:none; border-left: none; border-right: none;">
          <input type="text" id="Aname" name="Aname" size="20" />
        </span></td>
      </tr>
      <tr>
        <td width="80" height="100" align="right" valign="middle">가격
      : </td>
        <td width="20" valign="middle">&nbsp;</td>
        <td width="200" align="left" valign="middle"><span style="border: 1px solid #ccc; border-top: none; border-left: none;">
          <input type="text" id="price" name="price" size="20" />
        </span></td>
      </tr>
    </table></td>
    <td width="400" height="350" align="center" valign="top"
                           style="border: 1px solid #ccc; border-left: none; border-right: none;"><p>사이즈 &amp; 수량</p>
      <p>
        <input type="button" id="selectbutton" value="사이즈 선택하기" />
        <input type="hidden" name="companyNum" id="companyNum"
                                 value="${sessionScope.comLoginInfo.companyNum}" />
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
        <td width="290" height="290"><img
                           src="" alt="" width="290" height="290" id="img1" /></td>
        </tr>
      </table></td>
    <td align="center" valign="middle"
                           style="border: 1px solid #ccc; border-top: none; border-left: none; border-right: none;">이미지 업로드
      <input type="button" id="addFile" value="이미지추가" /> <p>
                           <table id="fileview">

                          </table> </p>   </td>
  </tr>
  <tr>
    <td colspan="3" align="center" valign="middle"> 
     <a href="articleWriteForm" id="restartSizeamount">
     <img src="img/initialize.png" alt="" width="70" height="30" align="right" /></a>
     <!-- <input type="image" src="img/produpload.png" id="productinsert" /> -->
     <img src = "img/produpload.png" id = "productinsert">
     <!-- <input type="button" id="productinsert" /> -->
    <a href="javascript:history.back(-1);"><img src="img/back.png" alt="" /></a>    

</table>
</div>
</center>
</form>
<center>
<jsp:include page="main/bottom.jsp" />
</center>
</body>
</html>