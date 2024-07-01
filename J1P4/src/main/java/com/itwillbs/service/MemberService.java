package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.MemberVO;

public interface MemberService {
	// 컨트롤러에서 처리를 수행하는 추상메서드 작성
	// 실제 동작이 유추가능한 이름 지정
	

	
	//회원가입
	public void join(MemberVO vo);
	
	//아이디 중복 체크
	public int idCheck(String user_id) throws Exception;
	
	//-------------------------------------------------------------9번 아이디찾기 복사
	
	//로그인
	public MemberVO memberLogin(MemberVO vo);
	
	//이메일로 아이디 찾기 
	public MemberVO findId(String memberEmail)throws Exception;
	
	//이메일이 있는지 카운터로 체크 
	public int findIdCheck(String memberEmail)throws Exception;
	
	//비번찾기 - 가입한 유저가 맞는지 확인
	public void findpw(MemberVO vo) throws Exception;
	
//	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
//	public void chagepw(String user_email, String user_pw) throws Exception;
	
	//아이디가 존재하는지 비교
	public MemberVO findUserById(String user_id) throws Exception; 
	
	//난수가 존재하는지 비교
	public String findUserByMailKey(String user_email) throws Exception;
	
	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	public void chagepw(Map<String, Object> paramMap) throws Exception;

//----------------------------------------------------------------------------------
	
	
	//프리랜서, 클라이언트
	public void userCf(MemberVO vo) throws Exception; 
	
	// 유저타입 - 개인,팀,사업자
	public void userType(MemberVO vo) throws Exception;
	
//----------------------------------------------------------------
	
		
		//등록여부
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
		//포트폴리오
		public void insertPort(String free_id) throws Exception;

		//클라이언트 등록여부
		public void insertCt(String ct_id) throws Exception; 
	
		public String sessCf(MemberVO vo) throws Exception;
		public String sessType(MemberVO vo ) throws Exception;
		public Integer sessFreeNo(MemberVO vo) throws Exception;
		public Integer sessCtNo(MemberVO vo) throws Exception;

		
		//회원탈퇴
		public void memberDelete(MemberVO vo) throws Exception;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 신원인증 확인
		public Integer chkIdent(String id);
		public Integer chkIdentB(String id);
		
		public String chkEmail(String email);
	
}