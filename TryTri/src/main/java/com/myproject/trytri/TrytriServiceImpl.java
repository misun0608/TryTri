package com.myproject.trytri;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TrytriServiceImpl implements TrytriService {

	@Autowired 
	private SqlSession sqlSession;
}
