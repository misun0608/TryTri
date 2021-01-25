package com.myproject.trytri;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myproject.trytri.voes.NReplyVO;

@RestController
public class TTAjaxController {
	
	@Autowired
	private TrytriService tts;
	
	@PostMapping(value="getNoticeReply.do", produces="application/json;charset=UTF-8")
	public ArrayList<NReplyVO> getNoticeReply(int notice_num) throws Exception{
		ArrayList<NReplyVO> rList = new ArrayList<NReplyVO>();
		try {
			rList = tts.getNoticeReply(notice_num);
		}catch(Exception e) {
			System.out.println("Error(TTAjaxController/getNoticeReply) : " + e.getMessage());
		}
		return rList;
	}
	
	@PostMapping(value="/insertNoticeReply.do", produces="application/json;charset=UTF-8")
	public Map<String, Object> insertNoticeReply(NReplyVO rv) throws Exception{
		Map<String,Object> result = new HashMap<String,Object>();
		
		try {
			int res = 0;
			rv.setReply_content(rv.getReply_content().replace("\r\n", "<br/>"));
			res = tts.insertNoticeReply(rv);
			
			if(res != 0) {
				result.put("status", "댓글 등록 성공");
			}else {
				result.put("status", "댓글 등록 실패");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			result.put("status", "Error(TTAjaxController/insertNoticeReply)");
		}
		
		return result;
	}
}
