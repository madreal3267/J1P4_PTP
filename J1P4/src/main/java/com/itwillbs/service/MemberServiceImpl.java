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
	public List<MemberVO> findId(String memberEmail) throws Exception {
		
		return mdao.findId(memberEmail);
	}

	
	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		
		return mdao.findIdCheck(memberEmail);
	}
	
	
	
	
}
