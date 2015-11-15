<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  $('#order').click(function(){		  
		  var checkboxs = $('.checkbox');

		  var notChk="";
          var cnt=0;
		  for(var i=0; i<checkboxs.length; i++){			 
			 if(!checkboxs[i].checked){			
				   notChk+=i+",";			       
			 }else{
				cnt++;//체크된 개수 구하기 
			 }
		  }//for
		   if(cnt==0){
			   alert("물품을 선택해 주세요");
			   location.href='cartinsert';//모두체크X
		   }
		   else if(cnt<checkboxs.length)
		        location.href='cartCheck?notChk='+notChk; //전체 미만
		   
		   else if(cnt==checkboxs.length)     
				location.href='cartAllCheck';//모두체크
			 			 
	  });
  });
  var sell_price;
  var amount;
  function init () {
      sell_price = document.articleOrderForm.sell_price.value;
      amount = document.articleOrderForm.buyamount.value;
      document.articleOrderForm.price.value = sell_price;
      change();
  }
  function add () {
      hm = document.articleOrderForm.buyamount;
      sum = document.articleOrderForm.price;
      pax = document.articleOrderForm.pax.value;
      hm.value ++ ;
      sum.value = parseInt(hm.value) * sell_price + parseInt(pax);
  }
  function del () {
      hm = document.articleOrderForm.buyamount;
      sum = document.articleOrderForm.price;
      pax = document.articleOrderForm.pax.value;
          if (hm.value > 1) {
              hm.value -- ;
              sum.value = parseInt(hm.value) * sell_price + parseInt(pax);
          }
  }
  function change () {
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
</head>
<body>

   <c:if test="${sessionScope.userLoginInfo.name==null}">
	
<c:redirect url="/loginForm"/>
</c:if>   
<!-- <form name="cartForm" method="post" action="ArticleOrder" > -->


	<td align="center">
		<table width="95%" align="center" border="1" id="table">
		<tr>
		<td align="center"><font></font></td>
		<td align="center"><font>메인이미지</font></td>
		<td align="center"><font>제품이름</font></td>
		<td align="center"><font>주문수량</font></td>
		<td align="center"><font>가격</font></td>
		<td align="center"><font>사이즈</font></td>
		<td align="center"><font>삭제</font></td>
		
		</tr>
 
		<c:forEach var="list" items="${list}" varStatus="status" >
		<form method = "post" action ="cartSelectDelete" name="">
		
		<tr>
		<td><center><input type="checkbox" class="checkbox" value="${status.index}"></center></td>
		<td align="center" >
		<img src ="/KickOff/img/${list.imgFile1}" width = "100" height = "100"></td>
		<td align="center">${list.aname} 
		<input type="hidden" name = "num" value="${list.articleNum }" id="num">
		</td> <!-- 상세보기 버튼 -->
		<td align="center"><input type="text" name="buyamount" value="${list.amount}" size="1" onchange="change();" >개 
					<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br></td>
		<td align="center">${list.price}원
					<br>
					+ 배송비 : <input type="text" name="pax" value="2500" size="2" readonly>원</td>
		<td> 
				   ${list.asize}
				   </td>
		<td align="center">
		<input type = "hidden" value = "${status.index}" name="hiddenNum">
			
		<input type="submit" value="삭제"  size="3" onclick=""></td>
		</tr>
	
	   </form>
	   </c:forEach>
		<tr>
		<td colspan="5" align="right"><input type="text" name="result" value="0" readonly> 총 금액 :원</td>

		<td>
    <center><button id="order">주문하기</button></center>
		</td>
		</tr>
		</table>
	
  </body>
</html>

