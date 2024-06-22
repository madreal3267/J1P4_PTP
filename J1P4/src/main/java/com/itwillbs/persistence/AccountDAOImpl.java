package com.itwillbs.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberVO;

@Repository
public class AccountDAOImpl implements AccountDAO {

	@Inject
	private SqlSession sqlSession; //SqlSession객체는 인터페이스를 생성하지 않는다.

	private static final String NAMESPACE 
	               = "com.itwillbs.mapper.MemberMapper.";
	
	//폰번호 입력/수정
	@Override
	public void phonNo(MemberVO vo) {
		sqlSession.update(NAMESPACE+"phoneNo", vo);
		
	}
	
	//비밀번호 찾기
	@Override
	public String password(String user_id) {
		return sqlSession.selectOne(NAMESPACE+"password", user_id);
	}
	
	//비밀번호 수정
	@Override
	public void passwordUpdate(Map<String, Object> paramMap) {
		sqlSession.update(NAMESPACE+"passwordUpdate", paramMap);
	}
	
	//아이디 조회
	@Override
	public String selectId(String user_id) {
		sqlSession.selectOne(NAMESPACE+"id", user_id);
		return null;
	}
	
	
	
}
