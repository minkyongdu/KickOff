<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function sendAdd(groupNum){
	    opener.document.getElementById("groupNum").value=groupNum;
	    window.close();
	 }
</script>
<body class="kortext">
<center>
<table border = "5">
	<tr>
			<th>번호</th><th>중분류&소분류</th>
	</tr>
	<c:forEach var = "listgroup" items="${groupList}">
		<tr>
			<td id="groupNum" style="text-align: center;">
			<a href="javascript:sendAdd('${listgroup.groupNum}')">
					${listgroup.groupNum}</a></td>
			<td id="group">
			<c:choose>
				<c:when test="${listgroup.groupNum == 9}">
					${listgroup.mgroup}
				</c:when>
				<c:when test="${listgroup.groupNum != 9}">
					${listgroup.mgroup} - ${listgroup.sgroup}
				</c:when>
			</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>
</center>
</body>
</html>