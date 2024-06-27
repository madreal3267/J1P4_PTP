package com.itwillbs.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberVO;

/**
 * MemberDAO 인터페이스를 구현한 객체 => 기존의 DAO객체의 동작 수행
 */

//@Repository : 스프링이 해당파일을 DAO(bean)로 인식하도록 설정

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);

	// 공용변수,디비연결,자원해제 동작 선언 => 기존코드

	// root-context.xml (스프링)에서 필요한 기능을 하는 객체를 주입
	@Inject
	private SqlSession sqlSession; //SqlSession객체는 인터페이스를 생성하지 않는다.

	private static final String NAMESPACE 
	               = "com.itwillbs.mapper.MemberMapper.";
	



	//회원가입
	@Override
	public void insert(MemberVO vo) {
		
		sqlSession.insert(NAMESPACE+"join", vo);
		
	}



	//이메일 인증값 저장
	@Override
	public void updateMailKey(String user_email, String mail_key) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_email", user_email);
		map.put("mail_key", mail_key);
		
		sqlSession.selectOne(NAMESPACE+"updateMailKey", map);
		
	}


	//이메일 인증 후 로그인 허용
	@Override
	public void updateMailAuth(String user_email) throws Exception {
		sqlSession.update(NAMESPACE+"updateMailAuth", user_email);
	}



	//아이디 중복체크
	@Override
	public int idCheck(String user_id) throws Exception {
		int res = sqlSession.selectOne(NAMESPACE+"selectId", user_id);
		logger.debug("res :"+res);

		return res;
	}

//------------------------------------------------------------------------------
	//9번 아이디찾기브랜치 복사
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		
		return sqlSession.selectOne(NAMESPACE+"memberLogin", vo);
		
	}
	
	//아이디에 pk 
	@Override
	public MemberVO findId(String memberEmail) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findId", memberEmail);
	}

	
	//입력된 이메일의 아이디 존재여부 확인->있으면 1 반환, 없으면 0반환
	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findIdCheck", memberEmail);
	}

	// 비번 - 가입한 유저가 맞는지 -> 맞으면 난수 생성 디비저장
	@Override
	public void findpw(MemberVO vo) throws Exception {
		sqlSession.update(NAMESPACE+"mailkey", vo);
	}
	

	
	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	@Override
	public void chagepw(Map<String, Object> paramMap) throws Exception {
		sqlSession.update(NAMESPACE+"mailkey2", paramMap);
		
	}
	
	
	
	
	
	//아이디가 존재하는지 비교
	@Override
	public MemberVO findUserById(String user_id) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findUserById", user_id);
	
	}
	



	//난수가 존재하는지 비교
	@Override
	public String findUserByMailKey(String user_email) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"findUserByMailKey", user_email);
	}





	

//-------------------------------------------------------------------------------회원유형시작
	//프리랜서, 클라이언트
	@Override
	public void userCf(MemberVO vo) throws Exception {
		
		 sqlSession.update(NAMESPACE+"userCf", vo);
		
	}
	
	
	//개인, 팀, 사업자
	@Override
	public void userType(MemberVO vo) throws Exception {
		sqlSession.update(NAMESPACE+"userType", vo);
			
	}


	//-------------------------------------------------------

	@Override
	public void insertFree(String free_id) throws Exception {
		sqlSession.insert(NAMESPACE+"freelancerId", free_id);
		
	}



	@Override
	public void insertCareer(String free_id) throws Exception {
		sqlSession.insert(NAMESPACE+"insertCareer", free_id);
		
	}



	@Override
	public void insertLicense(String free_id) throws Exception {
		sqlSession.insert(NAMESPACE+"insertLicense", free_id);
		
	}



	@Override
	public void insertPartners(String free_id) throws Exception {
		sqlSession.insert(NAMESPACE+"insertPartners", free_id);
		
	}



	@Override
	public void insertComp(String free_id) throws Exception {
		sqlSession.insert(NAMESPACE+"insertComp", free_id);
		
	}



	@Override
	public void insertSkill(String free_id) throws Exception {
		sqlSession.insert(NAMESPACE+"insertSkill", free_id);
		
	}



	@Override
	public void insertReg(String free_id) throws Exception {
		sqlSession.insert(NAMESPACE+"insertReg", free_id);
		
	}



	@Override
	public void insertCt(String ct_id) throws Exception {
		sqlSession.insert(NAMESPACE+"clientId", ct_id);
		
	}


	
	
	@Override
	public String sessCf(MemberVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"sessCf",vo);
	}
	
	@Override
	public String sessType(MemberVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"sessType",vo);
	}



	//회원탈퇴
	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		sqlSession.delete(NAMESPACE+"memberDelete", vo);
	}
	@Override
	public Integer sessFreeNo(MemberVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"sessFreeNo",vo);
	}



	@Override
	public Integer sessCtNo(MemberVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"sessCtNo",vo);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public String chkEmail(String email) {
		return sqlSession.selectOne(NAMESPACE+"chkEmail",email);
	}



	@Override
	public Integer chkIdent(String id) {
		return sqlSession.selectOne(NAMESPACE+"chkIdent",id);
	}



	@Override
	public Integer chkIdentB(String id) {
		return sqlSession.selectOne(NAMESPACE+"chkIdentB",id);
	}
	
	
	
	
	
	
	

	

	
	

}// MemberDAOImpl 끝
