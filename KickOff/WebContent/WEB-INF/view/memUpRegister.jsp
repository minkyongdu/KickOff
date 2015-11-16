<%@page import="kickoff.model.beans.MemberVO"%>
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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<script type="text/javascript" src="js/UpdateIDCheck.js"></script>
<script type="text/javascript">
$(document).ready(function() { 
   var ema = $("#email2 option:selected").val();
   var naver = "naver.com";
   var daum = "daum.net";
   var nate = "nate.com";
   var gmail = "gmail.com"
   if(ema == naver){
      $("#email2 option:eq(1)").remove(); 
   }else if(ema == daum){
      $("#email2 option:eq(2)").remove(); 
   }else if(ema == nate){
      $("#email2 option:eq(3)").remove(); 
   }else if(ema == gmail){
      $("#email2 option:eq(4)").remove(); 
   }
});
$(document).ready(function() { 
	   var ema = $("#pwdQ option:selected").val();
	   var q1 = "사는 곳이 어디입니까?";
	   var q2 = "어머니의 성함은?";
	   var q3 = "아버지의 성함은?";
	   var q4 = "내가 태어난 곳은?";
	   var q5 = "내가 다닌 초등학교는?";
	   var q6 = "나의 좌우명은?";
	   if(ema == q1){
	      $("#pwdQ option:eq(1)").remove(); 
	   }else if(ema == q2){
	      $("#pwdQ option:eq(2)").remove(); 
	   }else if(ema == q3){
	      $("#pwdQ option:eq(3)").remove(); 
	   }else if(ema == q4){
	      $("#pwdQ option:eq(4)").remove(); 
	   }else if(ema == q5){
	      $("#pwdQ option:eq(5)").remove();  
	   }else if(ema == q6){
	      $("#pwdQ option:eq(6)").remove(); 
	   }
	   
	});
</script>
<script>
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
         </c:choose>
         
         <c:choose>
            <c:when test="${sessionScope.userLoginInfo.memGrade == 6}">
               <jsp:include page="main/memLogout.jsp" />
            </c:when>
         </c:choose>
      </div>
       <a href="/KickOff/"><img src="img/mlogo.png" width="360px" height="160px"></a>
     </div> <!-- header end -->
   <jsp:include page="main/menubar.jsp" />
   <div class="contents" align="center">
      <img src="img/meminfomodify.png">
      <table width="959px" height=100% cellpadding=0 cellspacing=0 border=0>
         <tr>
            <td valign=top width="100%" height="100%">
               <form name="upregister" method="post" action="upRegister" onSubmit="checkfield();return false">
                     <c:if test="${sessionScope.userLoginInfo.id == null}">
                        <c:choose>
                           <c:when test="${sessionScope.comLoginInfo.id == null}">
                              <script type="text/javascript">
                                 location.href = 'loginForm';
                              </script>
                           </c:when>
                        </c:choose>
                     </c:if>
                     <table width="956px" cellpadding=0 cellspacing=0 border=0 style="font-family: arial; font-style: bold;">
                     <tr>
                        <td style="border:5px solid #F3F3F3;">
                           <table width="100%" cellpadding=0 cellspacing=0>
                              <tr>
                                 <td style="padding:10px 0" align=center>
                                    <table width=97% cellpadding=5 cellspacing=0 border=0>
                                       <tr>
                                          <td>회원아이디</td>
                                          <td>
                                             ${sessionScope.userLoginInfo.id}
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"></td>
                                       </tr>
                                       <tr>
                                          <td>비밀번호</td>
                                          <td>
                                             <input type="password" name="password" size="15" maxlength="12" tabindex='3'>
                                             <span> 영문, 숫자로 4~12자 이내 </span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;" />
                                       </tr>
                                       <tr>
                                          <td>비밀번호확인</td>
                                          <td>
                                             <input type="password" name="password2" size="15" maxlength="12" tabindex='4'>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;" />
                                       </tr>
                                       <tr>
                                          <td>이름</td>
                                          <td>
                                             ${sessionScope.userLoginInfo.name}
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;" />
                                       </tr>
                                       <tr>
                                          <td>생년월일</td>
                                          <td>
                                             <span class="gray">${sessionScope.userLoginInfo.birthday.split('-')[0]}년 </span>
                                             <span class="gray">${sessionScope.userLoginInfo.birthday.split('-')[1]}월</span>
                                             <span class="gray">${sessionScope.userLoginInfo.birthday.split('-')[2]}일</span>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;" />
                                       </tr>
                                       <tr>
                                          <td>이메일</td>
                                          <td>
                                             <input type="text" name="email1" size="20" value="${sessionScope.userLoginInfo.email.split('@')[0]}" maxlength="80" style='ime-mode: disabled' tabindex='5'>@<select id="email2" name="email2">
                                                <option selected>${sessionScope.userLoginInfo.email.split('@')[1]}</option>
                                                <option >naver.com</option>
                                                <option >daum.net</option>
                                                <option >nate.com</option>
                                                <option >gmail.com</option>
                                             </select>
                                             <span class=noline style="padding-left:10px">
                                                <input type=checkbox name=mailling checked>
                                                <span style="font:8pt 돋움;color:#007FC8" >정보,이벤트메일수신</span>
                                             </span>
                                             <div style="letter-spacing:-1;color:#FF6000">
                                                <span style="font-size:8pt;">※ 주문 관련 정보, 주요 공지사항 및 이벤트 당첨 안내 등은 수신 동의 여부에 관계없이 자동 발송됩니다.</span>
                                             </div>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;" />
                                       </tr>
                                       <tr>
                                          <td>주소</td>
                                          <td>
                                             <input type="text" name="addr1" id="addr1" value="${sessionScope.userLoginInfo.addr1}" size="7" maxlength="7" readonly>
                                             <a href="javascript:test();"><img src="img/postnum.png" width="70" height="22" id='btnZipCode' style='cursor: hand' border="0"></a>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             <td colspan="3"><input type="text" name="addr2" id="addr2" size="40" maxlength="100" tabindex='17' value="${sessionScope.userLoginInfo.addr2}" readonly>
                                             <br>
                                             <input type=text name=addr3 id="addr3" maxlength="40" size=40 value="" label="세부주소">   
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;" />
                                       </tr>
                                       <tr>
                                          <td>연락처</td>
                                          <td>
                                             <input type="text" name="phonenum1"
                                                size="4" maxlength="3" tabindex='19'
                                                value="${sessionScope.userLoginInfo.phonenum.split('-')[0]}"
                                                style='ime-mode: disabled; text-align: center'>
                                                - <input type="text" name="phonenum2" size="5"
                                                maxlength="4"
                                                value="${sessionScope.userLoginInfo.phonenum.split('-')[1]}"
                                                tabindex='20'
                                                style='ime-mode: disabled; text-align: center'>
                                                - <input type="text" name="phonenum3" class="box01"
                                                size="5" maxlength="4" tabindex='21'
                                                style='ime-mode: disabled; text-align: center'
                                                value="${sessionScope.userLoginInfo.phonenum.split('-')[2]}">
                                             <span class=noline style="padding-left:10px">
                                                <input type=checkbox name=sms checked><span style="font:8pt 돋움;color:#007FC8" >정보,이벤트SMS수신</span>
                                             </span>
                                             <div style="letter-spacing:-1;color:#FF6000">
                                                <span style="font-size:8pt;">※ 주문 관련 정보 등 주요 안내 사항은 수신 동의 여부에 관계없이 자동 발송됩니다.</span>
                                             </div>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"/>
                                       </tr>
                                       <tr>
                                          <td>비밀번호<br>찾기 질문&nbsp;&nbsp;</td>
                                          <td>
                                             <select name="pwdQ" size="1" id = "pwdQ"
                                                tabindex='31'>
                                                   <option selected>${sessionScope.userLoginInfo.pwdQ}</option>
                                                   <option>사는 곳이 어디입니까?</option>
                                                   <option>어머니의 성함은?</option>
                                                   <option>아버지의 성함은?</option>
                                                   <option>내가 태어난 곳은?</option>
                                                   <option>내가 다닌 초등학교는?</option>
                                                   <option>나의 좌우명은?</option>
                                 </select>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td colspan=2 height=1 bgcolor="#DEDEDE" style="padding:0px;"/>
                                       </tr>
                                       <tr>
                                          <td>비밀번호<br>찾기 답안&nbsp;&nbsp;</td>
                                          <td>
                                             <input type="text"
                                                name="pwdA" size="40" maxlength="100" tabindex='18'
                                                value = "${sessionScope.userLoginInfo.pwdA}">
                                          </td>
                                       </tr>
                                       <input type="hidden" value="${sessionScope.userLoginInfo.id}" name="id">
                                    </table>
                                 </td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                  </table>

            </td>
         </tr>
      </table>
      <br>
      <input type="image" src="img/modify.png">&nbsp;&nbsp;
         <a href="javascript:history.back();"><img src="img/back.png"></a>
         <br>
         <br>      
         <a href="memDelete"><img src="img/leave.png" align="right" height="50" width="100"></a>
   </div>
   </form><!-- contents -->
   <div class="footer" align="center">
        <img src="img/copyright.png" width="960px" height="150px"> 
     </div> <!-- footer end -->
</div><!-- wrap end -->
</body>
</html>