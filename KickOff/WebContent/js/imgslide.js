function RollImage(json){
	//이미지 롤링 설정값
	var config = {
		currentImg : 0,
		nextImg : 1,
		listArea : e(json.list_area),
		imageList : e(json.list_area).getElementsByTagName("DIV"),
		imgCnt : e(json.list_area).getElementsByTagName("DIV").length-1, //0부터 시작
		rollTime : json.roll_time,
		moveTime : json.move_time,
		coordX1 : 0,
		coordX2 : e(json.list_area).offsetWidth,
		coordY : e(json.list_area).offsetHeight,
		moveAt : json.moveAt,
		direction : json.direction,
		label : e(json.label),
		labelType : json.labelType
	};
	
	labelBind(config); //라벨(버튼) 바인드
	setRoll(config); //롤링 시작
	rollPause(config); //마우스 오버시 롤링 멈춤
	
	//이미지 롤링 기본 세팅하기
	function setRoll(c){
		c.coordX1 = 0;
		c.coordX2 = c.listArea.offsetWidth;
		c.coordY = c.listArea.offsetHeight;

		if(c.direction=="right"){
			c.coordX2 = c.coordX2 * -1;
			c.coordY = c.coordY * -1;
		}
		
		c.imageList[c.nextImg].style.display = "block";
		/* setPosition(c); */
		rollOver(c)
		//c.imageList[c.nextImg].style.left = c.coordX2+"px";
		
		c.rollTimer = setTimeout(function(){imgMove(c)},c.rollTime);
	};

	//이미지를 움직이게 한다.
	function imgMove(c){
		if(c.direction == "left" || c.direction == "right"){
			c.imageList[c.currentImg].style.left = c.coordX1 + "px";
			c.imageList[c.nextImg].style.left = c.coordX2 + "px";
		}
		//alert(c.imageList[c.nextImg].style.left);
		var moveAt = parseInt(c.moveAt)+35;
		 if (c.direction == "left"){
			c.coordX1 -= moveAt;
			c.coordX2 -= moveAt;
		}else if(c.direction == "right"){
			c.coordX1 += moveAt;
			c.coordX2 += moveAt;
		} 
	
		//if(c.coordX1 < (-1*c.listArea.offsetWidth) ) {
		if( isNextImgRoll(c) ) {
			 c.currentImg = c.nextImg; 
			 c.nextImg += 1; 
			if(c.currentImg == c.imgCnt) c.nextImg = 0;
			clearTimeout(c.moveTimer);
			clearTimeout(c.rollTimer);
			setRoll(c);
			return;
		}
		c.moveTimer = setTimeout(function(){imgMove(c)},c.moveTime);
		
	};
	
	//다음 이미지 롤링 해야하는지 확인
	function isNextImgRoll(c){
		var d = c.direction;
		if(d=="left" && c.coordX2 < 0 ) return true;
		else if(d=="right" && c.coordX2 > 0) return true;
		return false
	};

	//롤링 방향에 따른 두번째 이미지 위치 좌표 설정
	function setPosition(c){
		var d = c.direction;
		if(d=="left") c.imageList[c.nextImg].style.left = c.listArea.offsetWidth+"px";
		else if(d=="right") c.imageList[c.nextImg].style.left = (-1 * c.listArea.offsetWidth) + "px";
		//alert(c.imageList[c.nextImg].style.left);
	};
	
	//onmouseover 시 움직임 멈춤
	function rollPause(c){
	//alert(c.listArea.onmouseover);
		c.listArea.onmouseover = function(){
			
			clearTimeout(c.rollTimer);
		}

		c.listArea.onmouseout = function(){
			//alert("c.listArea.onmouseout");
			
			setRoll(c)+50;
		}
	};

	//라벨과 바인드
	function labelBind(c){
		if(c.label == null) return;
		var labels = c.label.getElementsByTagName(c.labelType);

		c.label.onmouseover = function(){
			for(n in labels){
				if(labels[n] == event.srcElement){
					//c.imageList[c.currentImg].style.display = "none";
					c.currentImg = parseInt(n);
					c.nextImg = parseInt(n)+1;
					if(c.currentImg == c.imgCnt) c.nextImg = 0;
					clearTimeout(c.rollTimer);
					viewImg(c);
					rollOver(c);
					break;
				}
			}
			//alert(event.srcElement)
		}
		
		c.label.onmouseout = function(){
			for(n in labels){
				if(labels[n]==event.srcElement){
					setRoll(c);
					break;
				}
			}
		}
	};

	//라벨 onmouseover 시 클래스 적용
	function rollOver(c){
		if(c.label == null) return;
		var els = c.label.getElementsByTagName(c.labelType);
		
		if(c.labelType == "img"){
			
			for(n in els){
				if(typeof els[n] == "object"){
					if(n == c.currentImg){
						els[n].src = els[n].getAttribute("oversrc");
					}else{
						els[n].src = els[n].getAttribute("outsrc");
					}
				}
			}
		}
	}

	//라벨에서 선택된 이미지 보이기
	function viewImg(c){
		//alert(c.currentImg);
		for(n=0; n<c.imgCnt+1; n++)	{
			c.imageList[n].style.display = "none";
		}
		
		c.imageList[c.currentImg].style.left = "0px";
		c.imageList[c.currentImg].style.top = "0px";
		c.imageList[c.currentImg].style.display = "block";
	};
}

function debug(t){
e("dis").innerHTML = t + "<br>";
}
//id값으로 객체 반환
function e(id){
	var o = document.getElementById(id);
	if(typeof o == undefined || o == null) {return null;}

	return o;
}