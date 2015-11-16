<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
<link href="css/show.css" rel="stylesheet" type="text/css" />
var Question; 
function deleteSelectQ()  
{
   Question = confirm("해당 상품 내용을 삭제하시겠습니까? \n확인을 누르시면 삭제가 완료됩니다.");
   if(Question) 
      {
         alert("해당 상품 내용이 삭제되었습니다.");
         location.href = $('#deleteFileURL').attr("onClick");
      }
}
</script> 
</head>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<body class="kortext">
<c:if test="${(companyArticleList[0].companyNum != null) || (companyArticleList[0].companyNum == null)}">
<c:choose>
	<c:when test="${sessionScope.comLoginInfo.companyNum != reqCompanyNum}">
		<script type="text/javascript">
				alert('해당 제품의 담당 회사가 아니라면 접근 하실 수 없습니다.');
		      	location.href='javascript:history.back(-1)';
		</script>
	</c:when> 
</c:choose> 
</c:if>
<div class="wrap">
  <div class="header" align="center"> 
        <div class="toparea" align="right">
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
         <script type="text/javascript">
         location.href='loginForm';
         </script>
         </c:when>
   </c:choose>
   </c:if>
<c:choose>
   <c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
           <jsp:include page="main/comLogout.jsp" />
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
    <img src = "img/productmanage.png">
 </center>
<!-- 컴퍼니 등록 목록리스트 --> 
   <center>
     <table width="950" border="0" cellpadding="5" cellspacing="0">
       <tr>
         <th width="50" class="tablestyle">번호</th>
         <th width="100" class="tablestyle">이미지</th>
         <th width="350" class="tablestyle">제품명</th>
         <th width="150" class="tablestyle">가격</th>
         <th width="200" class="tablestyle">등록날자</th>
         <th width="100" class="tablestyle">관리</th>
       </tr> 
       <c:forEach var="company" items="${companyArticleList}">
         <tr> 
           <td align="center">${company.articleNum}</td>
           <td align="center"><img src ="/KickOff/img/${company.imgFile1}" width = "100" height = "100"></td>
           <td align="center">${company.aname}</td>
           <td align="center"><fmt:formatNumber value="${company.price}" groupingUsed="true" />원</td>
           <td align="center">${company.articleDate}</td>
           <td align="center" valign="middle"><p>
             <input type="button" value="수정" onClick="location.href='/KickOff/articleFix?articleNum=${company.articleNum}'">
            <input type="button" value="삭제" id="delete" name="delete" onclick="deleteSelectQ();"></p></td>
               <input type = "hidden" id = "deleteFileURL" onClick = '/KickOff/articleDelete?articleNum=${company.articleNum}&companyNum=${sessionScope.comLoginInfo.companyNum}&filename=${company.imgFile1}&filename2=${company.imgFile2}&filename3=${company.imgFile3}&filename4=${company.imgFile4}&filename5=${company.imgFile5}'>
         </tr>
       </c:forEach> 
     </table>
     <table width="600">
<tr>
            <td colspan="5" align="center"><c:if test="${startPage>1}">
                  <span> <a href="/KickOff/comCompanyArticleList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${startPage-1}">이전</a>
                  </span>
               </c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <c:choose>
                     <c:when test="${pageNumber == i }">
                        <span> <a href="/KickOff/comCompanyArticleList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${i}"
                           style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
                        </span>
                     </c:when>
                     <c:otherwise>
                        <span> <a href="/KickOff/comCompanyArticleList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${i}"
                           style="text-decoration: none; color: gray;">${i}</a>&nbsp;
                        </span>
                     </c:otherwise>
                  </c:choose>
               </c:forEach> <c:if test="${endPage < totalPageCount}">
               <span> <a href="/KickOff/comCompanyArticleList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${endPage+1}">다음</a>
                  </span>
               </c:if></td>
               <input type="hidden" name="companyNum" value="${sessionScope.comLoginInfo.companyNum}">
         </tr>
      </table>
    </center>
    	<center>
    		<a href = "comRegiSelect"><img src = "img/backbtn.png"></a>
    	</center>
    <br><br><br><br><br><br><br><br><br><br><br><br>   
     <center>
  <jsp:include page="main/bottom.jsp" />
 </center>
</body>
</html>