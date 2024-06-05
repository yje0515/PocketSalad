function productCheck(){
	if(document.frm.productname.value.length==0){
		alert("상품명을 입력해 주세요.");
		frm.productname.focus();
		return false;
	}
	if(document.frm.price.value.length==0){
		alert("가격을 입력해 주세요.");
		frm.price.focus();
		return false;
	}
	if(isNaN(document.frm.price.value)){//숫자가 아니라면
		alert("가격은 숫자로 입력해 주세요.");
		frm.price.focus();
		return false;
	}
	return true;
}

function areYouSure(){
	var result=confirm("정말 삭제하시겠습니까?");
	if(result){
		alert("삭제되었습니다.");
		return true;
	}else{
		alert("취소되었습니다.");
		return false;
	}
	
}