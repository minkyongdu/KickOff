$(document).ready(function() {
		$('#addNumamount').hide(); // 숫자 신발 사이즈
		$('#addEngamount').hide(); // 영어 옷 사이즈
		$('#addNoneamount').hide(); // 사이즈x 수량만
		$('#addSocksamount').hide(); // 양말 사이즈 
		$('#addGlovesamount').hide(); // 골키퍼 장갑 사이즈
		$('#restartSizeamount').hide(); // 다시 작성하기
		$('#productinsert').hide(); // 작성하기 버튼
		
		$('#addFile').click(function() { 
			var fileIndex = $('#fileview tr').length; //<table id="fileview"> 밑에 tr 갯수을 fileIndex에 담음
			if (Number(fileIndex) >= '5') { //file Upload 갯수를 5개로 제한
				alert('FILE UPLOAD는 5개만 가능 합니다.');
				return;
			}
			var i = $('#fileview tr').length;
			if(Number(i) >= '5'){
				return;
			}
			$('#fileview').append(
					'<tr><td>'
						+ '   <input type="file" id="files['+ fileIndex +']" name="files['+ fileIndex +']" onchange="imageURL'+(i+1)+'(this)" />'
						+ '</td></tr>'); 
			}); 
		$('#selectbutton').click(function(){
			if($('#groupNum').val() == "")
				{
					alert('분류번호를 선택해 주세요.');
				}
			// 1 ~ 5, 신발 사이즈
				if($('#groupNum').val() == "1" || $('#groupNum').val() == "2" || $('#groupNum').val() == "3"
					|| $('#groupNum').val() == "4" || $('#groupNum').val() == "5"){
					$('#groupImg').hide();
					$('#selectbutton').hide();
					$('#sizeamountview').append( //['+ u +']
							'<tr><td> 사이즈 : <input type = "text" name = "asize0" id = "asize0" value = "230" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount0" id = "amount0" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize1" id = "asize1" value = "240" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount1" id = "amount1" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize2" id = "asize2" value = "250" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount2" id = "amount2" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize3" id = "asize3" value = "260" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount3" id = "amount3" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize4" id = "asize4" value = "270" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount4" id = "amount4" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize5" id = "asize5" value = "280" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount5" id = "amount5" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize6" id = "asize6" value = "290" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount6" id = "amount6" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize7" id = "asize7" value = "300" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount7" id = "amount7" value = "0"></td></tr>');
					$('#restartSizeamount').show();
					$('#productinsert').show(); 
				}
			// 6 ~ 8, 21 사이즈 x
			 if($('#groupNum').val() == "6" || $('#groupNum').val() == "7" || $('#groupNum').val() == "8" || $('#groupNum').val() == "21")
					{
				 	$('#groupImg').hide();
				 	$('#selectbutton').hide();
				 	$('#sizeamountview').append(
							'<tr><td> 사이즈 : <input type = "text" name = "asize0" id = "asize0" value = "default" size= "2" readonly>'
							+ ' 수량 : <input type = "text" name = "amount0" id = "amount0" value = "0"></td></tr>'
							);
				 	$('#restartSizeamount').show();
					$('#productinsert').show();
					}
			// 9 ~ 14 옷 사이즈
			 if($('#groupNum').val() == "9" || $('#groupNum').val() == "10" || $('#groupNum').val() == "11"
					|| $('#groupNum').val() == "12" || $('#groupNum').val() == "13" || $('#groupNum').val() == "14"){
				 $('#groupImg').hide();
				 $('#selectbutton').hide();
				 $('#sizeamountview').append(				//['+ u +']
							'<tr><td> 사이즈 : <input type = "text" name = "asize0" id = "asize0" value = "XXLZ" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount0" id = "amount0" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize1" id = "asize1" value = "XL" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount1" id = "amount1" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize2" id = "asize2" value = "L" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount2" id = "amount2" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize3" id = "asize3" value = "M" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount3" id = "amount3" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize4" id = "asize4" value = "XS" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount4" id = "amount4" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize5" id = "asize5" value = "S" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount5" id = "amount5" value = "0"></td></tr>');
				 $('#restartSizeamount').show();			
				 $('#productinsert').show();
				}
			// 15 ~ 18 가방 사이즈
				 if($('#groupNum').val() == "15" || $('#groupNum').val() == "16" || $('#groupNum').val() == "17" || $('#groupNum').val() == "18"){
					 $('#groupImg').hide();
					 $('#selectbutton').hide();
					 $('#sizeamountview').append(				//['+ u +']
								'<tr><td> 사이즈 : <input type = "text" name = "asize0" id = "asize0" value = "XXL" size = "1" readonly>'
								+ ' 수량 : <input type = "text" name = "amount0" id = "amount0" value = "0"></td></tr><br>'
								+ '<tr><td> 사이즈 : <input type = "text" name = "asize1" id = "asize1" value = "XL" size = "1" readonly>'
								+ ' 수량 : <input type = "text" name = "amount1" id = "amount1" value = "0"></td></tr><br>'
								+ '<tr><td> 사이즈 : <input type = "text" name = "asize2" id = "asize2" value = "L" size = "1" readonly>'
								+ ' 수량 : <input type = "text" name = "amount2" id = "amount2" value = "0"> </td></tr><br>'
								+ '<tr><td> 사이즈 : <input type = "text" name = "asize3" id = "asize3" value = "M" size = "1" readonly>'
								+ ' 수량 : <input type = "text" name = "amount3" id = "amount3" value = "0"></td></tr><br>'
								+ '<tr><td> 사이즈 : <input type = "text" name = "asize4" id = "asize4" value = "XS" size = "1" readonly>'
								+ ' 수량 : <input type = "text" name = "amount4" id = "amount4" value = "0"></td></tr><br>'
								+ '<tr><td> 사이즈 : <input type = "text" name = "asize5" id = "asize5" value = "S" size = "1" readonly>'
								+ ' 수량 : <input type = "text" name = "amount5" id = "amount5" value = "0"></td></tr>');
					 $('#restartSizeamount').show();
					 $('#productinsert').show();
				}
			// 19 양말 사이즈
				if($('#groupNum').val()=="19"){
					$('#groupImg').hide();
					$('#selectbutton').hide();
					$('#sizeamountview').append(				//['+ u +']
							'<tr><td> 사이즈 : <input type = "text" name = "asize0" id = "asize0" value = "22" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount0" id = "amount0" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize1" id = "asize1" value = "23" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount1" id = "amount1" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize2" id = "asize2" value = "24" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount2" id = "amount2" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize3" id = "asize3" value = "25" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount3" id = "amount3" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize4" id = "asize4" value = "26" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount4" id = "amount4" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize5" id = "asize5" value = "27" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount5" id = "amount5" value = "0"></td></tr>'
							+'<tr><td> 사이즈 : <input type = "text" name = "asize6" id = "asize6" value = "28" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount6" id = "amount6" value = "0"></td></tr>');
					$('#restartSizeamount').show();
					$('#productinsert').show();
				}
			// 20 골키퍼 장갑 사이즈
				if($('#groupNum').val()=="20"){
					$('#groupImg').hide();
					$('#selectbutton').hide();
					$('#sizeamountview').append(				//['+ u +']
							'<tr><td> 사이즈 : <input type = "text" name = "asize0" id = "asize0" value = "4" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount0" id = "amount0" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize1" id = "asize1" value = "5" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount1" id = "amount1" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize2" id = "asize2" value = "6" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount2" id = "amount2" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize3" id = "asize3" value = "7" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount3" id = "amount3" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize4" id = "asize4" value = "8" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount4" id = "amount4" value = "0"></td></tr><br>'
							+ '<tr><td> 사이즈 : <input type = "text" name = "asize5" id = "asize5" value = "9" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount5" id = "amount5" value = "0"></td></tr>'
							+'<tr><td> 사이즈 : <input type = "text" name = "asize6" id = "asize6" value = "10" size = "1" readonly>'
							+ ' 수량 : <input type = "text" name = "amount6" id = "amount6" value = "0"></td></tr>');
					$('#restartSizeamount').show();
					$('#productinsert').show();
				} 
			// 22 ~ 29 사이즈 x 
				 if($('#groupNum').val() == "22" || $('#groupNum').val() == "23" || $('#groupNum').val() == "24" 
						 || $('#groupNum').val() == "25" || $('#groupNum').val() == "26" || $('#groupNum').val() == "27"
						|| $('#groupNum').val() == "28" || $('#groupNum').val() == "29"){
						 $('#groupImg').hide();
						 $('#selectbutton').hide();
						 $('#sizeamountview').append(
									'<tr><td> 사이즈 : <input type = "text" name = "asize0" id = "asize0" value = "default" size= "2" readonly>'
									+ ' 수량 : <input type = "text" name = "amount0" id = "amount0" value = "0"></td></tr>'
									);
						 $('#restartSizeamount').show();
						 $('#productinsert').show();
					}
		});
	});