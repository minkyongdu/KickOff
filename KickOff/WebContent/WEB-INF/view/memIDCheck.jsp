<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
</script>
<body bgcolor = "f0e68c" onload = "fromParent">
<center>
	<form name = "IDCheckForm">
		<h3>아이디 중복검사</h3>
		<hr>
		<center>
			${resultChecks}
		</center>
		<input type="button" value = "닫기" onclick="window.close()">
		
	</form>
</center>
</body>
</html>