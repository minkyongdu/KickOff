// 유효성 검사
function checkfield(){
	var idtext = /^[A-Za-z0-9]/; //아이디
	var nametext = /^[가-힣]*$/;	//이름
	var exptext = /^[A-Za-z0-9]/; //이메일 
	var regexp = /d{3,4}$/;
	
	if(document.upregister.password.value==""){
		alert("비밀번호를 입력하세요");
		document.upregister.password.focus();
		return false;
	}else if(document.upregister.password2.value==""){
		alert("비밀번호 확인을 입력하세요");
		document.upregister.password2.focus();
		return false;
	}else if (document.upregister.password.value != document.upregister.password2.value)
	 {//비밀번호와 비밀번호 확인 일치여부 체크
	  alert("비밀번호가 일치하지 않습니다")
	  document.upregister.password.value=""
	  document.upregister.password2.value=""
	  document.upregister.password.focus()
	  return false;
	}else if(document.upregister.addr1.value==""){
		alert("주소를 입력하세요");
		document.upregister.addr1.focus();
		return false;
	}else if (document.upregister.addr2.value==""){
		alert("주소를 입력하세요");
		document.upregister.addr2.focus();
		return false;
	}else if(document.upregister.phonenum1.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.upregister.phonenum1.focus();
		return false;
	}
	else if(document.upregister.phonenum2.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.upregister.phonenum2.focus();
		return false;
	}else if(document.upregister.phonenum3.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.upregister.phonenum3.focus();
		return false;
	}else if(document.upregister.email1.value==""){
		alert("이메일을 입력하세요");
		document.upregister.email1.focus();
		return false;
	}else if(exptext.test(document.upregister.email1.value)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		alert("이메일형식이 올바르지 않습니다.");
		document.upregister.email1.focus();
		return false;
	}else if(document.upregister.pwdQ.value=="선택"){
		alert("비밀번호찾기 질문을 선택해주세요.");
		document.upregister.pwdQ.focus();
		return false;
	}else if(document.upregister.pwdA.value==""){
		alert("비밀번호찾기 답변을 입력해주세요.");
		document.upregister.pwdA.focus();
		return false;
	}
	else{
		document.upregister.submit();
		alert("회원정보 수정을 완료하였습니다. 다시 로그인 해주세요.");
		return true;
	}
}
function comcheckfield(){
	var idtext = /^[A-Za-z0-9]/; //아이디
	var nametext = /^[가-힣]*$/;	//이름
	var numtext = /^[0-9]*$/;	//이름
	var exptext = /^[A-Za-z0-9]/; //이메일 
	var regexp = /d{3,4}$/;
	
	if(document.comupregister.password.value==""){
		alert("비밀번호를 입력하세요");
		document.comupregister.password.focus();
		return false;
	}else if(document.comupregister.password2.value==""){
		alert("비밀번호 확인을 입력하세요");
		document.comupregister.password2.focus();
		return false;
	}else if (document.comupregister.password.value != document.comupregister.password2.value)
	 {//비밀번호와 비밀번호 확인 일치여부 체크
	  alert("비밀번호가 일치하지 않습니다")
	  document.comupregister.password.value=""
	  document.comupregister.password2.value=""
	  document.comupregister.password.focus()
	  return false;
	}else if(document.comupregister.email1.value==""){
		alert("이메일을 입력하세요");
		document.comupregister.email1.focus();
		return false;
	}else if(exptext.test(document.comupregister.comemail1.value)==false){
		//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우
		alert("이메일형식이 올바르지 않습니다.");
		document.comupregister.comemail1.focus();
		return false;
	}else if(document.comupregister.addr1.value==""){
		alert("주소를 입력하세요");
		document.comupregister.addr1.focus();
		return false;
	}else if (document.comupregister.addr2.value==""){
		alert("주소를 입력하세요");
		document.comupregister.addr2.focus();
		return false;
	}else if(document.comupregister.comphonenum1.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comupregister.comphonenum1.focus();
		return false;
	}else if(numtext.test(document.comupregister.comphonenum1.value)==false){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comupregister.comphonenum1.focus();
		return false;
	}
	else if(document.comupregister.comphonenum2.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comupregister.comphonenum2.focus();
		return false;
	}else if(numtext.test(document.comupregister.comphonenum2.value)==false){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comupregister.comphonenum2.focus();
		return false;
	}else if(document.comupregister.comphonenum3.value==""){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comupregister.comphonenum3.focus();
		return false;
	}else if(numtext.test(document.comupregister.comphonenum3.value)==false){
		alert("전화번호를 올바르게 입력해주세요.");
		document.comupregister.comphonenum3.focus();
		return false;
	}
	else{
		document.comupregister.submit();
		alert("회원정보 수정을 완료하였습니다.");
		return true;
	}
}