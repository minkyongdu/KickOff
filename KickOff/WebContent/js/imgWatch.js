
function imageURL1(input) {
	var img = document.getElementById('files[0]').value; //파일을 추가한 input 박스의 값
	   img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	   if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
	      alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
	      return; 
	  }
	 
	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img1').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}


function imageURL2(input) {
	var img = document.getElementById('files[1]').value; //파일을 추가한 input 박스의 값
	   img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	   if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
	      alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
	      return;
	  }
	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img2').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function imageURL3(input) {
	var img = document.getElementById('files[2]').value; //파일을 추가한 input 박스의 값
	   img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	   if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
	      alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
	      return;
	  }
	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img3').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function imageURL4(input) {
	var img = document.getElementById('files[3]').value; //파일을 추가한 input 박스의 값
	   img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	   if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
	      alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
	      return;
	  }
	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img4').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
function imageURL5(input) {
	var img = document.getElementById('files[4]').value; //파일을 추가한 input 박스의 값
	   img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	   if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
	      alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
	      return;
	  }
	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#img5').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
 

$(document).ready(function (){
	   $('#productinsert').click(function() {
		   var number = /^[0-9]*$/;
	        if($('#Aname').val()==""&&$('#price').val()==""&&$('#groupNum').val()==""){
	         alert("상품명, 가격, 분류를 입력(선택) 해주세요.");
	         $('#Aname').focus();
	         return false;
	      }else if($('#Aname').val()==""){
	         alert('상품명을 입력해주세요.');
	         $('#Aname').focus();
	         return false;
	      }else if($('#price').val()==""){
		     alert('가격을 입력해주세요.');
		      $('#price').focus();
		    return false;
		  }else if(!number.test($('#price').val())){
			  alert('숫자만 입력해주세요.');
		      $('#price').focus();
		    return false;
		  }else if($('#groupNum').val()==""){
	    	  alert('분류를 선택해주세요.');
	         $('#groupNum').focus();
	         return false;
	      } else if($('#amount1').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount1').val("0");
	    		  		return false;
	    		  }
	    	  else
	    		  	$('#amount1').focus();
		         return false;
		  } 
	      else if(!number.test($('#amount1').val())){
	    	  alert("숫자만 입력해 주세요."); 
	    	  $('#amount1').val("");
	    	  $('#amount1').focus();
	    	  return false; 
	      }
	      else if($('#amount2').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount2').val("0");
	    		  		return false;
	    		  }
	    	  else
	    		  	$('#amount2').focus();
		         return false; 
		  }
	      else if($('#amount2').val().length > 0 && !number.test($('#amount2').val())){
	    	  alert("숫자만 입력해 주세요.");
	    	  $('#amount2').val("");
	    	  $('#amount2').focus();
	    	  return false;
	      }
	      else if($('#amount3').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount3').val("0");
	    		  		return false;
	    		  }
	    	  else
	    		  	$('#amount3').focus();
		         return false;
		  }
	      else if(!number.test($('#amount3').val())){
	    	  alert("숫자만 입력해 주세요.");
	    	  $('#amount3').val("");
	    	  $('#amount3').focus();
	    	  return false;
	      }
	      else if($('#amount4').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount4').val("0");
	    		  		return false;
	    		  }
	    	  else
	    		  	$('#amount4').focus();
		         return false;
		  }
	      else if(!number.test($('#amount4').val())){
	    	  alert("숫자만 입력해 주세요.");
	    	  $('#amount4').val("");
	    	  $('#amount4').focus();
	    	  return false;
	      }
	      else if($('#amount5').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount5').val("0");
	    		  		return false;
	    		  }
	    	  else
	    		  	$('#amount5').focus();
		         return false;
		  }
	      else if(!number.test($('#amount5').val())){
	    	  alert("숫자만 입력해 주세요.");
	    	  $('#amount5').val("");
	    	  $('#amount5').focus();
	    	  return false;
	      }
	      else if($('#amount6').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount6').val("0");
	    		  		return false;
	    		  		
	    		  }
	    	  else
	    		  	$('#amount6').focus();
		         return false;
		  }
	      else if(!number.test($('#amount6').val())){
	    	  alert("숫자만 입력해 주세요.");
	    	  $('#amount6').val("");
	    	  $('#amount6').focus();
	    	  return false;
	      }
	      else if($('#amount7').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount7').val("0"); 
	    		  		return false;
	    		  }
	    	  else
	    		  	$('#amount7').focus();
		         return false;
		  }
	      else if(!number.test($('#amount7').val())){
	    	  alert("숫자만 입력해 주세요.");
	    	  $('#amount7').val("");
	    	  $('#amount7').focus();
	    	  return false;
	      }
	      else if($('#amount8').val()==""){
	    	  if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true)
	    		  {
	    		  		$('#amount8').val("0");
	    		  		return false;
	    		  }
	    	  else
	    		  	$('#amount8').focus();
		         return false;
		  } 
	      else if(!number.test($('#amount8').val())){
	    	  alert("숫자만 입력해 주세요.");
	    	  $('#amount8').val("");
	    	  $('#amount8').focus();
	    	  return false;   
	      }else if(document.getElementById('files[0]').value != null){
	        	 var img = document.getElementById('files[0]').value;
	        	 img = img.slice(img.indexOf(".") + 1).toLowerCase();
		         if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){
		        	 alert('이미지 파일만 등록 가능합니다.');
			         return false;
		         }//확장자를 확인합니다.
	       }else if(document.getElementById('files[1]').value != null){
	        	 var img1 = document.getElementById('files[1]').value;
	        	 img1 = img1.slice(img.indexOf(".") + 1).toLowerCase();
	        	 if(img1 != "jpg" && img1 != "png" &&  img1 != "gif" &&  img1 != "bmp"){
	        		 alert('이미지 파일만 등록 가능합니다.');
		             return false;
	        	 }//확장자를 확인합니다.
	       }else if(document.getElementById('files[2]').value != null){
	        	 var img2 = document.getElementById('files[2]').value;
	        	 img2 = img2.slice(img.indexOf(".") + 1).toLowerCase();
	             if(img2 != "jpg" && img2 != "png" &&  img2 != "gif" &&  img2 != "bmp"){
	            	 alert('이미지 파일만 등록 가능합니다.');
		             return false;
	             }//확장자를 확인합니다.	  
	         }else if(document.getElementById('files[3]').value != null){
	        	 var img3 = document.getElementById('files[3]').value;
	        	 img2 = img3.slice(img.indexOf(".") + 1).toLowerCase();
	             if(img3 != "jpg" && img3 != "png" &&  img3 != "gif" &&  img3 != "bmp"){
	            	 alert('이미지 파일만 등록 가능합니다.');
		             return false;
	             }//확장자를 확인합니다.	  
	         }else if(document.getElementById('files[4]').value != null){
	        	 var img4 = document.getElementById('files[4]').value;
	        	 img4 = img4.slice(img.indexOf(".") + 1).toLowerCase();
	             if(img4 != "jpg" && img4 != "png" &&  img4 != "gif" &&  img4 != "bmp"){
	            	 alert('이미지 파일만 등록 가능합니다.');
		             return false;
	             }//확장자를 확인합니다.	  
	         }
	   })
});