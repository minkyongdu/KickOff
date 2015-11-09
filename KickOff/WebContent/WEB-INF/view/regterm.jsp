<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가입전 약관동의</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/menu.js"></script>
</head>
<script>
function Radiocheck(){
	if($(':radio[name="chkConfirm"]:checked').val() == "N" 
			|| $(':radio[name="chk1Confirm"]:checked').val() == "N" )
		{
			alert("동의를 하지 않으시면 회원가입을 하실 수 없습니다.");
			return;
		}
		document.regterm.action = "register";
		document.regterm.submit();
}
</script>
<body>
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
 	<a href="main"><img src="img/mlogo.png" width="360px" height="160px"></a>
  </div> <!-- header end -->
		<tr>
			<td width="150" height="20" colspan="2">
			<jsp:include page="main/menubar.jsp" /></td>
		</tr>

		<div class="contents" align="center">
		<form name = "regterm" method = "post" action = "javascript:Radiocheck();">
		<tr>
		<img src="img/custreg.png">
                           <td></td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td colspan="5" height="10"></td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td colspan="5" class="usual_black"><font face="Webdings">4</font>서비스 이용
                              약관</td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td colspan="5" height="213">
                              <p>
                                 <textarea name="formtextarea1" rows="16" cols="84">[ kickoff24.co.kr 회원 약관 ] 

제1조 목적
이 약관은 kickoff24.co.kr이 인터넷상에서 제공하는 모든 서비스의 이용방법과 절차에 관한 사항을 규정함을 목적으로 합니다.

제2조 kickoff24.co.kr 서비스
kickoff24.co.kr의 사이트에서 제공하는 모든 서비스는 무료로 회원에게 제공됩니다.
사용자는 회원으로 가입함으로써 모든 서비스를 이용할 수 있으며 회원에게는 
① 메일링 서비스 
② 개인 응모함 
③ 맞춤서비스 등 추가 서비스가 무료로 지원됩니다. 
회원 가입은 유료이며 자유로이 탈퇴와 재가입이 가능합니다. 

제3조 약관의 효력 및 변경
이 약관은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력을 발생 합니다.
1. kickoff24.co.kr은 사정상 혹은 영업상 중요한 사유가 발생될 경우에는 이 약관을 변경할 수 있으며, 변경된 약관은 회원에게 공지함으로써 효력을 발생합니다. 
2. 회원은 변경된 약관에 동의하지 않을 경우, 서비스 이용을 중단하고 회원 탈퇴를 요청할 수 있습니다. 변경된 약관의 효력 발생일 이후의 계속적인 서비스 이용은 약관의 변경 사항에 동의한 것으로 간주됩니다. 

제4조 회원 개인정보의 수집 및 이용 목적
1. kickoff24.co.kr은 서비스 제공과 관련하여 취득한 회원의 신상 정보를 본인의 승낙 없이 제3자에게 누설 또는 배포할 수 없으며 상업적 목적으로 사용할 수 없습니다. 다만, 다음 각 호에 해당하는 경우에는 그러하지 아니합니다.
①관계 법령에 의하여 수사상의 목적으로 관계기관으로부터 요구가 있는 경우 
②정보통신윤리위원회의 요청이 있는 경우 
③기타 관계법령에서 정한 절차에 따른 요청이 있는 경우

2. kickoff24.co.kr에서 향후에 다양한 서비스를 제공할 목적으로 본 사이트 이외의 사이트(이하 kickoff24.co.kr은 새로 제휴한 사이트)와 제휴하게 될 경우, 회원은 회사가 새로 제휴한 사이트의 회원이 될 수 있으며, 회원정보가 kickoff24.co.kr과 새로 제휴한 사이트에 전달됩니다.

3. kickoff24.co.kr은 향후에 본 사이트 이외의 사이트와 제휴하게 될 경우 미리 제휴하게 될 사이트에 대해여 회원에게 공지합니다

4. 회원이 kickoff24.co.kr이 향후에 제휴한 사이트에 회원 정보가 넘어가는 것을 원하지 않을 경우 언제라도 회원 탈퇴 의사를 밝힐 수 있습니다. 
회원은 kickoff24.co.kr이 제휴한 사이트의 회원 자격도 부여 받으며 회사가 제휴한 사이트를 이용할 수 있습니다.

5. kickoff24.co.kr은 업무와 관련하여 회원 전체 또는 일부의 개인정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있습니다.

제5조 이용 계약의 성립
가입 신청 양식을 기재한 후 등록버튼을 누르면 이 약관에 동의하는 것으로 간주됩니다.
1. 이용 계약은 이용자의 이용 신청에 대하여 kickoff24.co.kr이 승낙함으로써 성립합니다.
2. 회원에 가입하여 서비스를 이용하고자 하는 희망자는 kickoff24.co.kr이 요청하는 개인 신상정보를 제공해야 합니다.
3. 이용자의 이용 신청에 대하여 kickoff24.co.kr이 이를 승낙한 경우, kickoff24.co.kr은 회원 아이디(ID)와 기타 회사가 필요하다고 인정하는 내용을 이용자에게 통지합니다.

제6조 계약 사항의 변경
회원은 이용신청 시 기재한 개인정보가 변경되었을 경우에는 온라인으로 수정을 해야 하고 미 변경으로 인하여 발생되는 문제의 책임은 회원에게 있습니다.

제7조 kickoff24.co.kr의 의무
kickoff24.co.kr은 서비스 제공과 관련하여 취득한 회원의 정보를 본인의 동의 없이 제3자에게 제공하여서는 아니 됩니다. 
kickoff24.co.kr은 이용계약의 체결, 계약사항의 변경 및 해지 등 회원과의 계약 관련 절차 및 내용 등에 있어 회원에게 편의를 제공하도록 노력합니다. 
kickoff24.co.kr은 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생길 경우에는 이를 지체 없이 수리 또는 복구합니다. 
다만 천재지변, 비상사태 또는 그 밖에 부득이한 경우에는 그 서비스를 일시 중단하거나 중지할 수 있습니다. 
회원의 개인정보는 어떠한 일이 있더라도 상업적인 곳에 사용되지 않으며 보안 시스템으로 철저히 보호합니다. 
회원에게는 경품정보를 비롯한 홈페이지에서 제공하는 정보를 E-mail로 원하는 회원에게 제공합니다. 하지만 회원에게 전체 공지 사항 등 필요에 따라서 E-mail을 원하지 않는 사람에게도 공지사항을 보낼 수 있습니다.

제8조 회원의 의무
1. 회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 kickoff24.co.kr이 통지하는 사항을 준수하여야 하며, 기타 kickoff24.co.kr의 업무에 방해되는 행위를 하여서는 아니 됩니다.
2. 아이디(ID)와 비밀번호(PASSWORD)에 관한 모든 관리책임은 회원에게 있습니다. 
3. 회원에게 부여된 아이디(ID)와 비밀번호의 관리 소홀, 부정 사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
4. 회원은 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용제한 사항을 준수하여야 합니다. 
5. 회원은 kickoff24.co.kr의 사전승낙 없이는 서비스를 이용하여 영업활동을 할 수 없으며, 
그 영업활동의 결과와 회원이 약관에 위반한 영업활동을 이용하여 발생한 결과에 대하여 capsrok.co.kr은 책임을 지지 않습니다. 
회원은 이와 같은 영업활동에 대하여 kickoff24.co.kr에 대하여 손해배상의무를 집니다. 
6. 회원은 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도&middot;증여할 수 없으며, 이를 담보로 제공할 수 없습니다. 
7. 자신의 아이디(ID)가 부정하게 사용된 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.
8. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.
① 다른 회원의 ID를 부정하게 사용하는 행위
② 서비스에서 얻은 정보를 kickoff24.co.kr의 사전승낙 없이 회원의 이용 이외의 목적으로 복제하거나 이를 출판 및 방송 등에 사용하거나 제3자에게 제공하는 행위 
③ kickoff24.co.kr의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위 
④ 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위 
⑤ 범죄와 결부된다고 객관적으로 판단되는 행위 
⑥ 기타 관계법령에 위배되는 행위 

제9조 서비스 제공의 중지 
kickoff24.co.kr은 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다. 
1. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우 
2. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우 
3. 기타 불가항력적 사유가 있는 경우 
4. kickoff24.co.kr은 국가비상사태, 정전, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 
서비스의 전부 또는 일부를 제한하거나 정지할 수 있습니다. 

제 10조 계약 해지 및 자격 취소
kickoff24.co.kr은 다음 각 호에 해당하는 경우 서비스 제공의 일시 정지 및 중단을 할 수 있습니다.
1. 회원이 이용 계약을 해지하고자 하는 경우에는 회원 본인이 이용 해지 서비스 또는 전자우편을 통하여 해지하고자 하는 날의 1일전까지
(단, 해지일이 법정 공휴일인 경우 공휴일 개시 2일전까지) 이를 kickoff24.co.kr에 통지 또는 신청하여야 합니다.
2. kickoff24.co.kr은 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전 통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 중지할 수 있습니다.
① 본인의 실명으로 신청하지 않은 경우 
② kickoff24.co.kr이 정한 이용신청 요건이 미비 된 경우 (E-mail의 거짓 입력)
③ 이용 신청 시 필요 내용을 허위로 기재하여 신청한 경우 
④ 사회의 안녕과 질서 혹은 미풍양속을 저해할 목적으로 신청한 경우 
⑤ 신용정보의 이용 보호에 관한 법률에 의한 PC통신, 인터넷 서비스의 신용불량자로 등록되어 있는 경우
⑥ 타인의 서비스 ID 및 비밀번호를 도용한 경우
⑦ 서비스 운영을 고의로 방해한 경우
⑧ 서비스의 안정적 운영을 방해할 목적으로 다량의 정보를 전송하거나 광고성 정보를 전송하는 경우(게시판에 돈 버는 사이트 중복 게시 등)
⑨ 정보통신설비의 오 작동이나 정보의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우
⑩ kickoff24.co.kr, 다른 회원 또는 제 3자의 지적재산권을 침해하는 경우
⑪ 정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거운동과 관련하여 선거관리위원회의 유권해석을 받은 경우
⑫ kickoff24.co.kr의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우
⑬ 본 약관을 포함하여 기타 kickoff24.co.kr이 정한 이용 조건에 위반한 경우

제 11조 가입회원의 탈퇴 
kickoff24.co.kr에 가입한 회원은 다음과 같은 절차에 의하여 회원탈퇴할 수 있습니다.
1. 대상은 kickoff24.co.kr 사이트에 가입한 회원으로서 온라인 또는 관리자에게 회원탈퇴를 요청할 수 있습니다. 
2. 회원탈퇴 절차
① 메인화면의 [고객센타] 메뉴선택 
② [고객센타]=&gt; 가이드정보 &gt; 고객센타 &gt;회원탈퇴(가입시) 선택 
(단, 로그인을 하셔야 [회원탈퇴] 선택시 해당 화면으로 이동 됩니다.
③ 회원탈퇴를 위한 회원정보 확인사항을 확인한 후 탈퇴신청을 하게됩니다 
④ 회원탈퇴는 신청과 동시에 즉시 이루어 집니다. 
⑤ 회원탈퇴 후 1주일간은 회원가입을 할 수 없습니다 
⑥ 회원탈퇴시 회원정보는 즉시 파기 됩니다. 
(단, 상품주문정보가 존재시에는 회원상담을 한 후에 회원정보를 삭제하게 됩니다 (상담: 민경두 02-1234-5678) 

제12조 면책조항 
1. kickoff24.co.kr은 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다. 
2. kickoff24.co.kr은 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다. 
3. kickoff24.co.kr은 회원이 서비스를 이용하여 기대하는 수익을 상실한 것에 대하여 책임을 지지 않으며 그밖에 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다. 
4. kickoff24.co.kr은 이벤트 주최사의 사정으로 인한 서비스의 중단이나 변경 등 kickoff24.co.kr과 관련이 없는 부분에 대해서는 책임을 지지 않습니다. 

제13조 기타사항 
이 약관에 명시되지 아니한 사항에 대해서는 관계법령 또는 상관례에 따릅니다. 
부 칙 

1.본 약관은 2015년 11월 1일부터 시행합니다. 
2.본 약관은 시행일 이전에 적용한 약관은 본 약관 시행일로부터 효력을 상실합니다.
</textarea>
                              </p>
                           </td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td colspan="5" class="usual_black"><font color="blue">KICK OFF에
                                 회원에 가입하시려면 약관에 동의하셔야 합니다. 위의 약관에 동의하십니까?</font></td>
                        </tr>
        				<br>
                        <br>
                        <tr bgcolor="#FFFFFF">
                           <td colspan="5"><span class="usual_black"> <input
                                name="chkConfirm" type="radio" tabindex='34' value="Y">
                                 동의함
                           </span> <span class="usual_black"> <input type="radio"
                                 name="chkConfirm" value="N" tabindex='34' checked> 동의 안함
                           </span></td>
                        </tr>
                        <br><br><br>
                        <tr bgcolor="#FFFFFF">
                           <td height="25" colspan="5">&nbsp;</td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td height="32" colspan="5">&nbsp;▶&nbsp;개인정보 취급방침</td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td height="141" colspan="5">
                              <p>
                                 <textarea name="formtextarea1" rows="16" cols="84">[ 개인정보수집 이용에 따른 방침 ]
                                     
 하나로스포츠&quot;는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, &quot;정보통신망 이용촉진 및 정보보호&quot;에 관한 법률을 준수하고 있습니다.
 회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.

회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.

 ο 본 방침은  : 2015년  11월  01일 부터 시행됩니다.


■ 수집하는 개인정보 항목

회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

 ο 수집항목 :  로그인ID , 비밀번호 , E-mail, 성명,  생년월일, 우편번호, 주소, 연락처, E-mail 수신동의, 쿠키 , 결제기록

 ο 개인정보 수집방법 : 홈페이지(회원가입) 


■ 개인정보의 수집 및 이용목적

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

 ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스
 
 ο 회원 관리
회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 불만처리 등 민원처리 , 고지사항 전달

 ο 마케팅 및 광고에 활용
이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계


■ 개인정보의 보유 및 이용기간

원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.

 - 보존 항목 : 결제기록
 - 보존 근거 : 계약 또는 청약철회 등에 관한 기록 
 - 보존 기간 : 3년

 - 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
 - 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래등에서의 소비자보호에 관한 법률)
 - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래등에서의 소비자보호에 관한 법률)

 
</textarea>
                              </p>
                           </td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td colspan="5" height="32">&nbsp;&nbsp;<font color="blue">회원에
                                 가입하시려면 개인정보 취급방침에 동의하셔야 합니다. </font></td>
                        </tr>
                        <tr>
                           <td></td>
                        </tr>
                        <tr bgcolor="#FFFFFF">
                           <td colspan="5" height="15">
                              <p>
                                 <span class="usual_black"> &nbsp;<input
                                    name="chk1Confirm" type="radio" tabindex='34' value="Y">
                                    동의함
                                 </span> <span class="usual_black"><input type="radio"
                                    name="chk1Confirm" value="N" tabindex='34' checked> 동의 안함 </span>
                              </p>
                           </td>
                        </tr>
                        <tr bgcolor="#FFFFFF" align="center">
                           <td colspan="5">
                              
                           </td>
                        </tr>
                        <br>
                        <br>
                        <input type = "image" src = "img/agree.png">
   </div>
   </form>
    <!-- contents -->
  <tr>
 		<td width = "150" height = "150" colspan="2">
			<jsp:include page="main/bottom.jsp" />
		</td>
</tr><!-- footer end -->
</div> <!-- wrap end -->
</body>
</html>