package com.myproject.trytri;

import java.util.ArrayList;

import com.myproject.trytri.voes.MemberVO;
import com.myproject.trytri.voes.NReplyVO;
import com.myproject.trytri.voes.NoticeVO;

public interface TrytriService {
	// Login
	public String userChk(MemberVO memberVO) throws Exception;
	
	// Notice board
	public void insertNoticeBoard(NoticeVO nv) throws Exception;
	
	// Notice board pagination
	public int getNoticeBoardCount() throws Exception;
	
	// 구버전 paging
//	public ArrayList<NoticeVO> loadNoticeBoard(int startRow, int endRow) throws Exception;
	
	// Notice Detail
	public NoticeVO getNoticeDetail(int notice_num) throws Exception;
	
	//
	public ArrayList<NoticeVO> listPage(int displayPost, int postNum) throws Exception;
	
	// Update Notice
	public void updateNotice(NoticeVO nv) throws Exception;
	
	// Get Reply list
	public ArrayList<NReplyVO> getNoticeReply(int notice_num) throws Exception;
	
	public void insertNoticeReply(NReplyVO rv) throws Exception;
	
}
