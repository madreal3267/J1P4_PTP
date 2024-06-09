package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberVO;

public interface MemberService {
	
	public List<MemberVO> findId(String memberEmail)throws Exception;
	
	public int findIdCheck(String memberEmail)throws Exception;
	
}
