<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<script type="text/javascript" src = "js/UpdateIDCheck.js"></script>
<script>
	function test() {
		win_post = window.open('/KickOff/post', "post",
				"toolbar=no ,width=370 ,height=300 ,directories=no,"
						+ "status=yes,scrollbars=yes,menubar=no");
	}
</script>
<body>
	<div class="wrap">
		<div class="header" align="center">
			<div class="toparea" align="right">
				<c:choose>
					<c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
						<jsp:include page="main/comLogout.jsp" />
					</c:when>
				</c:choose>
			</div>
			<a href="main"><img src="img/mlogo.png" width="360px"
				height="160px"></a>
		</div>
		<tr>
			<td width="150" height="20" colspan="2">
			<jsp:include page="main/menubar.jsp" /></td>
		</tr>
		<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
      	<script type="text/javascript">
      	location.href='loginForm';
      	</script>
      	</c:when>
	</c:choose>
	</c:if>
		<div class="contents" align="center">
		<table width="959px" height=100% cellpadding=0 cellspacing=0 border=0>
				<tr>
					<td height=100% align=center>
				<tr>
					<td valign=top width=100% height=100% bgcolor="" background="">
						<!-- 상단이미지 || 현재위치 -->
						<TABLE width=100% cellpadding=0 cellspacing=0 border=0>
							<tr>
							</tr>
							<tr>
								<td><img src="img/cominfomodify.png"></td>
							</tr>
						</TABLE>
			<form name="comupregister" method="post" action="comUpRegi"
				onSubmit="comcheckfield();return false">
				<div align="center"></div>
				<tr>
					<td colspan="2" style="border:5px solid #F3F3F3;">
						<center>
							<tr>
								<td height="633" align="center"
									style="width: 798px; height: 1px;">
									<table width="800" border="0" cellspacing="0" cellpadding="0">
									<tr></tr><tr></tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp; <span>
													회원 아이디</span></td>

											<td width="8" style="width: 50px;">&nbsp;</td>
											<td colspan="2">${sessionScope.comLoginInfo.id}</td>
											<td width="139">&nbsp;</td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp; <span>
													비밀번호</span>
											</td>
											<td width="8">&nbsp;</td>
											<td colspan="3"><input type="password" name="password"
												size="15" maxlength="12" tabindex='3'> <span>
													영문, 숫자로 4~12자 이내 </span></td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp;
												비밀번호 확인</td>
											<td width="8">&nbsp;</td>
											<td colspan="3"><input type="password" name="password2"
												size="15" maxlength="12" tabindex='4'></td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp; 이메일
											</td>
											<td width="8">&nbsp;</td>
											<td colspan="3" class="point_color"><input type="text"
												name="comemail1" size="20" maxlength="80"
												style='ime-mode: disabled' tabindex='5'>@<select
												name="comemail2">
													<option selected>naver.com</option>
													<option>daum.net</option>
													<option>nate.com</option>
													<option>gmail.com</option>
											</select> <span> </span></td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp; 기업명
											</td>
											<td width="8">&nbsp;</td>
											<td colspan="3">${sessionScope.comLoginInfo.comname}</td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp; 대표
											</td>
											<td width="8">&nbsp;</td>
											<td colspan="3">${sessionScope.comLoginInfo.comceo}</td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp; 사업자
												등록번호</td>
											<td width="8">&nbsp;</td>
											<td>${sessionScope.comLoginInfo.combusinnum}</td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" bgcolor="#F6F6F6" height="25">&nbsp;
												우편번호</td>
											<td width="8">&nbsp;</td>
											<td width="126"><input type="text" name="addr1"
												id="addr1" value="${sessionScope.comLoginInfo.addr1}"
												size="7" maxlength="7" readonly>
											<td width="145"><a href="javascript:test();"><img
													src="img/postnum.png" width="70" height="22"
													id='btnZipCode' style='cursor: hand' border="0"></a></td>
											<td width="139"></td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td width="142" valign="middle" bgcolor="#F6F6F6" rowspan="2">&nbsp;
												주소</td>
											<td height="3"></td>
											<td colspan="3"><input type="text" name="addr2"
												id="addr2" size="40" maxlength="40" tabindex='17'
												value="${sessionScope.comLoginInfo.addr2}" readonly>
											</td>
										</tr>
										<tr>
											<td height = "3"></td>
											<td colspan = "3"><input type=text name=addr3 id="addr3" maxlength="40" size=40
											 value = "" label="세부주소"></td>
										</tr>
										<tr>
											<td colspan="5" height="5"></td>
										</tr>
										<tr>
											<td rowspan="1" width="142" valign="middle" bgcolor="#F6F6F6">
												<table width="142" border="0" cellspacing="0"
													cellpadding="0">
													<tr>

													</tr>
												</table>&nbsp; 연락처
											</td>
											<td width="8" rowspan="3">&nbsp;</td>
											<td colspan="3"><input type="text" name="comphonenum1"
												size="4" maxlength="3" tabindex='19'
												value="${sessionScope.comLoginInfo.comphonenum.split('-')[0]}"
												style='ime-mode: disabled; text-align: center'> - <input
												type="text" name="comphonenum2" size="5" maxlength="4"
												value="${sessionScope.comLoginInfo.comphonenum.split('-')[1]}"
												tabindex='20' style='ime-mode: disabled; text-align: center'>
												- <input type="text" name="comphonenum3" class="box01" size="5"
												maxlength="4" tabindex='21'
												style='ime-mode: disabled; text-align: center'
												value="${sessionScope.comLoginInfo.comphonenum.split('-')[2]}">
												<br>물품배송에 관련하여 통화가 필요할 경우가 있으니<br> 정확한 연락처를 기입하여
												주세요.</td>
										</tr>
										<tr bgcolor="#FFFFFF" align="center">
											<td colspan="5">
												<table width="209" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td><input type="image"
															src="img/modify.png"></td>
														<td><a
															href="javascript:'history.back()'"><img
																src="img/back.png"></a></td>
													</tr>
												</table>
											</td>
										</tr>
										<tr bgcolor="#FFFFFF" align="center">
											<td height="15" colspan="5">&nbsp;</td>
										</tr>
										<input type="hidden" value="${sessionScope.comLoginInfo.id}"
											name="id">
									</table>
								</td>
							</tr>
							</table>
							</center>
							</td>
							</tr>
			</form>
			</td>
			</tr>
			</center>
			</center>
		</div>

		<tr>
			<td width="150" height="150" colspan="2">
			<jsp:include page="main/bottom.jsp" /></td>
		</tr>
		<!-- footer end -->
	</div>
	<!-- wrap end -->
</body>
</html>