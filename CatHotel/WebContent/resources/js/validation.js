function CheckReservation() {

	var name = document.getElementById("name");
	var phoneNumber = document.getElementById("phoneNumber");
	var checkIn = document.getElementById("checkIn");
	var checkOut = document.getElementById("checkOut");
	
	var name_regul = /^[가-힝a-zA-Z]{2,}$/;   //이름 유효성검사
	var phone_regul= /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g; //핸드폰 번호 검사
	var date_regul = /^(20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/; 
	
	// 이름 체크 (2자리 미만으로 입력거나 한글이 입력됐는지 확인)
	if(name.value.length<2){
		alert("이름을 정확히 입력해 주세요");
		name.select();
		name.focus();
		return false;
	}
	//이름에 특수문자가 들어간 경우
	if(!check(name_regul, name,"이름을 정확히 입력해 주세요")){
		return false;
	}
	// 핸드폰 번호 체크
	if(!check(phone_regul,phoneNumber,"전화번호를 정확히 입력해주세요")){
		return false;
	}
	//날짜 입력 체크
	if(!datecheck(date_regul,checkIn,"날짜를 정확히 입력해주세요")){
		return false;
	}
	if(!datecheck(date_regul,checkOut,"날짜를 정확히 입력해주세요")){
		return false;
	}
	
	function datecheck(regExp,e, msg){
		
		if(regExp.test(e.value)){
			var arrDate = e.value.split("-");
  			var nYear = Number(arrDate[0]);
    		var nMonth = Number(arrDate[1]);
			var nDay = Number(arrDate[2]);
		
			if (nYear < 2020 || nYear > 2100){ // 2020~ 2100 년도까지만 선택가능
      			  alert(msg);
				  e.select();
				  e.focus();
      			  return false;
    		}	
    		
    		if (nMonth < 1 || nMonth > 12){ // 1~12까지인지 체크
        		 alert(msg);
				 e.select();
				 e.focus();
        		 return false;
    		}
    		// 해당달의 마지막 일자 구하기
   		 	var nMaxDay = new Date(new Date(nYear, nMonth, 1) - 86400000).getDate();
    		if (nDay < 1 || nDay > nMaxDay){ // 사용가능 하지 않은 날자 체크
       			alert(msg);
				e.select();
				e.focus();
       			return false;
    		}	
 
			return true;
		}		
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	function check(regExp, e, msg) {
		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newReservation.submit();
}
