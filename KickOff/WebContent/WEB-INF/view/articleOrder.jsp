<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문하기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
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
<body onload="init()";>
<center>
    <h3>주문 테이블</h3>
    <hr>
<form name="articleOrderForm" method="post" action="articleOrder">
	<input type="hidden" name="sell_price" value="${article.price}">
		<table border=1>
			<tr>
				<td>메인이미지</td>
				<td>제품이름</td>
				<td>주문수량</td>
				<td>가격</td>
				<td>사이즈</td>
			</tr>
			<tr>
				<td>
					<img src="/KickOff/img/${article.imgFile1}" width="100" height="100">
				</td>
				<td>${article.aname}</td>
				<td>
					<input type="text" name="buyamount" value="${amount}" size="1" onchange="change();"> 개 
					<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
				</td>
				<td>
					${article.price}원
					<br>
					+ 배송비 : <input type="text" name="pax" value="2500" size="2" readonly>원
				</td>
				<td>
				   <c:if test="${Asize != null}">
				   ${Asize}
				   </c:if>
				</td>
			</tr>
		</table>
		총 금액 : <input type="text" name="price" size="11" readonly>원
		<table border=1>
			<tr>
				<td>배송지 선택</td>
			</tr>
			<tr>
				<td>
	 				<input type="radio" name="addr" id="addr" checked="checked">기본배송지
	 				<input type="radio" name="addr" id="newaddr">새로운배송지
	 				<br>
	 				이름 : <input type="text" name="subname" value="${sessionScope.userLoginInfo.name}">
	 				
	 				<br>
	 				주소 : <input type="text" name="subaddr1" id = "addr1" value = "${sessionScope.userLoginInfo.addr1}" size="7" maxlength="7" readonly>
	 			 		 <input type="text" name="subaddr2" id = "addr2" size="40" maxlength="100" tabindex='17' value = "${sessionScope.userLoginInfo.addr2}" readonly>
	 			 		 <a href = "javascript:test();"><img src="img/postnum.png" border=0 align=absmiddle id="post" hidden></a>
	 			 	<br>			 
	 				연락처 : <input type="text" name="subphonenum"
                              size="15" maxlength="3" tabindex='19' value="${sessionScope.userLoginInfo.phonenum}"
                              style='ime-mode: disabled; text-align:center' readonly>
                    <br>
                                               배송시 요청사항 
                    <br>
                    <input type="text" name="sendContent" size="60" height="50" value = "안전 배송 부탁드립니다.">         
	 			</td>
			</tr>
		</table>
	<input type="submit" value="주문">
	<input type="button" value="취소" onclick="location.href='/KickOff/articleDetail?articleNum=${article.articleNum}'">
	<input type="hidden" name="memberNum" value="${sessionScope.userLoginInfo.memberNum}">
	<input type="hidden" name="Asize" value="${Asize}">
	<input type="hidden" name="Aname" value="${article.aname}">
	<input type="hidden" name="articleNum" value="${article.articleNum}">
	<input type="hidden" name="companyNum" value="${article.companyNum}">
</form>
</center>
</body>
</html>