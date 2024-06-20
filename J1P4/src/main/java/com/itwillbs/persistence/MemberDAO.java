package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

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
	
	
	//로그인
	public MemberVO login(MemberVO vo);
	
	//아이디 찾기
	public MemberVO findId(String memberEmail)throws Exception;
	
	//생성된 아이디 체크
	public int findIdCheck(String memberEmail)throws Exception;
	
	//비번 찾기 - 아이디로 가입한 유저가 맞는지 확인
	public void findpw(MemberVO vo) throws Exception;
	
	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	public void chagepw(Map<String, Object> paramMap) throws Exception;
	
	//아이디가 존재하는지 비교
	public MemberVO findUserById(String user_id) throws Exception;
	
	//난수가 존재하는지 비교
	public String findUserByMailKey(String user_email) throws Exception;
	
	//---------------------------------------------------------------------- 가입유형 시작
	
	//프리랜서, 클라이언트
	public void userCf(MemberVO vo) throws Exception;
	
	// 유저타입 - 개인,팀,사업자
	public void userType(MemberVO vo) throws Exception;
	
	//프리랜서 등록여부
	public void insertFree(String free_id) throws Exception;
	//경력
	public void insertCareer(String free_id) throws Exception;
	//자격증
	public void insertLicense(String free_id) throws Exception;
	//협력업체
	public void insertPartners(String free_id) throws Exception;
	//회사연혁
	public void insertComp(String free_id) throws Exception;
	//스킬
	public void insertSkill(String free_id) throws Exception;
	//지역
	public void insertReg(String free_id) throws Exception;
	
	//---------------------------------------------
	
	//클라이언트 등록여부
	public void insertCt(String ct_id) throws Exception; 
	
	
	
	
	
	
	
	
}

