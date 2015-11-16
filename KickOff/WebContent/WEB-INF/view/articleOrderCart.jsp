<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문페이지</title>
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
<link href="css/show.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
var sell_price;
var amount;
var amountprice;
function init () {
    sell_price = document.articleOrderForm.sell_price.value;
    amount = document.articleOrderForm.buyamount.value;
    document.articleOrderForm.price.value = sell_price;
    document.articleOrderForm.prices.value = sell_price;
    change();
} 
function add () {
    hm = document.articleOrderForm.buyamount;
    sum = document.articleOrderForm.price;
    pax = document.articleOrderForm.pax.value;
    prices = document.articleOrderForm.prices;
    hm.value ++ ;
    prices.value = parseInt(hm.value) * sell_price;
    sum.value = parseInt(hm.value) * sell_price + parseInt(pax);
}
function del () {
    hm = document.articleOrderForm.buyamount;
    sum = document.articleOrderForm.price;
    pax = document.articleOrderForm.pax.value;
    prices = document.articleOrderForm.prices;   
    if (hm.value > 1) {
            hm.value -- ;
            prices.value = parseInt(hm.value) * sell_price;
            sum.value = parseInt(hm.value) * sell_price + parseInt(pax);
        }
}
function change () {
    hm = document.articleOrderForm.buyamount;
    sum = document.articleOrderForm.price;
    pax = document.articleOrderForm.pax.value;
    prices = document.articleOrderForm.prices;
        if (hm.value < 0) {
            hm.value = 0;
        }
        prices.value = parseInt(hm.value) * sell_price;
sum.value = parseInt(hm.value) * sell_price + parseInt(pax);
} 

function test() {
	   win_post = window.open('/KickOff/post', "post",
	         "toolbar=no ,width=370 ,height=300 ,directories=no,"
	               + "status=yes,scrollbars=yes,menubar=no");
	}

$(document).ready(function(){
	$("input[type='radio'][id='addr']").click(function(){
		$("input[type='text'][id='addr1']").val("${sessionScope.userLoginInfo.addr1}");
		$("input[type='text'][id='addr2']").val("${sessionScope.userLoginInfo.addr2}");
		$("img[id='post']").hide();
	})		
	$("input[type='radio'][id='newaddr']").click(function(){
		$("input[type='text'][id='addr1']").val("");
		$("input[type='text'][id='addr2']").val("").attr("readonly",false);
		$("img[id='post']").show();
	})
})

</script>

<link href="css/show.css" rel="stylesheet" type="text/css" />
<body onload="init();" class="kortext">
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
              <c:when test="${(sessionScope.userLoginInfo == null) || (sessionScope.comLoginInfo == null)}">
                 <jsp:include page="main/selectLogin.jsp" /> 
            </c:when>
           </c:choose>
         </div>
         <a href="/KickOff/"><img src="img/mlogo.png" width="360px"
            height="160px"></a>
      </div>
      <center>
         <jsp:include page="main/menubar.jsp" />
      </center>
   <div class="contents" align="center">
      <img src="img/orderdelivery.png">
   <form name="articleOrderForm" method="post" action="articleOrderCart">
      <table cellpadding="0" cellspacing="0" border="0"
         class="orderitem-list">
         <colgroup>
            <col width="60">
            <col>
            <col width="60">
            <col width="80">
            <col width="50">
            <col width="80">
         </colgroup>
         <thead>
            <tr>
               <th width="150" style="width: 150px;">이미지</th>
               <th width="300" style="width: 300px;">제품명</th>
               <th width="100" style="width: 100px;">사이즈</th>
               <th width="150">수량</th>
               <th width="150">판매 단가</th>
            </tr>
         </thead>
         
		<c:forEach var="list" items="${list}" varStatus="status">
      <input type="hidden" name="sell_price" value="${list.price}">
         <tbody>
            <tr>
               <td height="60" align="center" style="width: 150px;"><img
                  src="/KickOff/img/${list.imgFile1}" width="100" height="100">
               </td>

               <td align="center">${list.aname}</td>
               <td align="center"><c:if test="${list.asize != null}">
                                 ${list.asize}
                              </c:if></td>
				<input type="hidden" name="Asize" value="${list.asize}">
               <td align="center" rowspan="1"><input type="text"
                  name="buyamount" value="${list.amount}" size="1" onchange="change();">
                  개 <input type="button" value=" + " onclick="add();"><input
                  type="button" value=" - " onclick="del();"><br></td>
               <td align="center"><fmt:formatNumber value="${list.price}"
                     groupingUsed="true" /> <br></td>
				<input type = "hidden" name = "amountprice" val = "${list.amount*list.price}">

            </tr>
         </tbody>

         <tfoot>
            <tr>
               <td colspan="10"></td>
            </tr>
         </tfoot>
   		 </c:forEach>
      </table>
      <div style="margin-top: 20;">
         <br>
      </div>
      <!-- 배송정보 -->
      <table width="100%" style="border: 1px solid #DEDEDE" cellpadding="0"
         cellspacing="0">
         <tbody>
            <tr>
               <td width="150" valign="middle" align="center" bgcolor="#F3F3F3"><img
                  src="img/inputdelivery.png"></td>
               <td style="padding: 10px">

                  <table>
                     <colgroup>
                        <col width="100">
                     </colgroup>
                     <tbody>
                        <tr>
                           <td>배송지 선택</td>
                           <td class="noline"><input type="radio" name="addr"
                              id="addr" checked="checked"> 기본배송지<input type="radio"
                              name="addr" id="newaddr">새로운 배송지</td>
                        </tr>
                        <tr>
                           <td>받으시는 분</td>
                           <td><input type="text" name="subname"
                              value="${sessionScope.userLoginInfo.name}"></td>
                        </tr>
                        <tr>
                           <td rowspan="3" valign="middle">배송지</td>
                           <td style="width: 575px;"><input type="text"
                              name="subaddr1" id="addr1"
                              value="${sessionScope.userLoginInfo.addr1}" size="7"
                              maxlength="7" readonly> <input type="text"
                              name="subaddr2" id="addr2" size="40" maxlength="100"
                              tabindex='17' value="${sessionScope.userLoginInfo.addr2}"
                              readonly="readonly"> <a href="javascript:test();"><img
                                 src="img/postnum.png" border=0 align=absmiddle id="post"
                                 hidden></a></td>
                        </tr>
                        <tr>
                           <td></td>
                        </tr>
                        <tr>
                           <td></td>
                        </tr>
                        <tr>
                           <td>연락처</td>
                           <td><input type="text" name="subphonenum" size="15"
                              maxlength="3" tabindex='19'
                              value="${sessionScope.userLoginInfo.phonenum}"
                              style='ime-mode: disabled; text-align: center' readonly>
                           </td>
                        </tr>
                        <tr>
                           <td>요청사항</td>
                           <td><textarea name="sendContent"
                                 style="width: 100%; height: 50px;">안전 배송 부탁드립니다.</textarea></td>
                        </tr>
                     </tbody>
                  </table>

               </td>
            </tr>
         </tbody>
      </table>
      <div style="font-size: 0; height: 5px"></div>

      <!-- 03 결제금액 -->
      <table width="100%" style="border: 1px solid #DEDEDE" cellpadding="0"
         cellspacing="0">
         <tbody>
            <tr>
               <td width="150" valign="middle" align="center" bgcolor="#F3F3F3"><img
                  src="img/amount.png"></td>
               <td style="padding: 10px">

                  <table>
                     <colgroup>
                        <col width="90">
                     </colgroup>
                     <tbody> 
                        <tr>
                           <td>상품 합계</td>
                           <td align="right"><p id="paper_goodsprice"
                                 style="width: 146px; text-align: right; font-weight: bold; float: left; margin: 0">
                                 <input type="text" name="prices" size="5" align="top"
                                    readonly="readonly">
                              </p> 원</td>
                        </tr>
                        <tr>
                           <td>배송비</td>
                           <td align="right"><input type="text" name="pax"
                              value="2500" size="5" align="top" readonly>원
                              <div id="paper_delivery_msg2"
                                 style="display: none; width: 160; text-align: right"></div>
                              <div id="paper_delivery_msg_extra" class="small red"
                                 style="display: none;"></div></td>
                        </tr>


                        <tr>
                           <td>총 결제금액</td>
                           <td align="right">
                              <p id="paper_goodsprice"
                                 style="width: 146px; text-align: right; font-weight: bold; float: left; margin: 0">
                                 <input type="text" name="price" size="5" readonly="readonly" value = ""
                                    align="top">
                              </p>원
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </td>
            </tr>
         </tbody>
      </table>
      <div style="font-size: 0; height: 5px"></div>
      <!-- <form>
                     <tr style="width: 946px;"></tr>
                  </form> -->
      <!-- 04 결제수단 -->
      <table width="100%" style="border: 1px solid #DEDEDE" cellpadding="0"
         cellspacing="0">
         <tbody>
            <tr>
               <td width="150" valign="middle" align="center" bgcolor="#F3F3F3"><img
                  src="img/payment.png"></td>
               <td style="padding: 10px"><table>
                     <colgroup>
                        <col width="100%">
                     </colgroup>
                     <tbody>
                        <tr>
                           <td><input type="checkbox" name="mootong" id="mootong"
                              checked="checked"> 무통장입금</td>
                        </tr>
                        <tr>
                           <th>* 입금확인 후부터 배송단계가 진행됩니다</th>
                        </tr>
                     </tbody>
                  </table></td>
            </tr>
         </tbody>
      </table>
      <div style="font-size: 0; height: 5px"></div>

      <div style="padding: 20px" align="center">
         <input type="image" id="order" src="img/orderbtn.png"> &nbsp;
        <a href="javascript:history.back(-1);">
            <img src="img/back.png">
         </a>
      </div>
      <input type="hidden" name="id"
         value="${sessionScope.userLoginInfo.id}"> <%-- <input
         type="hidden" name="Asize" value="${Asize}"> <input
         type="hidden" name="Aname" value="${article.aname}"> <input
         type="hidden" name="articleNum" value="${article.articleNum}">
      <input type="hidden" name="companyNum" value="${article.companyNum}">
      <input type="hidden" name="amount" value="${amount}"> --%>
   </form>
   </div>
   <center>
      <jsp:include page="main/bottom.jsp" />
   </center>
   </div>
</body>
</html>