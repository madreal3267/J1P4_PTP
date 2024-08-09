package com.itwillbs.persistence;

import java.util.Map;

import com.itwillbs.domain.MemberVO;

public interface AccountDAO {
	
	//폰번호 입력, 수정
	public void phonNo(MemberVO vo);
	
	//현재 비밀번호 맞는지 확인
	public int password(MemberVO vo);
	//비밀번호 조회
	public String pass(String user_id);
	
	//비밀번호 수정
	public void passwordUpdate(MemberVO vo) throws Exception;
	
	//아이디 조회
	public String selectId(String user_id);
	
	
}
