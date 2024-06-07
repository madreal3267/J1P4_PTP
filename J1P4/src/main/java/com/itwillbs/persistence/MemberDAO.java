package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.MemberVO;

/**
 *	 회원에 동작을 처리하는 객체 
 *	 디비 동작에 맞게 이름 지정
 */
public interface MemberDAO {
	
	// 테스트
	public void insertTest(MemberVO vo);
	
	//회원가입
	
	public void insert(MemberVO vo);
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	
	
	
}
