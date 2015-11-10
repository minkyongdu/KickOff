var regId = /^[A-Za-z]{1}[A-Za-z0-9]{6,11}$/; //아이디 정규식
var idtext = /^[A-Za-z0-9]/; //아이디
var nametext = /^[가-힣]*$/;	//이름
var exptext = /^[A-Za-z0-9]/; //이메일 
var regexp = /d{3,4}$/;
var numtext = /^[0-9]*$/; // 사업자등록번호
var chkid = false; 

$(document).ready(function() { 
	    //아이디 중복검사 
	    $("#idCheck").click(function() { 
	       var comcheckId = "id=" + $("#id").val(); 
	       if ($("#id").val() == "") { 
	         alert("아이디를 입력해주세요."); 
	          $("#id").focus(); 
	       } else if(!regId.test($("#id").val())) { 
	          alert("아이디는 7자~12자 사이의 영문과 숫자로만 가능하며 첫 글자는 반드시 문자여야 합니다."); 
	          $("#id").val(""); 
	          $("#id").focus(); 
	       } else { $.ajax({ 
	             type : "GET",  	
	             url : "comIDCheck", 
	             data : comcheckId, 
	             success : function(data) { 
	            	 if($.trim(data) != "") { 
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
	if(document.comRegister.id.value==""){ //id값이 없을 경우
		alert("아이디를 입력하세요");         //메세지 경고창을 띄운 후
		document.comRegister.id.focus();     // id 텍스트박스에 커서를 위치
		return false;
	}else if(idtext.test(document.comRegister.id.value)==false){ //id값이 없을 경우
		alert("아이디는 영어, 숫자로만 입력해 주세요.");         //메세지 경고창을 띄운 후
		document.comRegister.id.value="";
		document.comRegister.id.focus();     // id 텍스트박스에 커서를 위치
		return false;
	}else if(regId.test(document.comRegister.id.value)==false){
		alert("아이디는 7자~12자 사이의 영문과 숫자로만 가능하며 첫 글자는 반드시 문자여야 합니다.");
		document.comRegister.id.value="";
		document.comRegister.id.focus();   
		return false;
	}else if(document.comRegister.password.value==""){
		alert("비밀번호를 입력하세요");
		document.comRegister.password.focus();
		return false;
	}else if(document.comRegister.password.value.length<7 || document.comRegister.password.value.length>12){
		alert("비밀번호를 7~12자 이내로 입력해주세요.");
		document.comRegister.password.value="";
		document.comRegister.password.focus();
		return false;
	}else if(document.comRegister.password2.value==""){
		alert("비밀번호 확인을 입력하세요");
		document.comRegister.password2.focus();
		return false;
	}else if(document.comRegister.password2.value.length<7 || document.comRegister.password2.value.length>12){
		alert("비밀번호를 7~12자 이내로 입력해주세요.");
		document.comRegister.password2.value="";
		document.comRegister.password2.focus();
		return false;
	}else if (document.comRegister.password.value!= document.comRegister.password2.value)
	 {//비밀번호와 비밀번호 확인 일치여부 체크
	  alert("비밀번호가 일치하지 않습니다")
	  document.comRegister.password.value=""
	  document.comRegister.password2.value=""
	  document.comRegister.password.focus()
	  return false;
	 }else if(document.comRegister.comemail1.value==""){
			alert("이메일을 입력하세요");
			document.comRegister.comemail1.focus();
			return false;
		}else if(exptext.test(document.comRegister.comemail1.value)==false){
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
			alert("이메일형식이 올바르지 않습니다.");
			document.comRegister.comemail1.value="";
			document.comRegister.comemail1.focus();
			return false;
		}else if(document.comRegister.comname.value==""){
			alert("기업명을 입력하세요");
			document.comRegister.comname.focus();
			return false;
		}else if(document.comRegister.comceo.value==""){
			alert("대표자 이름을 입력하세요");
			document.comRegister.comceo.focus();
			return false;
	}else if(nametext.test(document.comRegister.comceo.value)==false){
			alert("한글만 입력해주세요.");
			document.comRegister.comceo.value="";
			document.comRegister.comceo.focus();
			return false;
	}else if(document.comRegister.combusinnum1.value==""){
		alert("사업자 등록번호를 입력해주세요.");
		document.comRegister.combusinnum1.focus();
		return false;
	}else if(numtext.test(document.comRegister.combusinnum1.value)==false){
		alert("숫자만 입력해 주세요.");
		document.comRegister.combusinnum1.value="";
		document.comRegister.combusinnum1.focus();
		return false;
	}else if(document.comRegister.combusinnum2.value==""){
		alert("사업자 등록번호를 입력해주세요.");
		document.comRegister.combusinnum2.focus();
		return false;
	}else if(numtext.test(document.comRegister.combusinnum2.value)==false){
		alert("숫자만 입력해 주세요.");
		document.comRegister.combusinnum2.value="";
		document.comRegister.combusinnum2.focus();
		return false;
	}else if(document.comRegister.combusinnum3.value==""){
		alert("사업자 등록번호를 입력해주세요.");
		document.comRegister.combusinnum3.focus();
		return false;
	}else if(numtext.test(document.comRegister.combusinnum3.value)==false){
		alert("숫자만 입력해 주세요.");
		document.comRegister.combusinnum3.value="";
		document.comRegister.combusinnum3.focus();
		return false;
	}else if(document.comRegister.addr1.value==""){
		alert("주소를 입력하세요");
		document.comRegister.addr1.focus();
		return false;
	}else if(document.comRegister.comphonenum1.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comRegister.comphonenum1.focus();
		return false;
	}else if(numtext.test(document.comRegister.comphonenum1.value)==false){
		alert("숫자만 입력해 주세요.");
		document.comRegister.comphonenum1.value="";
		document.comRegister.comphonenum1.focus();
		return false;
	}else if(document.comRegister.comphonenum2.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comRegister.comphonenum2.focus();
		return false;
	}else if(numtext.test(document.comRegister.comphonenum2.value)==false){
		alert("숫자만 입력해 주세요.");
		document.comRegister.comphonenum2.value="";
		document.comRegister.comphonenum2.focus();
		return false;
	}else if(document.comRegister.comphonenum3.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comRegister.comphonenum3.focus();
		return false;
	}else if(numtext.test(document.comRegister.comphonenum3.value)==false){
		alert("숫자만 입력해 주세요.");
		document.comRegister.comphonenum3.value="";
		document.comRegister.comphonenum3.focus();
		return false;
	}else if(!chkid){ 
        alert("아이디 중복확인을 해 주세요."); 
        return false;
    }  
	alert("회원가입에 성공하였습니다. 로그인을 해주세요.");
	document.comRegister.submit();
	 return true;
});
});
