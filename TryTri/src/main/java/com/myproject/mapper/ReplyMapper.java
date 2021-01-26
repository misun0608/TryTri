package com.myproject.mapper;

import java.util.ArrayList;

import com.myproject.trytri.voes.NReplyVO;

public interface ReplyMapper {
	ArrayList<NReplyVO> getNoticeReply(int notice_num);
	int insertNoticeReply(NReplyVO rv);
	int deleteNoticeReply(int reply_num);
}
