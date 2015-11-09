function productRF(){
	
	var number = /^[0-9]*$/; // 사업자등록번호
	
	if(document.productForm.amount0.value==""){
		alert("1번째 사이즈 개수를 입력해주세요.");        
		document.productForm.amount0.focus();     
		return false;
	}else if(number.test(document.productForm.amount0.value)==false){
		alert("1번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount0.focus();     
		return false;
	}else if(document.productForm.amount1.value==""){ 
		alert("2번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount1.focus();   
		return false;
	}else if(number.test(document.productForm.amount1.value)==false){ 
		alert("2번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount1.focus();  
		return false;
	}else if(document.productForm.amount2.value==""){ 
		alert("3번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount2.focus();   
		return false;
	}else if(number.test(document.productForm.amount2.value)==false){ 
		alert("3번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount2.focus();  
		return false;
	}else if(document.productForm.amount3.value==""){ 
		alert("4번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount3.focus();   
		return false;
	}else if(number.test(document.productForm.amount3.value)==false){ 
		alert("4번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount3.focus();  
		return false;
	}else if(document.productForm.amount4.value==""){ 
		alert("5번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount4.focus();   
		return false;
	}else if(number.test(document.productForm.amount4.value)==false){ 
		alert("5번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount4.focus();  
		return false;
	}else if(document.productForm.amount5.value==""){ 
		alert("6번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount5.focus();   
		return false;
	}else if(number.test(document.productForm.amount5.value)==false){ 
		alert("6번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount5.focus();  
		return false;
	}else if(document.productForm.amount6.value==""){ 
		alert("7번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount6.focus();   
		return false;
	}else if(number.test(document.productForm.amount6.value)==false){ 
		alert("7번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount6.focus();  
		return false;
	}else if(document.productForm.amount7.value==""){ 
		alert("8번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount7.focus();   
		return false;
	}else if(number.test(document.productForm.amount7.value)==false){ 
		alert("8번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount7.focus();  
		return false;
	}else if(document.productForm.amount8.value==""){ 
		alert("9번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount8.focus();   
		return false;
	}else if(number.test(document.productForm.amount8.value)==false){ 
		alert("9번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount8.focus();  
		return false;
	}else if(document.productForm.amount9.value==""){ 
		alert("10번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount9.focus();   
		return false;
	}else if(number.test(document.productForm.amount9.value)==false){ 
		alert("10번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount9.focus();  
		return false;
	}else if(document.productForm.amount10.value==""){ 
		alert("11번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount10.focus();   
		return false;
	}else if(number.test(document.productForm.amount10.value)==false){ 
		alert("11번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount10.focus();  
		return false;
	}else if(document.productForm.amount11.value==""){ 
		alert("12번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount11.focus();   
		return false;
	}else if(number.test(document.productForm.amount11.value)==false){ 
		alert("12번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount11.focus();  
		return false;
	}else if(document.productForm.amount12.value==""){ 
		alert("13번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount12.focus();   
		return false;
	}else if(number.test(document.productForm.amount12.value)==false){ 
		alert("13번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount12.focus();  
		return false;
	}else if(document.productForm.amount13.value==""){ 
		alert("14번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount13.focus();   
		return false;
	}else if(number.test(document.productForm.amount13.value)==false){ 
		alert("14번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount13.focus();  
		return false;
	}else if(document.productForm.amount14.value==""){ 
		alert("15번째 사이즈 개수를 입력해주세요.");         
		document.productForm.amount14.focus();   
		return false;
	}else if(number.test(document.productForm.amount15.value)==false){ 
		alert("15번째 사이즈 수량은 숫자로만 입력해주세요");        
		document.productForm.amount15.focus();  
		return false;
	}
	
	document.productForm.submit();
	return true;
}