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
	
	
	
	


	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", vo);
		
	}
	
	//아이디에 pk 
	@Override
	public MemberVO findId(String memberEmail) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findId", memberEmail);
	}

	
	//입력된 이메일의 아이디 존재여부 확인->있으면 1 반환, 없으면 0반환
	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findIdCheck", memberEmail);
	}

	// 비번 - 가입한 유저가 맞는지 -> 맞으면 난수 생성 디비저장
	@Override
	public void findpw(MemberVO vo) throws Exception {
		sqlSession.update(NAMESPACE+"mailkey", vo);
	}
	

	
	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	@Override
	public void chagepw(MemberVO vo) throws Exception {
		sqlSession.update(NAMESPACE+"mailkey2", vo);
		
	}
	//아이디가 존재하는지 비교
	@Override
	public MemberVO findUserById(String user_id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findUserById", user_id);
	
	}
	
	//난수가 존재하는지 비교
	@Override
	public MemberVO findUserByMailKey(String mail_key) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findUserByMailKey", mail_key);
	}
	
	

	
	
	
	
	

	
	
	
}
