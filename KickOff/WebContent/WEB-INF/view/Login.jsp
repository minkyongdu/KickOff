<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인하자</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</head>
<body>
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
   <table cellspacing="0" style="width: 950px;">
      <tr>
         <td align="center" style="padding: 70px 0 50px 0;">
            <table cellspacing="0" style="width: 740px;">
               <tr>
                  <td style="padding-bottom: 10px;">
                     <table cellspacing="0" style="width: 100%;">
                        <tr>
                           <td align="center"><img src="img/nologin.png"></td>
                        </tr>
                     </table>
                  </td>
               </tr>
               <tr>
                  <td style="border:0px; border-top: none;"
                     valign="top" align="center">
                     <table cellspacing="0" style="width: 100%;">
                        <tr>
                        </tr>
                        <tr>
                           <td>
                              <table cellspacing="0" style="width: 100%;">
                                 <tr>
                                    <td style="border-right: 0px dashed #cfcfcf;">
                                       <!--폼시작-->
                                       <form action = "loginProcess" method="post">
                                            <table cellpadding="0" cellspacing="0" width="90%" border="0" align="center">
                                             <tr>
                                                <td>
                                                   <table cellspacing="0" cellpadding="0" align="center">
                                                      <tr>
                                                         <td>
                                                            <table cellspacing="0" style="width: 100%;">
                                                               <tr>
                                                                  <td align="left" style="width: 90px;"><b class="kortext">아이디</b></td>
                                                                  <td id="input_ie7"><input name="id"
                                                                     type="text" id="id" tabindex="1"
                                                                     style="border: 1px solid #dbdbdb; padding-left: 10px; height: 33px; line-height: 33px; width: 230px; background-color: #f8f8f8;"></td>
                                                               </tr>
                                                               <tr>
                                                                  <td height="36" align="left"><b class="kortext">비밀번호</b></td>
                                                                 <td id="input_ie7"><input name="password"
                                                                     type="password" id="password" tabindex="2"
                                                                     style="border: 1px solid #dbdbdb; border-top: none; padding-left: 10px; height: 33px; line-height: 33px; width: 230px; background-color: #f8f8f8;"></td>
                                                               </tr>
                                                            </table>
                                                         </td>
                                                      </tr>
                                             <tr> 
                                                <td align="center" style="padding: 10px 0 0 60px;" colspan="2"><table cellspacing="0" border="0" align="center">
                                                      <tr>
                                                         <input type = "image" src = "img/loginicon.png">
                                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                               <a href="findIdPwd"><img src="img/findicon.png"></a>
                                                            	<!-- idfind.jsp : 찾기(아이디, 비밀번호) -->

                                                      </tr>
                                               <tr>
                                               	<td>
                                               		<input type ="radio" id = "selectDIV" name = "selectDIV" value = "member" checked="checked">
                                               		<img src = "img/normalUser.png" width = "100">
                                               	</td>
                                               	<td>
													<input type ="radio" id = "selectDIV" name = "selectDIV" value = "company">
													<img src = "img/companyUser.png" width = "100">
                                               	</td>
                                               </tr>
                                                   </table>
                                                   </form>
                                                </td>
                                             </tr>
                                          </table>
                                       
                                       <table align="center" cellpadding="0" cellspacing="0" width="90%">
                                          <tr>
                                             <td style="padding-top: 20px;">
                                                <table cellspacing="0" style="width: 100%;" cellpadding="0">
																							<tr>
																								<td style="line-height: 20px; width: 600px" align="center">
																									<font class="kortext" style="color: #525252;">아직
																										KICK OFF의 회원이 아니신가요?</font> <br> <font
																									class="kortext" style="color: #aeaeae;">회원가입을
																										하시고 즐거운 쇼핑을 즐겨보세요!</font>
																								</td>
																								<td valign="middle"><a href="selectRegister"><img src="img/regicon.png" align="center"></a></td>
																							</tr>
																							<tr>

																								
																								
																							</tr>
																						</table>
																					</td>
                                                      </tr>
                                                      </table>
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
            </div> <!-- contents -->
            <tr>
 			<td width = "150" height = "150" colspan="2">
			<jsp:include page="main/bottom.jsp" />
		</td>
</tr>
            <!-- footer end -->
</div> <!-- wrap end -->
</form>
</body>
</html>