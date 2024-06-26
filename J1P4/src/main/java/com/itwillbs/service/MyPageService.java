package com.itwillbs.service;

import com.itwillbs.domain.MemberVO;

public interface MyPageService {
	
	//은행계좌추가
	public void addBank(MemberVO vo); 
		
	//회원정보추가
	public void addInfo(MemberVO vo);
	
	//신원인증추가
	public void addIdentity(MemberVO vo);
}
