<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<h5>주문이 성공하였습니다.</h5>
	<hr>
	<input type="button" value="마이 리스트로" onclick="location.href='/KickOff/memOrderList?memberNum=${sessionScope.userLoginInfo.memberNum}'">
	<input type="button" value="회사 리스트로" onclick="location.href='/KickOff/comOrderList?companyNum=${sessionScope.comLoginInfo.companyNum}'">
	<input type="button" value="관리 리스트로" onclick="location.href='/KickOff/orderList'">
</center>
</body>
</html>