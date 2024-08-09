package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	private MyPageDAO mydao;
	
	//은행계좌추가
	@Override
	public void addBank(MemberVO vo) {
		mydao.addBank(vo);
		
	}

	//회원정보추가
	@Override
	public void addInfo(MemberVO vo) {
		mydao.addInfo(vo);
	}

	//신원인증추가
	@Override
	public void addIdentity(MemberVO vo) {
		mydao.addIdentity(vo);
	}
	
	
	
	
	
	
}
