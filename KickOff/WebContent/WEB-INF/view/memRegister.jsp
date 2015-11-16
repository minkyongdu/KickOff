<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입폼</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript" src="js/RegisterCheck.js"></script>
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
	  		<c:choose>
	  			<c:when test="${sessionScope.userLoginInfo.memGrade == 1}">
		  			<jsp:include page="main/memLogout.jsp" />
	  			</c:when>
	  			<c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
		  			<jsp:include page="main/memLogout.jsp" />
	  			</c:when>
		  		<c:when test="${sessionScope.comLoginInfo.comGrade == 5}">
		  			<jsp:include page="main/comLogout.jsp" />
		  		</c:when>
		  		<c:when test="${(sessionScope.userLoginInfo == null) || (sessionScope.comLoginInfo == null)}">
		  			<jsp:include page="main/selectLogin.jsp" /> 
				</c:when>
	  		</c:choose>
		</div>
 	<a href="/KickOff/"><img src="img/mlogo.png" width="360px" height="160px"></a>
  </div> <!-- header end -->
		<tr>
			<td width="150" height="20" colspan="2">
			<jsp:include	page="main/menubar.jsp" /></td>
		</tr>

		<div class="contents" align="center">
<table width="959px" height=100% cellpadding=0 cellspacing=0 border=0>
<tr>
<td height=100% align=center>
<tr>
<td valign=top width=100% height=100%>
<!-- 상단이미지 || 현재위치 -->
<TABLE width=100% cellpadding=0 cellspacing=0 border=0>
<tr>	
</tr>
<TR>
	<td><img src="img/custreg.png"></td>
</TR>
</TABLE>
<div class="indiv"><!-- Start indiv -->
<form name = "register" method = "post" action = "resultRegister">
<div style="border:1px solid #DEDEDE;">
<table width="956px" cellpadding=0 cellspacing=0 border=0 style="font-family: arial; font-style: bold;">
<tr>
<td style="border:5px solid #F3F3F3;">

<table width="950px" cellpadding=0 cellspacing=0>
<tr>
<td style="padding:10px 0" align=center>

<table width=97% cellpadding=5 cellspacing=0 border=0>
<tr>
	<td>아이디</td>
	<td>
	<input type="text" name="id" id="id"  maxlength=16  option=regId label="아이디">
	<button type="button" class="ml-button"  style="font-weight: bold;" id="idCheck">중복체크</button>
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
<tr>
	<td class=memberCols1>비밀번호</td>
	<td class=memberCols2>
	<input type="password" name="password" id="password" option=regPass label="비밀번호" maxlength="12">
	<span>영문, 숫자로 7~12자 이내</span></td>
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
<tr>
	<td class=memberCols1>비밀번호확인</td>
	<td class=memberCols2>
	<input type="password" name="password2"  label="비밀번호" maxlength="12">
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
<tr>
	<td class=memberCols1>이름</td>
	<td class=memberCols2>
	<input type="text" name="name"  label="이름">
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
<tr>		
</tr>
<tr></tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
<tr>
	<td>생년월일</td>
	<td>
	<select name="year" id = "year" size="1"
                                 tabindex='9' onchange="monthDay();">
                                    <option value = "none">----</option>
                              </select>년
	<select name="month" id = "month" size="1"
                              tabindex='10' onchange="monthDay();"> 
                                 <option value = "none">--</option>
                           </select>월
	<select name="day" size="1" id = "day" tabindex='11'>
                                 <option value = "none">--</option>
                           </select>일
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>

<tr>
</tr>
<tr></tr>
<tr>
</tr>
<tr></tr>

<tr>
	<td>이메일</td>
	<td>
	<input type="text"
                              name="email1" size="20" maxlength="20" height="29px"
                              style='ime-mode: disabled' tabindex='5' >
<select name ="email2" style="height: 29px; ">
					               <option selected>@naver.com</option>
					               <option>@daum.net</option>
					               <option>@nate.com</option>
					               <option>@gmail.com</option>
					            </select>
	<span class=noline style="padding-left:10px"><input type=checkbox name=mailling checked><span style="font:8pt 돋움;color:#007FC8" >정보,이벤트메일수신</span></span>
	<div style="letter-spacing:-1;color:#FF6000">※ <span style="font-size:8pt;">주문 관련 정보, 주요 공지사항 및 이벤트 당첨 안내 등은 수신 동의 여부에 관계없이 자동 발송됩니다.</span></div>
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>

<tr>
	<td> 주소</td>
	<td>

	<table>
	<tr>
		<td>
		<input type="text" name="addr1" id="addr1" size=9 readonly>
		<a href = "javascript:test();"><img src="img/postnum.png" border=0 align=absmiddle></a>
		</td>
	</tr>
	<tr>
		<td>
		<input type="text" name="addr2" id="addr2"  readonly size="50"><br>
		<input type="text" name="addr3" id="addr3" size="50" value = "">
				
		</td>
	</tr>
	</table>

	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>

<tr>
	<td>연락처</td>
	<td>
	<input type="text" name="phonenum1"
                              size="4" maxlength="3" tabindex='19'
                              style='ime-mode: disabled; text-align:center' > -
	<input type="text"
                              name="phonenum2" size="5" maxlength="4"
                              tabindex='20' style='ime-mode: disabled; text-align:center' > -
	<input
                              type="text" name="phonenum3" size="5" maxlength="4"
                              tabindex='21' style='ime-mode: disabled; text-align:center' >

	<span class=noline style="padding-left:10px"><input type=checkbox name=sms checked><span style="font:8pt 돋움;color:#007FC8" >정보,이벤트SMS수신</span></span>
	<div style="letter-spacing:-1;color:#FF6000">※ <span style="font-size:8pt;">주문 관련 정보 등 주요 안내 사항은 수신 동의 여부에 관계없이 자동 발송됩니다.</span></div>
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>
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
	<td>비밀번호<br>찾기 질문&nbsp;&nbsp;</td>
	<td>
	<select name="pwdQ" size="1" 
                              tabindex='31'>
                                 <option selected>선택</option>
                                 <option>사는 곳이 어디입니까?</option>
                                 <option>어머니의 성함은?</option>
                                 <option>아버지의 성함은?</option>
                                 <option>내가 태어난 곳은?</option>
                                 <option>내가 다닌 초등학교는?</option>
                                 <option>나의 좌우명은?</option>
                           </select>
	</td>
</tr>
<tr><td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td></tr>

<tr>
	<td>비밀번호<br>찾기 답안&nbsp;&nbsp;</td>
	<td><input type="text" name="pwdA"
                              size="40" maxlength="100" tabindex='18' ></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
</div>

<Br>
<center>
	<img src="img/register.png" id="register">&nbsp;&nbsp;
	<a href="selectRegister"><img src="img/back.png"></a>
</center>
</form>
</div><!-- End indiv -->
</div> <!-- contents -->
  <tr>
 		<td width = "150" height = "150" colspan="2">
			<jsp:include page="main/bottom.jsp" />
		</td>
</tr>
</div> <!-- wrap end -->
</td>
</tr>
</table>
</div>
</div>

</body>
<script type="text/javascript">
var year = document.getElementById("year");
var month = document.getElementById("month");
var day = document.getElementById("day");

for(var i=1,j = 2015;i<=30;i++,j--){

   year.options[i] = new Option(j,j);
   
}
for(var i=1;i<=12;i++){
   month.options[i] = new Option(i,i);
   
}
function monthDay(){
   day.options.length = 1;
   var febDay = year.value%4==0?29:28;
   var Days = new Array;
   Days = [31,febDay,31,30,31,30,31,31,30,31,30,31];
   for(var i = 1; i <= Days[month.value -1] ; i++){
      day.options[i] = new Option(i,i);
   }
}
</script>
</html>