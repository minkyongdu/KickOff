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
		<h3>������ǰ�ֹ�����Ʈ</h3>
		<hr>
		<table border="1" cellpadding="5">
			<tr bgcolor="yellow">
				<th>�ֹ���ȣ</th>
				<th>��ǰ�̹���</th>
				<th>��ǰ�̸�</th>
				<th>�ֹ�������</th>
				<th>�ֹ�����(����)</th>
				<th>�ֹ�����</th>
				<th>�ֹ�����</th>
			</tr>
			 <c:forEach var="buylist" items="${buyMemberlist}">
				<tr>
					<td>${buylist.buyNum}</td>
					<td>
						<img src="/KickOff/img/${buylist.imgFile1}" width="100" height="100">
					</td>
					<td>${buylist.aname}</td>
					<td>${buylist.asize}</td>
					<td>${buylist.price}��(${buylist.buyamount}��)</td>
					<td>${buylist.buydate}</td>
					<td>${buylist.buyStatus}</td>
				</tr>
			</c:forEach>					
	 	</table>
	 </center>
</body>
</html>