package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.MemberVO;


/**
 *	 회원에 동작을 처리하는 객체 
 *	 디비 동작에 맞게 이름 지정
 */

public interface MemberDAO {
	
	public List<MemberVO> findId(String memberEmail)throws Exception;
	
	public int findIdCheck(String memberEmail)throws Exception;
	
}
