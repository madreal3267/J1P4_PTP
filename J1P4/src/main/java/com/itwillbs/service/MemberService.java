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
	
	//비번찾기 - 가입한 유저가 맞는지 확인
	public void findpw(MemberVO vo) throws Exception;
	
	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	public void chagepw(MemberVO vo) throws Exception;
	
	//아이디가 존재하는지 비교
	public MemberVO findUserById(String user_id) throws Exception; 
	
	//난수가 존재하는지 비교
	public MemberVO findUserByMailKey(String mail_key) throws Exception; 
	
}
