function CheckValidation() {
	var breadId = document.newProduct.breadId;
	var bname = document.newProduct.bname;
	var breadPrice = document.newProduct.breadPrice;
	var unitsInStock = document.newProduct.unitsInStock;
	var content = document.newProduct.content;
	var calorie = document.newProduct.calorie;
	var regExpId = /^B[0-9]{1,9}$/;
	var regExpName = /^[a-zA-Z가-힣 ]{2,20}$/;
	
	if(!regExpId.test(breadId.value)) {
		alert("[아이디]\nB와 숫자를 조합하여 2~10자까지 입력하세요!\n반드시 첫 글자는 B로 시작하세요!");
		breadId.select();
		breadId.focus();
		return false;
	}
	
	if(!regExpName.test(bname.value)) {
		alert("[이름]\n최소 2자에서 20자까지 입력하세요!\n숫자, 특수문자는 입력할 수 없습니다.");
		bname.select();
		bane.focus();
		return false;
	} 
	
	if(breadPrice.value < 0) {
		alert("[가격]\n음수는 입력할 수 없습니다!");
		breadPrice.select();
		breadPrice.focus();
		return false;
	} else if(isNaN(breadPrice.value)) {
		alert("[가격]\n숫자만 입력할 수 없습니다!");
		breadPrice.select();
		breadPrice.focus();
		return false;
	}
	
	if(unitsInStock.value < 0) {
		alert("[재고]\n음수는 입력할 수 없습니다!");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	} else if(isNaN(unitsInStock.value)) {
		alert("[재고]\n숫자만 입력할 수 없습니다!");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}
	
	if(content.value <= 0) {
		alert("[내용량]\n음수는 입력할 수 없습니다!");
		content.select();
		content.focus();
		return false;
	} else if(isNaN(content.value)) {
		alert("[내용량]\n숫자만 입력할 수 없습니다!");
		content.select();
		content.focus();
		return false;
	}
	
	if(calorie.value < 0) {
		alert("[칼로리]\n음수는 입력할 수 없습니다!");
		calorie.select();
		calorie.focus();
		return false;
	} else if(isNaN(calorie.value)) {
		alert("[칼로리]\n숫자만 입력할 수 없습니다!");
		calorie.select();
		calorie.focus();
		return false;
	}
	
	document.newProduct.submit();
}