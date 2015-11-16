<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입폼</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/menu.js"></script>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/ComRegisterCheck.js"></script>
<script type="text/javascript">
	function test() {
		win_post = window.open('/KickOff/post', "post",
				"toolbar=no ,width=370 ,height=300 ,directories=no,"
						+ "status=yes,scrollbars=yes,menubar=no");
	}
</script>
<body class="kortext">
	<div class="wrap">
		<div class="header" align="center">
			<div class="toparea" align="right">
				<jsp:include page="main/selectLogin.jsp" />
			</div>
			<a href="/KickOff/"><img src="img/mlogo.png" width="360px"
				height="160px"></a>
		</div>
		<!-- header end -->
			<jsp:include page="main/menubar.jsp" />

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
							<TR>
								<td><img src="img/comregister.png"></td>
							</TR>
						</TABLE>
						<div class="contents" align="center">
							<form id="comRegister" name="comRegister" method="post"
								action="comResultregister" onSubmit="checkfield();return false">
								<div style="border: 1px solid #DEDEDE;" class="hundred">
									<table width="956px" cellpadding=0 cellspacing=0 border=0>
										<tr>
											<td style="border: 5px solid #F3F3F3;">
												<table width="950px" cellpadding=0 cellspacing=0>
													<tr>
														<td style="padding: 10px 0" align=center>
															<table width=97% cellpadding=5 cellspacing=0 border=0>
																<tr>
																	<td>아이디</td>
																	<td><input type=text name="id" maxlength=16
																		 label="아이디" id = "id"> 
																		 <button type="button" style="font-weight: bold;" id="idCheck">중복체크</button></td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
																<tr>
																	<td>비밀번호</td>
																	<td><input type=password name=password id = "password"
																		label="비밀번호" maxlength="12" size="15">
																		<span>영문, 숫자로 7~12자 이내</span></td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
																<tr>
																	<td>비밀번호확인</td>
																	<td><input type=password name=password2 label="비밀번호" maxlength="12" size="15">
																	</td>
																</tr>
																<tr>
																	<td>이메일</td>

																	<td colspan="3" class="point_color"><input
																		type="text" name="comemail1" size="20" maxlength="80"
																		style='ime-mode: disabled' tabindex='5'><select
																		name="comemail2">
																			<option selected>@naver.com</option>
																			<option>@daum.net</option>
																			<option>@nate.com</option>
																			<option>@gmail.com</option>
																	</select> <span> </span></td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
																<tr>
																	<td>기업명</td>
																	<td><input type=text name=comname label="이름"></td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
																<tr>
																</tr>
																<tr></tr>
																<tr>
																	<td class=memberCols1>대표</td>
																	<td class=memberCols2><input type=text name=comceo
																		 label="이름"></td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
																<tr>
																	<td>사업자 등록번호</td>
																	<td><input type="text" name="combusinnum1"
																		size="3" maxlength="3" tabindex='19'
																		style='ime-mode: disabled; text-align: center'>
																		- <input type="text" name="combusinnum2" size="2"
																		maxlength="2" tabindex='20'
																		style='ime-mode: disabled; text-align: center'>
																		- <input type="text" name="combusinnum3" class="box01"
																		size="5" maxlength="5" tabindex='21'
																		style='ime-mode: disabled; text-align: center'>
																	</td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
																<tr>
																</tr>
																<tr></tr>
																<tr>
																</tr>
																<tr></tr>
																<tr>
																</tr>
																<tr></tr>
																<tr>
																	<td><font color=FF6000></font> 주소</td>
																	<td>
																		<table>
																			<tr>
																				<td><input type=text name=addr1 id="addr1"
																					size=7 class=line readonly 
																					label="우편번호"> <a href="javascript:test();"><img
																						src="img/postnum.png" border=0 align=absmiddle></a>
																				</td>
																			</tr>
																			<tr>
																				<td><input type=text name=addr2 id="addr2"
																					readonly size=50 maxlength="50"
																					label="주소"><br> <input type=text
																					name=addr3 id="addr3" maxlength="50" size=50
																					label="세부주소"></td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
																<tr>
																	<td class=memberCols1>연락처</td>
																	<td class=memberCols2><input type="text"
																		name="comphonenum1" size="4" maxlength="3"
																		tabindex='19' style='ime-mode: disabled'> - <input
																		type="text" name="comphonenum2" size="5" maxlength="4"
																		tabindex='20' style='ime-mode: disabled'> - <input
																		type="text" name="comphonenum3" class="box01" size="5"
																		maxlength="4" tabindex='21' style='ime-mode: disabled'>
																	</td>
																</tr>
																<tr>
																	<td colspan=2 height=1 bgcolor="#DEDEDE"
																		style="padding: 0px;"></td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</div>
								<center>
									<img src="img/register.png" id="register">&nbsp;&nbsp;
									<a href="selectRegister"><img src="img/back.png"></a>
								</center>
							</form>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<br>
	</div>
	<!-- End indiv -->
	<!-- contents -->
	<tr>
		<td width="150" height="150" colspan="2">
		<jsp:include page="main/bottom.jsp" /></td>
	</tr>
	<!-- wrap end -->
</body>
</html>