package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberVO;

public interface MemberService {
	
	//로그인
	public MemberVO memberLogin(MemberVO vo);
	
	//이메일로 아이디 찾기 
	public MemberVO findId(String memberEmail)throws Exception;
	
	//이메일이 있는지 카운터로 체크 
	public int findIdCheck(String memberEmail)throws Exception;
	
}
