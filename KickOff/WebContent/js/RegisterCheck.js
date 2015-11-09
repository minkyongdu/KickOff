var idtext = /^[A-Za-z0-9]/; //아이디
var nametext = /^[가-힣]*$/;	//이름
var numtext = /^[0-9]*$/;	//숫자
var exptext = /^[A-Za-z0-9]/; //이메일 
var regexp = /d{3,4}$/;
var chkid = false; 
var regId = /^[A-Za-z]{1}[A-Za-z0-9]{6,11}$/; //아이디 정규식

$(document).ready(function() { 
    //아이디 중복검사 
    $("#idCheck").click(function() { 
       var checkId = "id=" + $("#id").val(); 
       if ($("#id").val() == "") { 
         alert("아이디를 입력해주세요."); 
          $("#id").focus(); 
       } else if(!regId.test($("#id").val())) { 
          alert("아이디는 7자~12자 사이의 영문과 숫자로만 가능하며 첫 글자는 반드시 문자여야 합니다."); 
          $("#id").val(""); 
          $("#id").focus(); 
       } else { 
          $.ajax({ 
             type : "GET",  	
             url : "memIDCheck", 
             data : checkId, 
             success : function(data) { 
            	 if ($.trim(data) != "") { 
                   alert("이미 존재하는 회원입니다."); 
                   $("#id").val(""); 
                   $("#id").focus(); 
                } else { 
                   chkid = true; 
                   alert("사용 가능한 아이디입니다."); 
                  $("#password").focus(); 
                } 
             } 
         }); 
       } 
    });
    $("#register").click(function() { 
    if(document.register.id.value==""){ //id값이 없을 경우
		alert("아이디를 입력하세요");         //메세지 경고창을 띄운 후
		document.register.id.focus();     // id 텍스트박스에 커서를 위치
		return false;
	}else if(document.register.password.value==""){
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
	 }else if(document.register.name.value==""){
		alert("이름을 입력하세요");
		document.register.name.focus();
		
		return false;
	}else if(nametext.test(document.register.name.value)==false){
		alert("한글만 입력해주세요.");
		document.register.name.value="";
		document.register.name.focus();
		return false;
	}else if(document.register.year.value == "none"){
		alert("생년월일을 올바르게 입력해 주세요.");
		document.register.year.focus();
		return false;
	}else if(document.register.month.value == "none"){
		alert("생년월일을 올바르게 입력해 주세요.");
		document.register.month.focus();
		return false;
	}else if(document.register.day.value == "none"){
		alert("생년월일을 올바르게 입력해 주세요.");
		document.register.day.focus();
		return false;
	}else if(document.register.email1.value==""){
		alert("이메일을 입력하세요");
		document.register.email1.focus();
		return false;
	}else if(exptext.test(document.register.email1.value)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		alert("이메일형식이 올바르지 않습니다.");
		document.register.email1.value=""
		document.register.email1.focus();
		return false;
	}else if(document.register.addr1.value==""){
		alert("주소를 입력하세요");
		document.register.addr1.focus();
		return false;
	}else if(document.register.phonenum1.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.register.phonenum1.value="";
		document.register.phonenum1.focus();
		return false;
	}else if(numtext.test(document.register.phonenum1.value)==false){
		alert("연락처에는 숫자만 작성해 주세요.");
		document.register.phonenum1.value="";
		document.register.phonenum1.focus();
		return false;
	}else if(document.register.phonenum2.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.register.phonenum2.value="";
		document.register.phonenum2.focus();
		return false;
	}else if(numtext.test(document.register.phonenum2.value)==false){
		alert("연락처에는 숫자만 작성해 주세요.");
		document.register.phonenum2.value="";
		document.register.phonenum2.focus();
		return false;
	}else if(document.register.phonenum3.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.register.phonenum3.focus();
		return false;
	}else if(numtext.test(document.register.phonenum3.value)==false){
		alert("연락처에는 숫자만 작성해 주세요.");
		document.register.phonenum3.value="";
		document.register.phonenum3.focus();
		return false;
	}else if(document.register.pwdQ.value=="선택"){
		alert("비밀번호 찾기 질문을 선택해주세요.");
		document.register.pwdQ.focus();
		return false;
	}else if(document.register.pwdA.value==""){
		alert("비밀번호 찾기 답안을 입력해주세요.");
		document.register.pwdA.focus();
		return false;
	} else if(!chkid){ 
        alert("아이디 중복확인을 해 주세요."); 
        return false;
    }  
	alert("회원가입에 성공하였습니다. 로그인을 해주세요.");
	document.register.submit();
	return true;
});
});
