<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<body class="kortext">
	<center>
		<h3>제품주문 전체리스트</h3>
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
			<c:forEach var="buy" items="${orderlist}">
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
					<form method="post" action="orderListUpdate">
						<select name="buyStatus" id="buyStatus">
							<option>${buy.buyStatus}</option>
							<option>---------------</option>
							<option value="주문취소">주문취소</option>
							<option value="반품/환불요청">반품/환불요청</option>							
							<option value="교환요청">교환요청</option>																					
						</select>
							<input type="submit" value="상태수정">
							<input type="hidden" name="buyNum" value="${buy.buyNum}">		
					</form>
					</td>
				</tr>
			</c:forEach>
	 	</table>

	 	<table width="600">
			<tr>
				<td colspan="5" align="center"><c:if test="${startPage>1}">
						<span> <a href="/KickOff/orderList?pageNumber=${startPage-1}">이전</a>
						</span>
					</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:choose>
							<c:when test="${pageNumber == i }">
								<span> <a href="/KickOff/orderList?pageNumber=${i}"
									style="text-decoration: none; color: blue; font-weight: bold;">${i}</a>&nbsp;
								</span>
							</c:when>
							<c:otherwise>
								<span> <a href="/KickOff/orderList?pageNumber=${i}"
									style="text-decoration: none; color: gray;">${i}</a>&nbsp;
								</span>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${endPage < totalPageCount}">
					<span> <a href="/KickOff/orderList?pageNumber=${endPage+1}">다음</a>
						</span>
					</c:if></td>
			</tr>
		</table>
	</center>
</body>
</html>