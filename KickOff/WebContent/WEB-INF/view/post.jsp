<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소검색</title>
</head>

<script>
   //main페이지로 값 전달: 부모로 값전달하기 위해서는 opener사용
   function sendAdd(ZIPCODE, ADDR){
      opener.document.getElementById("addr1").value=ZIPCODE;
      opener.document.getElementById("addr2").value =ADDR;
      window.close();
   }
   //널값체크
   function check() {
      if(checkValue == ""){
         alert("동이름을 입력하세요.");
         document.f.address.focus();
         return false;
      }
   }
</script>

<body>
   <form name="f" method="post" onsubmit="check()">
      <table border="1" width="100%">
         <tr align="center">
            <td>동이름 검색 : <input type="text" name="address" size="15">
               <input type="submit" value="검색">
            </td>
         </tr>
         <tr>
            <!-- 안내문 -->
            <td align=center><font color=red>※ 동이름을 입력하시고 검색 후, 아래
                  부분의<br> 우편번호를 클릭하시면 자동으로 주소가 입력됩니다.
            </font></td>
         </tr>
         <c:forEach items="${result}" var="post">
            <tr>
               <td>
               <a href="javascript:sendAdd(
                     '${post.zipcode}', '${post.sido} ${post.gugun} ${post.dong} ${post.bunji}')"> 
                  
                     ${post.zipcode} ${post.sido} ${post.gugun} ${post.dong} ${post.bunji}
                  </a></td>
            </tr>
         </c:forEach>
      </table>
   </form>
</body>
</html>