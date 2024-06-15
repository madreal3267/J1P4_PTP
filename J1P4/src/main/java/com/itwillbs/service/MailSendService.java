package com.itwillbs.service;

import com.itwillbs.domain.MemberVO;

public interface MailSendService {
		
		//회원가입
		public void join(MemberVO vo) throws Exception;
		
			
		//이메일 인증 후 0->1로 바뀌면 로그인 허용
		int updateMailAuth(String mail_auth) throws Exception;
		
		
		
		
		

}
