package com.myproject.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.myproject.trytri.voes.NoticeVO;

public interface BoardMapper {
	int insertNoticeBoard(NoticeVO nv);
	int getNoticeBoardCount();
//	ArrayList<NoticeVO> loadNoticeBoard(@Param("startRow")int startRow, @Param("endRow")int endRow);
	NoticeVO getNoticeDetail(int notice_num);
	ArrayList<NoticeVO> listPage(@Param("displayPost")int displayPost, @Param("postNum")int postNum);
}
