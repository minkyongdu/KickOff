<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h3>개인제품주문리스트</h3>
		<hr>
		<table border="1" cellpadding="5">
			<tr bgcolor="yellow">
				<th>주문번호</th>
				<th>물품이미지</th>
				<th>제품이름</th>
				<th>주문사이즈</th>
				<th>주문가격(수량)</th>
				<th>주문날자</th>
				<th>주문상태</th>
			</tr>
			 <c:forEach var="buylist" items="${buyMemberlist}">
				<tr>
					<td>${buylist.buyNum}</td>
					<td>
						<img src="/KickOff/img/${buylist.imgFile1}" width="100" height="100">
					</td>
					<td>${buylist.aname}</td>
					<td>${buylist.asize}</td>
					<td>${buylist.price}원(${buylist.buyamount}개)</td>
					<td>${buylist.buydate}</td>
					<td>${buylist.buyStatus}</td>
				</tr>
			</c:forEach>					
	 	</table>
	 </center>
</body>
</html>