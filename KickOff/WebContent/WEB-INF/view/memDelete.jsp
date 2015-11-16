<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function() {
		//아이디 중복검사 
		$("#deletemem").click(function() {
			var checkpass = "id=" + $("#id").val()+"&password="+$("#password").val();
			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return ;
			} else if ($("#password2").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password2").focus();
				return false;
			} else if($("#password").val() != $("#password2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#password").val("");
				$("#password2").val("");
				$("#password").focus();
				return ;
			}	
			else {
				$.ajax({
					type : "post",
					url : "memderDelete",
					data : checkpass,
					success : function(data) {
						if ($.trim(data) == "") {
							alert("비밀번호가 틀렸습니다.");
							$("#password").val("");
							$("#password2").val("");
							$("#password").focus();
							return false;
						}else{
							alert("회원 탈퇴 처리 되었습니다.");
							 location.href="/KickOff/";
						}
					}
				});
			}
		});
	});
</script>
</head>
<body class="kortext">
<c:if test="${sessionScope.userLoginInfo.id == null}">
      <c:choose><c:when test="${sessionScope.comLoginInfo.id == null}">
         <script type="text/javascript">
         location.href='loginForm';
         </script>
         </c:when>
   </c:choose>
   </c:if>
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
            
         </c:choose>
      </div>
       <a href="/KickOff/"><img src="img/mlogo.png" width="360px" height="160px"></a>
     </div> <!-- header end -->
   <jsp:include page="main/menubar.jsp" />
	<div class="contents" align="center">
<TABLE width=100% cellpadding=0 cellspacing=0 border=0>
<tr>
   <td><input type="image" src="img/memberleave.png"></td>
</tr>
<TR>
   <td class="path"></td>
</TR>
</TABLE>
<!-- Start indiv -->
<form id="deletemember" method="post" action="memderDelete">
<div style="border:1px solid #DEDEDE;" class="leavetext">
<table width=100% cellpadding=0 cellspacing=0 border=0>
<tr>
   <td style="border:5px solid #F3F3F3;">
   <table width="100%" border="0" cellspacing="0" cellpadding="13">
   <tr>
      
      <td>
        <b>회원탈퇴시 주의사항</b>
<br><br>- 주문이 진행중인 상품이 있는지 확인하시기 바랍니다. (탈퇴시 확인불가)
<br><br>- 거래내역과 회원등급은  삭제되며, 재가입 후에도 복원되지 않습니다.
<br><br />
<b><br>개인정보의 보존기간 및 파기절차</b>
<br><br>- 탈퇴한 회원의 ID는 영구 보존되며, 신규회원의 가입 or 탈퇴회원의 재가입 시에도 영구적으로 사용하실 수 없습니다.
<br><br>- 회원가입시 입력하신 개인정보는 개인정보 취급방침 절차에 따라 다음과 같이 일정기간 보존 후, 파기 됩니다.
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;이용약관 동의 및 회원가입을 통한 개인정보 기록 : 1년
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;상품 대금결제 및 공급에 관한 기록 : 1년
<br />

      </td>
   </tr>
   </table>
   </td>
</tr>
</table>
</div>

<div style="height:10; font-size:0"></div>
<div style="border:1px solid #DEDEDE;" >
<table width=100% cellpadding=0 cellspacing=0 border=0>
<tr>
   <td style="border:5px solid #F3F3F3;">
   <table width="100%" border="0" cellspacing="0" cellpadding="13" align="center">
   <tr>      
      <td align="center">     
      <div style="clear:both;margin-top:10px; font-family: daum;"><h3><strong>회원탈퇴 사유</strong></h3></div>
      <br>
      <div style="padding-right:10px;">
      <div>
        <table width="382" height="90px" border="0">
          <tr>
            <td height="20px" align="left" scope="col" style="height: 10px; font-family: daum; "><input type="checkbox" name="outComplain[]" value="01">&nbsp;서비스</td>
            <td align="left" scope="col" style="font-family: daum;"><input type="checkbox" name="outComplain[]" value="02">&nbsp;배송</td>
          </tr>
          <tr>
            <td style="height: 10px; font-family: daum; "><input type="checkbox" name="outComplain[]" value="03">&nbsp;교환/환불/반품</td>
            <td style="font-family: daum;"><input type="checkbox" name="outComplain[]" value="04">&nbsp;방문 빈도가 낮음</td>
          </tr>
          <tr>
            <td style="height: 10px; font-family: daum; "><input type="checkbox" name="outComplain[]" value="05">&nbsp;상품가격 </td>
            <td style="font-family: daum;"><input type="checkbox" name="outComplain[]" value="06">&nbsp;개인 정보유출 우려</td>
          </tr>
          <tr>
            <td style="height: 10px; font-family: daum; "><input type="checkbox" name="outComplain[]" value="07">&nbsp;쇼핑몰의 신뢰도 불만</td>
            <td style="font-family: daum;"><input type="checkbox" name="outComplain[]" value="08">&nbsp;쇼핑 기능 불만</td>
          </tr>
        </table>
      </div>
      </div>
      <br>
      <br>
      <br>

      <div style="clear:both;margin-top:10px; font-family: daum;"><h3><strong>전하실 말씀</strong></h3>
      <br>
      </div>
      <div><textarea name="outComplain_text" cols="70" rows="8"></textarea></div>
      </td>
   </tr>
   </table>
   <table width="945" height="69" border="0">
     <tr>
       <td align="center"><img src="img/leaveagree.png"></td>
     </tr>
     <tr>
       <td align="center"><input type="hidden" name="id" id="id" value="${sessionScope.userLoginInfo.id}"><table width="400" border="0">
         <tr>
           <td align="right"> 비밀번호</td>
           <td align="center"><input type="password" name="password" id="password"></td>
         </tr>
         <tr>
           <td align="right">비밀번호 확인</td>
           <td align="center"><input type="password" name="password2" id="password2"></td>
         </tr>
         
       </table></td>
     </tr>
   </table>
   <br>
	<br> 
   <table cellpadding="0" cellspacing="0" border="0"align="center">
<tr>
    <td><input type="checkbox" id="check1" name="check1" value="1"></td>
    <td width="5"></td>
    <td><label for="check1">회원탈퇴와 관련한 내용을 모두 확인하였으며 이에 동의 합니다.</label></td>
</tr>
</table><br><br>
   </td>
</tr>
</table>
</div>


<br>
<div style="width:100%; text-align:center; padding-top:10; padding-bottom:20" class=noline>
<img src="img/leave.png" border=0 id="deletemem">&nbsp;
<a href="javascript:history.back();" onFocus="this.blur();"><img src="img/back.png" border="0" alt="취소"></a></div>
<input type = "hidden" name = "id" value = "${sessionScope.userLoginInfo.id}">
</form>

</div>
   <div class="footer" align="center">
        <img src="img/copyright.png" width="960px" height="150px"> 
     </div> <!-- footer end -->
</div><!-- wrap end -->
</body>
</html>