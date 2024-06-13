package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.MemberVO;

public interface MemberService {
	// 컨트롤러에서 처리를 수행하는 추상메서드 작성
	// 실제 동작이 유추가능한 이름 지정
	

	
	//회원가입
	public void join(MemberVO vo);
	
	//아이디 중복 체크
	public int idCheck(String user_id) throws Exception;

	
}
