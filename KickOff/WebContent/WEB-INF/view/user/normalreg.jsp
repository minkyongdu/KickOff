<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<script type="text/javascript" src = "js/RegisterCheck.js"></script>
<script>
var childWin = null;
function winOpen(){
    childWin = window.open('memIDCheck?id='+document.register.id.value,'child','width=300,height=200');
}
function test() {
   win_post = window.open('/KickOff/post', "post",
         "toolbar=no ,width=370 ,height=300 ,directories=no,"
               + "status=yes,scrollbars=yes,menubar=no");
}
</script>
<body>
<form name = "register" method = "post" action = "resultRegister" onSubmit="checkfield();return false">
<center>
   <div align="center"></div>
   <tr>
      <td colspan="2"><form name="form" action="" method="post">
            <table width="600" height="700" border="0" cellpadding="0"
               cellspacing="0" style="width: 960px; ">
               <tr>
                  <td height="5" bgcolor="#EEEEEE"></td>
               </tr>
               <tr>
                  <td height="633" align="center" style="width: 798px; height: 1px; ">
                     <table width="800" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp;  <span> 회원아이디</span></td>
                              
                           <td width="8" style="width: 50px; ">&nbsp;</td>
                           <td colspan="2"><input type="text" name="id"
                              size="15" class="box01" maxlength="12"
                              style='ime-mode: disabled' tabindex='1'>  <img src="img/overchk.png" onclick="winOpen();" width="67px" height="23px" border="0" style="cursor: hand; width: 67px; height: 23px" tabindex="2"><br> <span
                              class="text-qa"> 영문 소문자, 숫자 4~12자 이내</span><span
                              class="text_333333"> </span></td>
                           <td width="139">&nbsp;
                           </td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; <span> 비밀번호</span>
                           </td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3"><input type="password" name="password"
                              size="15"  maxlength="12" tabindex='3'> <span>
                              영문, 숫자로 4~12자 이내 </span></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; 비밀번호 확인
                           </td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3"><input type="password" name="password2"
                              size="15" maxlength="12" tabindex='4'></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; E-mail 
                           </td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3" class="point_color"><input type="text"
                              name="email1" size="20" maxlength="80"
                              style='ime-mode: disabled' tabindex='5'>@
                              <select name ="email2">
					               <option selected>naver.com</option>
					               <option>daum.net</option>
					               <option>nate.com</option>
					               <option>gmail.com</option>
					            </select> <span>
                              </span></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; 이름
                           </td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3"><input type="text" name="name" size="15"
                            maxlength="5" tabindex='6'></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; 생일
                           </td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3"><span class="gray">
                                 <select name="year" id = "year" size="1"
                                 tabindex='9' onchange="monthDay();">
                                    <option value = "none">----</option>
                              </select> 년
                           </span> <select name="month" id = "month" size="1"
                              tabindex='10' onchange="monthDay();"> 
                                 <option value = "none">--</option>
                           </select> 
                           <span class="gray">월</span> <select name="day" size="1" id = "day" tabindex='11'>
                                 <option value = "none">--</option>
                           </select> <span class="gray">일
                              </span></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; 우편번호
                           </td>
                           <td width="8">&nbsp;</td>
                           <td width="126"> <input
                              type="text" name="addr1" id = "addr1"
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
                           <td width="142" valign="middle"
                              bgcolor="#F6F6F6">&nbsp;
                              주소
                           </td>
                           <td height="3"></td>
                           <td colspan="3"><input type="text" name="addr2" id = "addr2"
                             size="40" maxlength="100" tabindex='17' readonly>
                              <br> <input type="text" name="addr3"
                              size="40" maxlength="100" tabindex='18'></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td rowspan="1" width="142" valign="middle"
                              bgcolor="#F6F6F6">
                              <table width="142" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                    
                                 </tr>
                              </table>&nbsp;&nbsp;
                                  연락처 
                           </td>
                           <td width="8" rowspan="3">&nbsp;</td>
                           <td colspan="3"><input type="text" name="phonenum1"
                              size="8" maxlength="4" tabindex='19'
                              style='ime-mode: disabled'> - <input type="text"
                              name="phonenum2" size="8" maxlength="4"
                              tabindex='20' style='ime-mode: disabled'> - <input
                              type="text" name="phonenum3" class="box01" size="8" maxlength="4"
                              tabindex='21' style='ime-mode: disabled'><br>물품배송에 관련하여 통화가 필요할 경우가
                              있으니<br> 정확한 연락처를 기입하여 주세요. </td>
                        </tr>
                        <tr>
                           
                        </tr>
                        <tr>
                           
                        </tr>
                        <tr>
                           
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           <td class="usual_black" width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; <span class="join_text005869">비밀번호</span> 찾기 질문</td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3"><select name="pwdQ" size="1" 
                              tabindex='31'>
                                 <option selected>선택</option>
                                 <option>사는 곳이 어디입니까?</option>
                                 <option></option>
                                 <option></option>
                                 <option></option>
                                 <option></option>
                                 <option></option>
                           </select></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                                                   
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; 비밀번호 찾기 답</td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3" class="gray"> <input type="text" name="pwdA"
                              size="40" maxlength="100" tabindex='18'></td>
                        </tr>
                        <tr>
                           <td colspan="5" height="5"></td>
                        </tr>
                        <tr>
                           
                        </tr>
                        <tr>
                           <td width="142" bgcolor="#F6F6F6"
                              height="25">&nbsp; E-mail 수신동의
                           </td>
                           <td width="8">&nbsp;</td>
                           <td colspan="3" class="gray"><input type="checkbox"
                              name="mail_flag" value="Y" tabindex='27' checked> <span>E-mail 수신을 합니다. </span></td>
                        </tr>
                        <tr bgcolor="#FFFFFF" align="center">
                           <td colspan="5">
                              <table width="209" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                    <td width="101"><a href="javascript:CheckForm()"><img
                                          src="img/register.png" border="0" name="registerok"></a></td>
                                    <td width="99" align="left"><a
                                       href="main/content.jsp"><img
                                          src="img/cancel.png" border="0" name="cancel"></a></td>
                                 </tr>
                              </table>
                           </td>
                        </tr>
                        <tr bgcolor="#FFFFFF" align="center">
                           <td height="15" colspan="5">&nbsp;</td>
                        </tr>
</body>
</html>