function onclick_write(){
	if(document.notice_form.notice_title == ""){
		alert('제목을 입력해주세요.');
		return
	}else if(document.notice_form.notice_content == ""){
		alert('내용을 입력해주세요.');
		return
	}else{
		notice_form.submit();
	}
}

