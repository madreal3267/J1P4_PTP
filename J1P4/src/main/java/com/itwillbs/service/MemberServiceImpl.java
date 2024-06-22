package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.MemberDAO;

/**
 *	서비스는 컨트롤러와 DAO를 연결
 *	=> DAO를 호출
 */
// @Service : 해당 객체를 Service 객체(bean)로 root-context.xml이 인식하도록 설정
@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	// DAO를 호출하기(객체를 생성) => 의존 객체 주입
	// MemberDAO mdao = new MemberDAOImpl(); (직접 생성 X)
	// root-context.xml에 생성되어있는 DAO객체(빈)을 주입
	
	@Inject
	private MemberDAO mdao;


	
	//회원가입
	@Override
	public void join(MemberVO vo) {
		mdao.insert(vo);
		
	}


	
	//아이디 중복 체크
	@Override
	public int idCheck(String user_id) throws Exception {
		int res = mdao.idCheck(user_id);
		logger.debug("res :"+res);

		return res;
		
	}
	
	//---------------------------------------------------------------9번아이디찾기 복사
	
	//로그인
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		
		return mdao.login(vo);
	}
	
	//이메일로 아이디 찾기
	@Override
	public MemberVO findId(String memberEmail) throws Exception {
		
		return mdao.findId(memberEmail);
	}

	
	//이메일 존재여부 카운터로 체크 
	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		
		return mdao.findIdCheck(memberEmail);
	}

	//아이디로 회원이 맞는지 체크
	@Override
	public void findpw(MemberVO vo) throws Exception {
		
		mdao.findpw(vo);
	}

	//비번변경 - 저장된 이메일과 난수를 가진 유저의 비밀번호를 변경 
	@Override
	public void chagepw(Map<String, Object> paramMap)throws Exception {
		mdao.chagepw(paramMap);
			
	}
	
	
	//아이디가 존재하는지 비교
	@Override
	public MemberVO findUserById(String user_id) throws Exception {

		
        return mdao.findUserById(user_id);
	}
	



	//난수가 존재하는지 비교
	@Override
	public String findUserByMailKey(String user_email) throws Exception {
		
		return mdao.findUserByMailKey(user_email);
	}





	
//---------------------------------------------------------------------------------개인유형시작
	
	//프리랜서, 클라이언트 등록
	@Override
	public void userCf(MemberVO vo) throws Exception {
		
		mdao.userCf(vo);
		
	}
	
	
	//개인,팀,사업자 등록
	@Override
	public void userType(MemberVO vo) throws Exception {
		mdao.userType(vo);
		
	}

	//----------------------------------------------------------


	@Override
	public void insertFree(String free_id) throws Exception {
		mdao.insertFree(free_id);
		
	}



	@Override
	public void insertCareer(String free_id) throws Exception {
		mdao.insertCareer(free_id);
		
	}



	@Override
	public void insertLicense(String free_id) throws Exception {
		mdao.insertLicense(free_id);
		
	}



	@Override
	public void insertPartners(String free_id) throws Exception {
		mdao.insertPartners(free_id);
		
	}



	@Override
	public void insertComp(String free_id) throws Exception {
		mdao.insertComp(free_id);
		
	}



	@Override
	public void insertSkill(String free_id) throws Exception {
		mdao.insertSkill(free_id);
		
	}



	@Override
	public void insertReg(String free_id) throws Exception {
		mdao.insertReg(free_id);
		
	}



	@Override
	public void insertCt(String ct_id) throws Exception {
		mdao.insertCt(ct_id);
		
	}



	@Override
	public String sessCf(MemberVO vo) throws Exception {
		return mdao.sessCf(vo);
	}
	
	@Override
	public String sessType(MemberVO vo) throws Exception {
		return mdao.sessType(vo);
	}
	
	
	

	
	
	

	
	
	
	
	
}
