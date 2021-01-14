package com.myproject.trytri;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.mapper.MemberMapper;
import com.myproject.trytri.voes.MemberVO;

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
}
