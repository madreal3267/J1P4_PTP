package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.MemberVO;


/**
 *	 회원에 동작을 처리하는 객체 
 *	 디비 동작에 맞게 이름 지정
 */

public interface MemberDAO {
	//로그인
	public MemberVO login(MemberVO vo);
	
	//아이디 찾기
	public MemberVO findId(String memberEmail)throws Exception;
	
	//생성된 아이디 체크
	public int findIdCheck(String memberEmail)throws Exception;
	
	//비번 찾기 - 가입한 유저가 맞는지 확인
	public void findpw(MemberVO vo) throws Exception;
	
	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	public void chagepw(MemberVO vo) throws Exception; 
	
	
	
	
	
}
