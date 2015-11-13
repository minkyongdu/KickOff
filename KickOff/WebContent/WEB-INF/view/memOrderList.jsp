<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head> 
<body>
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
      	<script type="text/javascript">
      	location.href='loginForm';
      	</script>
      	</c:when>
	</c:choose>
	</c:if>
<c:if test="${buyMemberlist[0].id == null}">
	<script type="text/javascript">
			alert('주문 내역이 존재하지 않습니다.');
	      	location.href='/KickOff/';
	</script>
</c:if>
<c:if test="${buyMemberlist[0].id != null}">
<c:choose>
	<c:when test="${sessionScope.userLoginInfo.id != buyMemberlist[0].id}">
		<script type="text/javascript">
				alert('다른 유저의 정보는 보실 수 없습니다.');
		      	location.href='/KickOff/';
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
		<h3>개인제품주문리스트</h3>
		<hr>
		<table border="1" cellpadding="5">
			<tr bgcolor="black">
				<th><font color = "white">주문번호</font></th>
				<th><font color = "white">물품이미지</font></th>
				<th><font color = "white">제품이름</font></th>
				<th><font color = "white">주문사이즈</font></th>
				<th><font color = "white">주문가격(수량)</font></th> 
				<th><font color = "white">주문날짜</font></th>
				<th><font color = "white">주문상태</font></th>
			</tr>
			 <c:forEach var="buylist" items="${buyMemberlist}">
				<tr> 
					<td align = "center">${buylist.buyNum}</td>
					<td align = "center">
						<img src="/KickOff/img/${buylist.imgFile1}" width="100" height="100">
					</td>
					<td align = "center">${buylist.aname}</td>
					<td align = "center">${buylist.asize}</td>
					<td align = "center">${buylist.price}원(${buylist.buyamount}개)</td>
					<td align = "center">${buylist.buydate}</td>
					<td align = "center">${buylist.buyStatus}</td>
				</tr>
			</c:forEach>					
	 	</table> 
	 </center>
	 <center>
	  <table width="600">
			<tr>
			<center>
				<td colspan="5" align="center"><c:if test="${startPage>1}">
						<span> <a href="/KickOff/memOrderList?id=${sessionScope.userLoginInfo.id}&pageNumber=${startPage-1}">이전</a>
						</span> 
					</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${pageNumber == i }">
								<span> <a href="/KickOff/memOrderList?id=${sessionScope.userLoginInfo.id}&pageNumber=${i}"
									style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
								</span>
							</c:when>
							<c:otherwise>
								<span> <a href="/KickOff/memOrderList?id=${sessionScope.userLoginInfo.id}&pageNumber=${i}"
									style="text-decoration: none; color: gray;">${i}</a>&nbsp;
								</span>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${endPage < totalPageCount}">
					<span> <a href="/KickOff/memOrderList?id=${sessionScope.userLoginInfo.id}&pageNumber=${endPage+1}">다음</a>
						</span>
					</c:if></td>
			</center>
			</tr>
        </table>
        </center>
 <center>
  <jsp:include page="main/bottom.jsp" />
 </center>
</body>
</html>