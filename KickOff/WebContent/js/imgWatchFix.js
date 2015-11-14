var imgcheck1 = 'true';
var imgcheck2 = 'true';
var imgcheck3 = 'true';
var imgcheck4 = 'true';
var imgcheck5 = 'true';
function imageURL1(input) {
   var img = document.getElementById('files[0]').value; //파일을 추가한 input 박스의 값
      img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
      if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
         alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
         imgcheck1 = 'false';
         return; 
      } else {
         imgcheck1 = 'true';
         
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
         imgcheck2 = 'false';
         return;
     }else {
        imgcheck2 = 'true';
     }
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              $('#img1').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      } 
}
function imageURL3(input) {
   var img = document.getElementById('files[2]').value; //파일을 추가한 input 박스의 값
      img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
      if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
         alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
         imgcheck3 = 'false';
         return;
     }else {
        imgcheck3 = 'true';
     }
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              $('#img1').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      } 
}
function imageURL4(input) {
   var img = document.getElementById('files[3]').value; //파일을 추가한 input 박스의 값
      img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
      if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
         alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
         imgcheck4 = 'false';
         return;
     }else {
        imgcheck4 = 'true';
     }
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              $('#img1').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      } 
}
function imageURL5(input) {
   var img = document.getElementById('files[4]').value; //파일을 추가한 input 박스의 값
      img = img.slice(img.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
      if(img != "jpg" && img != "png" &&  img != "gif" &&  img != "bmp"){ //확장자를 확인합니다.
         alert('이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
         imgcheck5 = 'false';
         return;
     }else {
        imgcheck5 = 'true';
     }
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              $('#img1').attr('src', e.target.result);
          }
          reader.readAsDataURL(input.files[0]);
      } 
}
 

$(document).ready(function (){
      $('#productinserts').click(function() {
         var number = /^[0-9]*$/;
         var amount;
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
        }
        else{
           for(var i =0; i < 8 ; i++){
              var amount = document.getElementById('amount'+i);
             if(amount != null){
              if (amount.value == ''){
                 if(confirm("값을 입력하지 않으시면 갯수가 0으로 들어갑니다. \n그렇게 하시겠습니까?") == true){
                    amount.value = '0';
                 }else{
                    amount.focus();
                    return false;
                 }
              }else if(!number.test(amount.value)){
                 alert("숫자만 입력해 주세요."); 
                 amount.value="";
                 amount.focus="";
                 return false; 
              }
             }
           }if(imgcheck1=='false' || imgcheck2=='false' || imgcheck3=='false'|| imgcheck4=='false'|| imgcheck5=='false') {
                 alert('이미지 파일을 올바르게 올려주세요.');
                 return false;
              }else if(document.getElementById("files[0]").value == ""){
                 alert('이미지를 추가해주세요.');
                 return false;
              } else{
            	  $("#productForm").submit();
              } 
        } 
      });
});