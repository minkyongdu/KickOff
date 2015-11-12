<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		  			<img src="img/space.png" width="10px" height="20px">
		  			<a href = "logout"><img src = "img/logoutt.png" width="40px" height="15px"></a> <!-- 로그아웃 -->
		  			<img src="img/space.png" width="10px" height="20px">
			  		<a href="memPasswordCheckForm"><img src="img/mypaget.png" width="40px" height="15px"></a> <!-- 마이페이지 -->
			  		<img src="img/space.png" width="10px" height="20px">
			  		<a href=""><img src="img/cartlistt.png" width="40px" height="15px"></a>
			  		<img src="img/space.png" width="10px" height="20px">
			  		<a href="memOrderList?id=${sessionScope.userLoginInfo.id}"><img src="img/ordert.png" width="40px" height="15px"></a>
			  		<img src="img/space.png" width="10px" height="20px">
			  		<a href="noticeListForm"><img src="img/customert.png" width="40px" height="15px"></a>
</body>
</html>