var numtext = /^[0-9]*$/;	//숫자
var chkid = false; 
$(document).ready(function() { 
    $("#register").click(function() {
    	
    	if(document.register.password.value==""){
		alert("비밀번호를 입력하세요");
		document.register.password.focus();
		return false;
	}else if(document.register.password.value.length<7 || document.register.password.value.length>12){
		alert("비밀번호를 7~12자 이내로 입력해주세요.");
		document.register.password.value="";
		document.register.password.focus();
		return false;
	}else if(document.register.password2.value==""){
		alert("비밀번호확인을 입력하세요");
		document.register.password2.focus();
		return false;
	}else if(document.register.password2.value.length<7 || document.register.password2.value.length>12){
		alert("비밀번호를 7~12자 이내로 입력해주세요.");
		document.register.password2.value="";
		document.register.password2.focus();
		return false;
	}else if (document.register.password.value != document.register.password2.value){//비밀번호와 비밀번호 확인 일치여부 체크
	  alert("비밀번호가 일치하지 않습니다")
	  document.register.password.value=""
	  document.register.password2.value=""
	  document.register.password.focus();
	  return false;
	 
    }  
	alert("비밀번호 변경에 성공하였습니다.");
	document.register.submit();
	return true;
});
});
