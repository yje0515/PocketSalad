//로그인 아이디 비밀번호 공백체크
function loginCheck(){
	if(document.frm.userid.value.length==0){
		alert("아이디를 입력 해 주세요.")
		frm.userid.focus();
		return false;
	}
	if(document.frm.pwd.value==""){
		alert("비밀번호를 입력 해 주세요.")
		frm.pwd.focus();
		return false;
	}
	return true;	
}

//회원가입 아이디 중복체크
function idCheck(){
	if(document.frm.userid.value==""){
		alert("아이디를 입력 해 주세요.")
		document.frm.userid.focus();
		return;
		
	}
	var url="idCheck.do?userid="+document.frm.userid.value;
	window.open(url,"_blank_1","toolbar=no, menubar=no,scrollbars=yes, resizable=no, width=450,height=200");
}

//중복체크창
function idok(userid){
	opener.frm.userid.value= document.frm.userid.value;
	opener.frm.reid.value=document.frm.userid.value;
	self.close();
}

//회원가입 공백,조건체크
function joinCheck(){
	if (document.frm.username.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.username.focus();
		return false;
	}
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력해주세요");
		frm.userid.focus();
		return false;
	}
	if (document.frm.userid.value.length < 4) {
		alert("아이디는 4글자이상이어야 합니다.");
		frm.userid.focus();
		return false;
	}
	if (document.frm.pwd.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.pwd.value != document.frm.pwd_check.value) {
		alert("암호가 일치하지 않습니다.");
		frm.pwd.focus();
		return false;
	}
	if (document.frm.reid.value.length == 0) {
		alert("중복 체크를 하지 않았습니다.");
		frm.userid.focus();
		return false;
	}
	return true;
	
}