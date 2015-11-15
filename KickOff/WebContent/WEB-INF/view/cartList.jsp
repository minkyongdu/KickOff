<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<link href="css/show.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="css/menu.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<script type="text/javascript">
   $(document).ready(function() {
      $('#order').click(function() {
         var checkboxs = $('.checkbox');

         var notChk = "";
         var cnt = 0;
         for (var i = 0; i < checkboxs.length; i++) {
            if (!checkboxs[i].checked) {
               notChk += i + ",";
            } else {
               cnt++;//체크된 개수 구하기 
            }
         }//for
         if (cnt == 0) {
            alert("물품을 선택해 주세요");
            location.href = 'cartinsert';//모두체크X
         } else if (cnt < checkboxs.length)
            location.href = 'cartCheck?notChk=' + notChk; //전체 미만

         else if (cnt == checkboxs.length)
            location.href = 'cartAllCheck';//모두체크

      });
   });
   var sell_price;
   var amount;
   function tests()
   {
	   var obj = document.getElementsByName("buyamount");
	   for(var i = 0; i < obj.length; i++)
		   {
		   		if(obj[i].value != null)
		   			{
		   				alert(obj[i].value);
		   			}
		   }
   }
   function init() {
      sell_price = document.articleOrderForm.sell_price.value;
      amount = document.articleOrderForm.buyamount.value;
      document.articleOrderForm.price.value = sell_price;
      change();
   }
   function add() {
      hm = document.articleOrderForm.buyamount;
      sum = document.articleOrderForm.price;
      pax = document.articleOrderForm.pax.value;
      hm.value++;
      sum.value = parseInt(hm.value) * sell_price;
      /* sum.value = parseInt(hm.value) * sell_price + parseInt(pax); */
   }
   function del() {
      hm = document.articleOrderForm.buyamount;
      sum = document.articleOrderForm.price;
      pax = document.articleOrderForm.pax.value;
      if (hm.value > 1) {
         hm.value--;
         sum.value = parseInt(hm.value) * sell_price;
         /* sum.value = parseInt(hm.value) * sell_price + parseInt(pax); */
      }
   }
   function change() {
      hm = document.articleOrderForm.buyamount;
      sum = document.articleOrderForm.price;
      pax = document.articleOrderForm.pax.value;
      if (hm.value < 0) {
         hm.value = 0;
      }
      sum.value = parseInt(hm.value) * sell_price + parseInt(pax);
   }

   function test() {
      win_post = window.open('/KickOff/post', "post",
            "toolbar=no ,width=370 ,height=300 ,directories=no,"
                  + "status=yes,scrollbars=yes,menubar=no");
   }

   $(document).ready(
         function() {
            $("input[type='radio'][id='addr']").click(
                  function() {
                     $("input[type='text'][id='addr1']").val(
                           "${sessionScope.userLoginInfo.addr1}");
                     $("input[type='text'][id='addr2']").val(
                           "${sessionScope.userLoginInfo.addr2}");
                     $("img[id='post']").hide();
                  })
            $("input[type='radio'][id='newaddr']").click(
                  function() { 
                     $("input[type='text'][id='addr1']").val("");
                     $("input[type='text'][id='addr2']").val("").attr(
                           "readonly", false);
                     $("img[id='post']").show();
                  })
         })
</script> 
<body onload="tests();">
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
         <a href="/KickOff/"><img src="img/mlogo.png" width="360px"
            height="160px"></a>
      </div>
      <center>
         <jsp:include page="main/menubar.jsp" />
      </center>
   <!-- header end -->
   <div class="contents" align="center">
      <img src="img/cartlist.png" width="940px" height="100px">
      <div class="indiv">
         <form name=frmCart method=post>
            <input type=hidden name=mode value=modItem> <br>
            <table cellpadding="0" cellspacing="0" border="1">
               <col width=30>
               <col width=60>
               <col>
               <col width=60>
               <col width=80>
               <col width=50>
               <col width=80>
               <thead align="center">
                  <tr>
                     <td style="width: 20px;"></td>
                     <td colspan=2 style="width: 200px;">이미지</td>
                     <td style="width: 300px;">상품명</td>
                     <td style="width: 100px;">주문수량</td>
                     <td style="width: 100px;">가격</td>
                     <td style="width: 100px;">사이즈</td>
                     <td style="width: 100px;">비고</td>
                  </tr>
                 <c:forEach var="list" items="${list}" varStatus="status">
                  <form method="post" action="cartSelectDelete">
                     <tr>
                        <td style="width: 20px;"><a href=""><label> <input
                                 type="checkbox" class="checkbox" value="${status.index}">
                           </label></a></td>
                        <td colspan=2 style="width: 100px;"><img
                           src="/KickOff/img/${list.imgFile1}" width="100" height="100">
                        </td>
                        <td style="width: 300px;">${list.aname}<input type="hidden"
                           name="num" value="${list.articleNum}" id="num">
                        </td>
                        <td style="width: 100px;"><input type="text"
                           name="buyamount" value="${list.amount}" size="1"
                           onchange="change();">개 <br><input type="button" value=" + " 
                           onclick="tests();"><input type="button" value=" - "
                           onclick="del();"><br></td>
                        <td style="width: 50px;"><input type = "text" value = "${list.price}" size = "3">원
                        <br> + 배송비 : <input
                           type="text" name="pax" value="2500" size="2" readonly>원
                        </td>
                        <td style="width: 100px;">${list.asize}</td>
                        <td style="width: 60px;"><input type="hidden"
                           value="${status.index}" name="hiddenNum"> <input
                           type="image" src="img/deletelist.png" width="48px"
                           height="21px"></td>
                     </tr>
                  </form>
                  </c:forEach>
               </thead>
               <tbody>
               </tbody>
               <tfoot>
               </tfoot>
            </table>
            <br> <!-- <a href=""><img src="img/deletechk.png" width="80px"
               height="30px "></a> -->
         </form>
 
         <br> 
         <br>
         <center>
         	<input type = "text" name = "sum">
            <br> <br> <img src="img/sbuybtn.png" id="order">&nbsp;
            <a href=""><img src="img/sback.png"></a> <br> <br> <br>
            <br> <br> <br> <br> <br> <br> <br>
            <br> <br> <br> <br> <br> <br> <br>
            <br> <br> <br> <br> <br> <br> <br>
         </center>
      </div>
   </div>
   </center>
   <center>
      <jsp:include page="main/bottom.jsp" />
   </center>
   </div>
</body>
</html>