package com.myproject.trytri;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mapper.BoardMapper;
import com.myproject.mapper.MemberMapper;
import com.myproject.trytri.voes.MemberVO;
import com.myproject.trytri.voes.NoticeVO;

@Service
public class TrytriServiceImpl implements TrytriService {

	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public String userChk(MemberVO memberVO) throws Exception{
		MemberVO member_db;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_db = memberMapper.userChk(memberVO);
			
			if(member_db == null) {
				return "non_member";
			}else if(!member_db.getMember_pw().equals(memberVO.getMember_pw())) {
				return "wrong_pw";
			}
			
		}catch(Exception e) {
			System.out.println("ERROR(TrytriService/userChk) : " + e.getMessage());
			return "login_error";
		}
		return "login_accept";
	}
	
	@Override
	public void insertNoticeBoard(NoticeVO nv) throws Exception{
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			int result = boardMapper.insertNoticeBoard(nv);
			
			if(result == 1) {
				System.out.println("Success in inserting on Notice");
			}else {
				System.out.println("failure on inserting on Notice");
			}
		}catch(Exception e) {
			System.out.println("Error(TrytriService/insertNoticeBoard) : " + e.getMessage());
			throw new Exception("Error(TrytriService/insertNoticeBoard)", e);
		}
	}
	
	@Override
	public int getNoticeBoardCount() throws Exception{
		int count = 0;	// 게시글 수
		
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			count = boardMapper.getNoticeBoardCount();
			
		}catch(Exception e) {
			System.out.println("Error(TrytriService/getNoticeBoardCount) : " + e.getMessage());
			throw new Exception("Error(TrytriService/getNoticeBoardCount)", e);
			
		}
		return count;
	}
	
//	@Override
//	public ArrayList<NoticeVO> loadNoticeBoard(int startRow, int endRow) throws Exception{
//		ArrayList<NoticeVO> nlist = null;
//		try {
//			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
//			nlist = boardMapper.loadNoticeBoard(startRow, endRow);
//		}catch(Exception e) {
//			System.out.println("Error(TrytriService/loadNoticeBoard) : " + e.getMessage());
//			throw new Exception("Error(TrytriService/loadNoticeBoard)", e);
//		}
//		return nlist;
//	}
	
	@Override
	public NoticeVO getNoticeDetail(int notice_num) throws Exception{
		NoticeVO noticeVO;
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			noticeVO = boardMapper.getNoticeDetail(notice_num);
		}catch(Exception e) {
			System.out.println("Error(TrytriService/getNoticeDetail) : " + e.getMessage());
			throw new Exception("Error(TrytriService/getNoticeDetail)", e);
		}
		return noticeVO;
	}
	
	@Override
	public ArrayList<NoticeVO> listPage(int displayPost, int postNum) throws Exception{
		ArrayList<NoticeVO> nlist = null;
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			nlist = boardMapper.listPage(displayPost, postNum);
		}catch(Exception e) {
			System.out.println("Error(TrytriService/listPage) : " + e.getMessage());
			throw new Exception("Error(TrytriService/listPage)", e);
		}
		return nlist;
	}
}
