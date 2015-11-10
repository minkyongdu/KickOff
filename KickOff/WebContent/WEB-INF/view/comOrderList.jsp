<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
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
<c:if test="${sessionScope.comLoginInfo.companyNum != companylist[0].companyNum}">
	<script type="text/javascript">
			alert('해당 제품의 담당 회사가 아니라면 접근 하실 수 없습니다.');
	      	location.href='/KickOff/';
	</script>
</c:if> 
<!-- 컴퍼니리스트 --> 
 
	<center>
		<h3>회사제품 주문리스트</h3>
		<hr>
		<table border="1" cellpadding="5">
			<tr bgcolor="yellow">
				<th>번호</th>
				<th>주문자이름</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>주문가격</th>
				<th>주문량</th>
				<th>제품이름</th>
				<th>주문사이즈</th>
				<th>주문날자</th>
				<th>주문상태</th> 
			</tr>
			
			<c:forEach var="buy" items="${companylist}">
				<tr>
					<td>${buy.buyNum}</td>
					<td>${buy.subname}</td>
					<td>${buy.subaddr1}</td>
					<td>${buy.subaddr2}</td>
					<td>${buy.subphonenum}</td>
					<td>${buy.price}</td>
					<td>${buy.buyamount}</td>
					<td>${buy.aname}</td>
					<td>${buy.asize}</td>
					<td>${buy.buydate}</td> 
					<td>
					<form method="post" action="orderCompanyUpdate">
						<select name="buyStatus" id="buyStatus">
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
	<jsp:include page="main/bottom.jsp" />  
	</center>
</body>
</html>