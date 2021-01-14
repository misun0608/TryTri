function onclick_login(){
	
	// check ID
	if(document.login_form.member_id.value == ""){
		alert("아이디를 입력하세요.");
		document.login_form.member_id.focus();
		return;
	
	// check PW
	}else if(document.login_form.member_pw.value == ""){
		alert("비밀번호를 입력하세요.");
		document.login_form.member_pw.focus();
		return;
	}
	login_form.submit();
}