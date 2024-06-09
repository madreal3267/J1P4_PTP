package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberVO;

/**
 * MemberDAO 인터페이스를 구현한 객체 => 기존의 DAO객체의 동작 수행
 */

//@Repository : 스프링이 해당파일을 DAO(bean)로 인식하도록 설정

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	// 공용변수,디비연결,자원해제 동작 선언 => 기존코드

	// root-context.xml (스프링)에서 필요한 기능을 하는 객체를 주입
	@Inject
	private SqlSession sqlSession; //SqlSession객체는 인터페이스를 생성하지 않는다.

	private static final String NAMESPACE 
	               = "com.itwillbs.mapper.MemberMapper.";
	




	//회원가입
	@Override
	public void insert(MemberVO vo) {
		
		sqlSession.insert(NAMESPACE+"join", vo);
		
	}




	//이메일 인증값 저장
	@Override
	public void updateMailKey(String user_email, String mail_key) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("mail_key", mail_key);
		
		sqlSession.selectOne(NAMESPACE+"updateMailKey", map);
		
	}




	//이메일 인증 후 로그인 허용
	@Override
	public void updateMailAuth(String user_email) throws Exception {
		sqlSession.update("memberMapper.memberAuth", user_email);
	}






	
	
	

	
	
	
	
	
	
	
	
	
	

}// MemberDAOImpl 끝
