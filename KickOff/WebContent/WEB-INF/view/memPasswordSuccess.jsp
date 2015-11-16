<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src= "js/jquery.js"></script>
<script type="text/javascript" src= "js/PasswdCheck.js"></script>
<script type="text/javascript">
</script>
</head>
<body class="kortext">
<div class="wrap">
  <div class="header" align="center">
	  	<div class="toparea" align="right">
	  		<jsp:include page="main/selectLogin.jsp" />
		</div>
 	<a href="/KickOff/"><img src="img/mlogo.png" width="360px" height="160px"></a>
  	</div> <!-- header end -->
		<tr>
			<td width="150" height="20" colspan="2">
			<jsp:include page="main/menubar.jsp" /></td>
		</tr>
		<div class="contents" align="center">
<table width="900" height="238" border="0">
	<form action="updatePasswordOk" method="post" name="register">
		<input type="hidden" name='id' value='${id}'>
  		<tr>
    		<td colspan="4" align="center" height="50"><img src="img/changetext.png" width="850" height="50" /></td>
  		</tr>
  		<tr>
    		<td width="275" height="54" align="right">&nbsp;</td>
    		<td width="120" align="right">비밀번호 : </td>
    		<td width="6" align="left">&nbsp;</td>
    		<td width="481" align="left"><input type="password" size="20" name="password" /></td>
  		</tr>
 		 <tr>
    		<td height="61" align="right"></td>
    		<td height="61" align="right">비밀번호 확인 : </td>
    		<td align="left">&nbsp;</td>
    		<td align="left"><input type="password" size="20" name="password2"/></td>
  		</tr>
  		<tr>
    		<td height="61" colspan="4" align="center" valign="middle"><a href="" id="register"><img src="img/modify.png" /></a></td>
  		</tr>
  	</form>
</table>
</div> <!-- contents -->
            <tr>
 			<td width = "150" height = "150" colspan="2">
			<jsp:include page="main/bottom.jsp" />
		</td>
</tr>
            <!-- footer end -->
</div> <!-- wrap end -->
</body>
</html>