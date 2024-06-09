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
	
	
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", vo);
		
	}


	
	
	
	
}// MemberDAOImpl 끝
