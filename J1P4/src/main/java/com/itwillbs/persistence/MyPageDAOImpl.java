package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE 
	               = "com.itwillbs.mapper.MemberMapper.";
	
	//은행계좌추가
	@Override
	public void addBank(MemberVO vo) {
		sqlSession.update(NAMESPACE+"addBank", vo);
		
	}

	//회원정보추가
	@Override
	public void addInfo(MemberVO vo) {
		logger.debug("vo :"+vo);
		sqlSession.update(NAMESPACE+"addinfo", vo);
	}

	//신원인증추가
	@Override
	public void addIdentity(MemberVO vo) {
		sqlSession.update(NAMESPACE+"identity", vo);
	}
	
	
	
	
	
	
	
	
}
