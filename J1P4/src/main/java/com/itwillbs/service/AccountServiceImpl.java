package com.itwillbs.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService {
	
	@Inject
	private AccountDAO adao;

	
	
	//폰번호 입력/수정
	@Override
	public void phonNo(MemberVO vo) {
		adao.phonNo(vo);
		
	}

	
	//현재 비밀번호 맞는지
	@Override
	public int password(MemberVO vo) {
		
		return adao.password(vo);
	}
	//비밀번호조회
	@Override
	public String pass(String user_id) {
		return adao.pass(user_id);
	}

	
	
	//비밀번호 수정
	@Override
	public void passwordUpdate(MemberVO vo)throws Exception {
		 adao.passwordUpdate(vo);
		
	}

	//아이디 조회
	@Override
	public String selectId(String user_id) {
		return adao.selectId(user_id);
	}
	
	
	
	
	
	
	
}
