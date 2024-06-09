package com.itwillbs.service;

import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberVO;

@Service
public class MailSendServiceImpl implements MailSendService{
	
	//이메일 인증값 저장
	@Override
	public String updateMailKey(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return "";
	}
	
	//이메일 인증 후 로그인 허용
	@Override
	public int updateMailAuth(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
