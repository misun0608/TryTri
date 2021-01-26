package com.myproject.trytri;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mapper.BoardMapper;
import com.myproject.mapper.MemberMapper;
import com.myproject.mapper.ReplyMapper;
import com.myproject.trytri.voes.MemberVO;
import com.myproject.trytri.voes.NReplyVO;
import com.myproject.trytri.voes.NoticeVO;

@Service
public class TrytriServiceImpl implements TrytriService {

	@Autowired 
	private SqlSession sqlSession;
	
	@Override
	public MemberVO userChk(MemberVO memberVO) throws Exception{
		MemberVO member_db = null;
		
		try {
			MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
			member_db = memberMapper.userChk(memberVO);
			
//			if(member_db == null) {
//				return "non_member";
//			}else if(!member_db.getMember_pw().equals(memberVO.getMember_pw())) {
//				return "wrong_pw";
//			}
			
		}catch(Exception e) {
			System.out.println("ERROR(TrytriService/userChk) : " + e.getMessage());
//			return "login_error";
		}
		return member_db;
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
	
	@Override
	public void updateNotice(NoticeVO nv) throws Exception{
		try {
			BoardMapper boardMapper = sqlSession.getMapper(BoardMapper.class);
			int result = boardMapper.updateNotice(nv);
			
			if(result == 1) {
				System.out.println("Success in updating on Notice");
			}else {
				System.out.println("failure on updating on Notice");
			}
			
		}catch(Exception e) {
			System.out.println("Error(TrytriService/updateNotice) : " + e.getMessage());
			throw new Exception("Error(TrytriService/updateNotice)", e);
		}
	}
	
	
	////////////////////////////////댓글//////////////////////////////////////
	// 댓글 출력
	@Override
	public ArrayList<NReplyVO> getNoticeReply(int notice_num) throws Exception{
		ArrayList<NReplyVO> rList = null;
		
		try {
			ReplyMapper replyMapper = sqlSession.getMapper(ReplyMapper.class);
			rList = replyMapper.getNoticeReply(notice_num);
		}catch(Exception e) {
			System.out.println("Error(TrytriService/getNoticeReply) : " + e.getMessage());
			throw new Exception("Error(TrytriService/getNoticeReply)", e);
		}
		return rList;
	}
	
	// 댓글 작성
	@Override
	public int insertNoticeReply(NReplyVO rv) throws Exception{
		int result = 0;
		
		try {
			ReplyMapper replyMapper = sqlSession.getMapper(ReplyMapper.class);
			result = replyMapper.insertNoticeReply(rv);
			
			if(result == 1) {
				System.out.println("댓글 입력 성공");
			}else {
				System.out.println("댓글 입력 실패");
			}
		}catch(Exception e) {
			System.out.println("Error(TrytriService/getNoticeReply) : " + e.getMessage());
			throw new Exception("Error(TrytriService/getNoticeReply)", e);
		}
		return result;
	}
	
	@Override
	public int deleteNoticeRaply(int reply_num) throws Exception{
		int result = 0;
		
		try {
			ReplyMapper replyMapper = sqlSession.getMapper(ReplyMapper.class);
			result = replyMapper.deleteNoticeReply(reply_num);
			
			if(result == 1) {
				System.out.println("댓글 삭제 성공");
			}else {
				System.out.println("댓글 삭제 실패");
			}
		}catch(Exception e) {
			System.out.println("Error(TrytriService/deleteNoticeReply) : " + e.getMessage());
			throw new Exception("Error(TrytriService/deleteNoticeReply)", e);
		}
		return result;
	}
}
