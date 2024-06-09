package com.itwillbs.service;

import com.itwillbs.domain.MemberVO;

public interface MailSendService {
	
		//이메일 인증값 저장
		String updateMailKey(MemberVO vo) throws Exception;
			
		//이메일 인증 후 로그인 허용
		int updateMailAuth(MemberVO vo) throws Exception;
		
		
		

}
