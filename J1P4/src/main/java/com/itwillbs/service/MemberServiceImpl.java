package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.MemberDAO;

/**
 *	서비스는 컨트롤러와 DAO를 연결
 *	=> DAO를 호출
 */
// @Service : 해당 객체를 Service 객체(bean)로 root-context.xml이 인식하도록 설정
@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	// DAO를 호출하기(객체를 생성) => 의존 객체 주입
	// MemberDAO mdao = new MemberDAOImpl(); (직접 생성 X)
	// root-context.xml에 생성되어있는 DAO객체(빈)을 주입
	
	@Inject
	private MemberDAO mdao;


	@Override
	public void testJoin(MemberVO vo) {
		
		// 컨트롤러 -> 서비스 
		logger.debug(" testJoin(MemberVO2 vo) 실행 ");
		
		// DAO 메서드 호출
		mdao.insertTest(vo);
		
		logger.debug(" ╰(*°▽°*)╯ 테스트 성공 ! ╰(*°▽°*)╯ ");
		
	}

	
	//회원가입
	@Override
	public void join(MemberVO vo) {
		mdao.insert(vo);
		
	}


	
	//로그인
	@Override
	public MemberVO memberLogin(MemberVO loginVO) {
		
		return mdao.login(loginVO);
	}
	
	
	

	
	
	
	
	
}
