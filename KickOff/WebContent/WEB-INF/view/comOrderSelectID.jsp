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
<h3>회원 상세정보</h3>
<table style="border:1px solid #999; border-top: none; border-left: none; border-right: none;" cellspacing="0"> 
	<tr bgcolor = "black">
		<th width = "100"><font color = "white">아이디</font></th>
		<th width = "80"><font color = "white">성명</font></th>
		<th width = "200"><font color = "white">우편번호</font></th>
		<th width = "500"><font color = "white">주소</font></th>
		<th width = "150"><font color = "white">전화번호</font></th>
	</tr>
	<tr>
		<td align = "center">${buyID[0].id}</td>
		<td align = "center">${buyID[0].subname}</td>
		<td align = "center">${buyID[0].subaddr1}</td>
		<td align = "center">${buyID[0].subaddr2}</td>
		<td align = "center">${buyID[0].subphonenum}</td>
	</tr>
</table>
<center> 
<br>
	<input type = "button" value = "창 닫기" onclick="window.close();"></td>
</center>
</center>
</body>
</html>