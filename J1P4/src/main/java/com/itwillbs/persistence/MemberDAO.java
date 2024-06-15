package com.itwillbs.persistence;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.itwillbs.domain.MemberVO;

/**
 *	 회원에 동작을 처리하는 객체 
 *	 디비 동작에 맞게 이름 지정
 */
public interface MemberDAO {
	
	
	//회원가입
	
	public void insert(MemberVO vo);
	
	//이메일 인증값 저장
	public void updateMailKey(String user_email, String mail_key) throws Exception;

	
	//이메일 인증 후 로그인 허용
	public void updateMailAuth(String user_email) throws Exception;
	
	
	//아이디 중복 체크
	public int idCheck(String user_id) throws Exception;
	
}

