package com.itwillbs.service;

import com.itwillbs.domain.MemberVO;


public interface AccountService {

		//폰번호 입력, 수정
		public void phonNo(MemberVO vo);
		
		//현재 비밀번호 맞는지 확인
		public String password(String user_id);
		
		//비밀번호 수정
		public void passwordUpdate(MemberVO vo);
		
		//아이디 조회
		public String selectId(String user_id);
	
	
}
