<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]> <html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]> <html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Login Form</title>
<link rel="stylesheet" href="css/style.css">
<!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
</head>
<body>
<center>
   <table cellspacing="0" style="width: 980px;">
      <tr>
         <td align="center" style="padding: 70px 0 50px 0;">



            <table cellspacing="0" style="width: 740px;">
               <tr>
                  <td style="padding-bottom: 10px;">
                     <table cellspacing="0" style="width: 100%;">
                        <tr>
                           <td align="left"><img title="회원로그인" alt="회원로그인"
                              src="img/LoginTitle.gif"></td>
                           <td align="right" valign="bottom"><img
                              title="다양한서비스를 이용하시려면 로그인을 이용해주세요"
                              alt="다양한서비스를 이용하시려면 로그인을 이용해주세요" src="img/textLogin.gif"></td>
                        </tr>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td style="border: 1px solid #eaeaea; border-top: none;"
                     valign="top">
                     <table cellspacing="0" style="width: 100%;">
                        <tr>
                           <td><div
                                 style="height: 1px; font-size: 1px; background-color: #8b8b93; border: 1px solid #ea9616;"></div></td>
                        </tr>
                        <tr>
                           <td>
                              <table cellspacing="0" style="width: 100%;">
                                 <tr>
                                    <td style="border-right: 1px dashed #cfcfcf;">
                                       <!--폼시작-->
                                       <FORM action="./happy_member_login.php?mode=login_reg"
                                          method="post" name="happy_member_login_form">
                                          <input type="hidden" name="returnUrl" value=""> <input
                                             type='hidden' name='save_id' value="" />
                                          <!--히든값 삭제하지말것! -->

                                          <table cellpadding="0" cellspacing="0" width="90%"
                                             border="0">
                                             <tr>
                                                <td align="left">
                                                   <table cellspacing="0" cellpadding="0">
                                                      <tr>
                                                         <td>
                                                            <table cellspacing="0" style="width: 100%;">
                                                               <tr>
                                                                  <td align="left" style="width: 90px;"><b>아이디</b></td>
                                                                  <td id="input_ie7"><input name="member_id"
                                                                     value="" type="text" id="id" tabindex="1"
                                                                     style="border: 1px solid #dbdbdb; padding-left: 10px; height: 33px; line-height: 33px; width: 230px; background-color: #f8f8f8;"></td>
                                                               </tr>
                                                               <tr>
                                                                  <td align="left"><b>비밀번호</b></td>
                                                                  <td id="input_ie7"><input name="member_pass"
                                                                     value="" type="password" id="pass" tabindex="2"
                                                                     style="border: 1px solid #dbdbdb; border-top: none; padding-left: 10px; height: 33px; line-height: 33px; width: 230px; background-color: #f8f8f8;"></td>
                                                               </tr>
                                                            </table>
                                                         </td>

                                                         <td style="padding-left: 5px;">
                                                            <table cellspacing="0" border="0">
                                                               <tr>
                                                                  <td><input type="image" name="formimage1"
                                                                     src="/view/login.gif"
                                                                     align="absmiddle" border="0" tabindex="3"></td>
                                                               </tr>
                                                            </table>
                                                         </td>
                                                      </tr>
                                                   </table>
                                                </td>

                                             </tr>
                                             <tr>
                                                <td align="left" style="padding: 10px 0 0 60px;">
                                                   <table cellspacing="0" border="0" align="left">
                                                      <tr>
                                                         <td
                                                            style="color: #b1b1b1; font-size: 11px; padding-top: 7px;"
                                                            valign="bottom"><input type="checkbox"
                                                            name="save" onclick="happy_member_autologin()"
                                                            id="save_login" value="" title="아이디저장" TabIndex="3"
                                                            style="width: 13px; height: 13px; vertical-align: middle;">
                                                            아이디저장</td>
                                                         <td
                                                            style="color: #b1b1b1; font-size: 11px; padding-top: 7px; padding-left: 10px;"
                                                            valign="bottom"><input type="checkbox"
                                                            name="auto_login_use" value="y"
                                                            style="width: 13px; height: 13px; vertical-align: middle;"
                                                            onClick="happy_member_auto_login_use()">
                                                            자동로그인</td>
                                                         <td style="color: #aeaeae; padding-left: 10px;"><div>
                                                               <br>
                                                               <A HREF="happy_member.php?mode=lostid"
                                                                  style="color: #aeaeae; font-size: 12px;">아이디
                                                                  찾기</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<A
                                                                  HREF="happy_member.php?mode=lostpass"
                                                                  style="color: #aeaeae; font-size: 12px;">비밀번호
                                                                  찾기
                                                            </div>
                                                            </div></td>
                                                      </tr>
                                                   </table>
                                                </td>
                                             </tr>
                                          </table>
                                       </form>

                                       <table cellpadding="0" cellspacing="0" width="90%">
                                          <tr>
                                             <td style="padding-top: 20px;">
                                                <table cellspacing="0" cellpadding="0">
                                                   
                                                   </tr>
                                                </table>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td style="padding-top: 20px;">
                                                <table cellspacing="0" style="width: 100%;"
                                                   cellpadding="0">
                                                   <tr>
                                                      <td style="line-height: 20px;" align="left"><font
                                                         class="smfont4" style="color: #525252;">회원정보가
                                                            잘 기억나지 않으세요?</font><br> <font class="smfont3"
                                                         style="color: #aeaeae;">아이디/비밀번호찾기 서비스를 이용하여
                                                            잊어버렸던 정보를 찾아보실 수 있습니다.</font></td>
                                                   </tr>
                                                   <tr>
                                                      <td align="center" style="padding-top: 10px;"><A
                                                         HREF="happy_member.php?mode=joinus"><img
                                                            src="img/btn_member_regist.gif"></a></td>
                                                   </tr>
                                                </table>
                                             </td>
                                          </tr>
                                       </table>
                                    </td>
                                    <td style="padding: 10px 0 10px 0;" align="center"><img
                                       src='../../img/kickoff.jpg' width='250' height='318'
                                       border=0 align='absmiddle'></td>
                                 </tr>
                              </table>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
            </table>
            </center>
</body>
</html>