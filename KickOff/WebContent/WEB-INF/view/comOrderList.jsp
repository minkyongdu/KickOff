<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
var childWin = null;   
function winOpen(buyNum){
		    childWin = window.open('comOrderSelectID?buyNum='+buyNum,'child','width=900,height=150');
		}
$(document).ready(function(){ 
	
			for(var i = 0; i < 10; i++)
				{
					$('#sendpackage'+i).hide();
					$('#test'+i).hide();
					if($('#buyStatus'+i).val() == '배송준비' || $('#buyStatus'+i).val() == '배송중' || $('#buyStatus'+i).val() == '배송완료')    
						{
								if ($('#sendpackage'+i).val() == "0")
								{
									$('#sendpackage'+i).show();
									$('#test'+i).show();
								}
					else if($('#sendpackage'+i).val() != null && $('#sendpackage'+i).val() != "0")
									{
										$('#sendpackage'+i).hide();  
										$('#test'+i).hide(); 
										$('#plussend'+i).append($('#sendpackage'+i).val());
									}
							
						}
				}
	
});
</script> 
<body>   
<div class="wrap">
  <div class="header" align="center">
	  	<div class="toparea" align="right">
	  	<c:choose>
		  		<c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
		  			<jsp:include page="main/comLogout.jsp" />
		  		</c:when>
	  		</c:choose>
		</div>
 	<a href="/KickOff/"><img src="img/mlogo.png" width="360px" height="160px"></a>
  </div>
<jsp:include page="main/menubar.jsp" />
 </div> 
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose>
      <c:when test="${sessionScope.comLoginInfo.id == null}">
	      	<script type="text/javascript">
	      	location.href='loginForm';
	      	</script>
      	</c:when>
	</c:choose>
</c:if>
<script type="text/javascript">
</script>
<c:if test="${companylist[0].companyNum == null}">
	<script type="text/javascript">
			alert('주문 내역이 존재하지 않습니다.');
	      	location.href='comRegiSelect';
	</script>
</c:if> 
<c:if test="${companylist[0].companyNum != null}">
<c:choose>
	<c:when test="${sessionScope.comLoginInfo.companyNum != companylist[0].companyNum}">
		<script type="text/javascript">
				alert('해당 제품의 담당 회사가 아니라면 접근 하실 수 없습니다.');
		      	location.href='/KickOff/';
		</script>
	</c:when> 
</c:choose>
</c:if>
<!-- 컴퍼니리스트 --> 
  
	<center>
		<img src="img/orderpostbanner.png" />

<table width="950" height="100%" border="0" cellspacing="0">
  <tr>
    <th width="50" align="center" class="tablestyle">번호</th>
    <th width="100" align="center" class="tablestyle">구매자</th>
    <th align="center" class="tablestyle" width="220">제품명</th>
    <th align="center" class="tablestyle" width="80">사이즈</th> 
    <th align="center" class="tablestyle" width="70">수량</th> 
    <th align="center" class="tablestyle" width="100">구매금액</th>
    <th align="center" class="tablestyle" width="80">주문일시</th>
    <th align="center" class="tablestyle" width="200">주문상태</th>
    <th align="center" class="tablestyle" width="100">배송번호</th>
  </tr> 
  <c:forEach var="buy" items="${companylist}" varStatus="status">	
  <tr>
    <td height="40" align="center"><a href = "javascript:window.opener=winOpen(${buy.buyNum});" id = "a">${buy.buyNum}</a></td>
    <td height="40" align="center">${buy.subname}</td>
    <td height="40" align="center">${buy.aname}</td>
    <td height="40" align="center">${buy.asize}</td>
    <td height="40" align="center">${buy.buyamount}</td>
    <td height="40" align="center"><fmt:formatNumber value="${buy.price}" groupingUsed="true" /></td>
    <td height="40" align="center">${buy.buydate}</td>
    <td height="40" align="center">
    <form method="post" action="orderCompanyUpdate">
						<select name="buyStatus" id="buyStatus${status.index}">
							<option>${buy.buyStatus}</option>
							<option>---------------</option>
							<option value="주문완료">주문완료</option>
							<option value="배송준비">배송준비</option>
							<option value="배송중">배송중</option>
							<option value="배송완료">배송완료</option>																					
						</select> 
							<input type="submit" value="상태수정">
							<input type="hidden" name="buyNum" value="${buy.buyNum}">
							<input type="hidden" name="companyNum" value="${buy.companyNum}">		
					</form>
	</td>
	<form name = "updateSendpackage" action = "updateSendpackage" method="post">
	<td id = "plussend${status.index}" align = "center">
		<input type = "text" id = "sendpackage${status.index}" name = "sendpackage" value = "${buy.sendpackage}" size = "4">
		<input type = "submit" value = "배송번호입력" id = "test${status.index}">
		<input type="hidden" id = "buyNum${status.index}" name="buyNum" value="${buy.buyNum}">
		<input type="hidden" id = "companyNum" name="companyNum" value="${buy.companyNum}">	
	</td>
	</form>
  </tr>
  </c:forEach>
</table>
      <table width="600">
         <tr>
            <td colspan="5" align="center"><c:if test="${startPage>1}">
                  <span> <a href="/KickOff/comOrderList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${startPage-1}">이전</a>
                  </span>
               </c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
                  <c:choose>
                     <c:when test="${pageNumber == i }">
                        <span> <a href="/KickOff/comOrderList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${i}"
                           style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
                        </span>
                     </c:when>
                     <c:otherwise>
                        <span> <a href="/KickOff/comOrderList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${i}"
                           style="text-decoration: none; color: gray;">${i}</a>&nbsp;
                        </span>
                     </c:otherwise>
                  </c:choose>
               </c:forEach> <c:if test="${endPage < totalPageCount}">
               <span> <a href="/KickOff/companyList?companyNum=${sessionScope.comLoginInfo.companyNum}&pageNumber=${endPage+1}">다음</a>
                  </span>
               </c:if></td>
               <input type="hidden" name="companyNum" value="${sessionScope.comLoginInfo.companyNum}">
         </tr>
      </table>
	</center>
	<center> 
	<a href = "javascript:history.back(-1)"><img src = "img/backbtn.png"></a> 
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<jsp:include page="main/bottom.jsp" />  
	</center>
</body>
</html>