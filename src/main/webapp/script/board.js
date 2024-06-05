
//게시글 작성/수정시 공백 체크하는 함수
function boardCheck(){
	if(document.frm.username.value.length==0){
		alert("작성자를 입력하세요.");
		return false;
	}
	if(document.frm.pass.value.length==0){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(document.frm.title.value.length==0){
		alert("제목을 입력하세요.");
		return false;
	}
	return true;
}


//새 창이 열리는 함수
function open_win(url,name){ 
	window.open(url,name,"width=500, height=230");
}


//수정/삭제시 비밀번호 공백 체크하는 함수
function passCheck() {
	if (document.frm.pass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}

function areYouSure(){
	alert("정말 삭제하시겠습니까?")
	return true;
}