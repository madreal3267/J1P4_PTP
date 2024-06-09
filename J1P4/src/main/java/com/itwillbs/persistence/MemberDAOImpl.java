package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE 
	               = "com.itwillbs.mapper.MemberMapper.";
	
	
	
	//입력된 이메일에 해당하는 아이디 반환
	@Override
	public List<MemberVO> findId(String memberEmail) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"findId", memberEmail);
	}

	
	//입력된 이메일의 아이디 존재여부 확인->있으면 1 반환, 없으면 0반환
	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findIdCheck", memberEmail);
	}
	
	
	
}
