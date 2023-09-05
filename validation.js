function CheckAddProduct() {
	
	/*addProduct에 설정한 id값을 통해 getElementById()를 이용해서 가져온다.*/
	var productId = document.getElementById("productId");
	var pname = document.getElementById("pname");
	var unitPrice = document.getElementById("unitPrice");
	var unitInStock = document.getElementById("unitInStock");
	
	//상품 아이디 체크 부분
	if(!check(/^P[0-9]{4,11}$/,productId,"[상품코드]\nP와 숫자를 조합하여 5에서 12자까지 입력하세요\n"+
			"첫 글자는 반드시 P로 시작해주세요")){
		return false;
	}
	//상품명의 길이 체크
	if(pname.value.length <4 || pname.value.length >12){
		alert("[상품명]\n최소 5자에서 최대 11자까지 입력해주세요.");
		pname.select();
		pname.focus();
		return false;
		
	}
	
	//상품 가격 체크
	if(unitPrice.value.length==0||isNaN(unitPrice.value)){
		alert("[가격]\n숫자만 입력해주세요.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	if(unitPrice.value<0){
		alert("[가격]\n음수를 입력할 수 없습니다.");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}
	
	if(isNaN(unitInStock.value)){
		alert("[재고수량]\n숫자만 입력해주세요.");
		unitInStock.select();
		unitInStock.focus();
		return false;
	}
	
	if(unitInStock.value<0){
		alert("[재고수량]\n음수를 입력할 수 없습니다..");
		unitInStock.select();
		unitInStock.focus();
		return false;
	}
	
	
	//check함수는 정규표현식(regExp), 유효성검사를 하는 부분(e), 오류가 발생하면 알려줄 메시지(msg) 3개
	//매개변수를 활용하여 패턴이 맞는지 검증하는 내부함수
	function check(regExp, e, msg) { 
		//정규표현식에 적합하다면..
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	
	document.newProduct.submit();
	
}