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

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	//데이터주입
	@Inject
	private MemberDAO mdao;
	
	
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		
		return mdao.login(vo);
	}
	
	//이메일로 아이디 찾기
	@Override
	public MemberVO findId(String memberEmail) throws Exception {
		
		return mdao.findId(memberEmail);
	}

	
	//이메일 존재여부 카운터로 체크 
	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		
		return mdao.findIdCheck(memberEmail);
	}

	//아이디로 회원이 맞는지 체크
	@Override
	public void findpw(MemberVO vo) throws Exception {
		
		 mdao.findpw(vo);
	}

	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	@Override
	public void chagepw(MemberVO vo) throws Exception {
		mdao.chagepw(vo);
		
	}
	
	
	

	
	
	
	
	
}
