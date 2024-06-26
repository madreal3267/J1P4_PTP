package com.itwillbs.persistence;

import com.itwillbs.domain.MemberVO;

public interface MyPageDAO {
	
	//은행계좌추가
	public void addBank(MemberVO vo); 
	 
	//회원정보 추가
	public void addInfo(MemberVO vo);
	
	//신원인증 추가
	public void addIdentity(MemberVO vo);
}
