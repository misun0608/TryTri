package com.myproject.trytri;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myproject.trytri.voes.NReplyVO;

@RestController
public class TTAjaxController {
	
	@Autowired
	private TrytriService tts;
	
	@PostMapping("/getNoticeReply.do")
	public ArrayList<NReplyVO> getNoticeReply(@RequestParam("notice_num")int notice_num) throws Exception{
		
		return tts.getNoticeReply(notice_num);
	}
	
	@PostMapping("/insertNoticeReply.do")
	public void insertNoticeReply(NReplyVO rv) throws Exception{
		
		tts.insertNoticeReply(rv);
	}
}
