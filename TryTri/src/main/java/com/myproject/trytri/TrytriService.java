package com.myproject.trytri;

import java.util.ArrayList;

import com.myproject.trytri.voes.MemberVO;
import com.myproject.trytri.voes.NoticeVO;

public interface TrytriService {
	// Login
	public String userChk(MemberVO memberVO) throws Exception;
	
	// Notice board
	public void insertNoticeBoard(NoticeVO nv) throws Exception;
	
	// Notice board pagination
	public int getNoticeBoardCount() throws Exception;
	
	// 뭔지 아직은 모르겠엄
	public ArrayList<NoticeVO> loadNoticeBoard(int startRow, int endRow) throws Exception;
}
