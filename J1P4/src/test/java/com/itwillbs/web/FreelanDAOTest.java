package com.itwillbs.web;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.persistence.EnrollFreeDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class FreelanDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(FreelanDAOTest.class);
	
	@Inject
	private EnrollFreeDAO fdao;
	
//	@Test
	public void 프리랜서등록_테스트() {
		logger.debug(" DAO TEST : 프리랜서등록_테스트() 실행 ");
		
		FreelancerVO vo = new FreelancerVO();
		
		vo.setFree_id("user_100");
		vo.setWork_check(1);
		vo.setWork_date("2024-06-12");
		vo.setProj_cost(100000000);
		vo.setOneline_bio("피곤행");
		vo.setBio("안녕하세요 저는 짱짱 최고 프리랜서입니다");
		vo.setSchool_type("대학원(석사)");
		vo.setSchool_nm("서울대학교");
		vo.setMajor("컴퓨터공학과");
		vo.setEntrance("2020-03-01");
		vo.setGraduation("2024-08-31");
		vo.setGrad_status("졸업");
		
		fdao.insertFree(vo);
		
		logger.debug(" DAO TEST : 프리랜서등록_테스트() 끝 ");
		
	}
	
//	@Test
	public void 경력등록_테스트() {
		logger.debug(" DAO TEST : 경력등록_테스트() 실행 ");
		
		CareerVO vo = new CareerVO();
		
		vo.setCompany_nm("애쁠");
		vo.setJob_lev("시니어");
		vo.setJoin_date("2001-01-01");
		vo.setQuit_date("2020-02-02");
		vo.setResponsibility("개발팀 대빵");
		
		fdao.insertCareer(vo);
		
		logger.debug(" DAO TEST : 경력등록_테스트() 끝 ");
	}
	
//	@Test
	public void 자격증등록_테스트() {
		logger.debug(" DAO TEST : 경력등록_테스트() 실행 ");
			
		LicenseVO vo = new LicenseVO();
		
		vo.setIssuer("한국산업인력공단");
		vo.setLicense_nm("정보처리기사");
		vo.setQualify_date("2024-05-05");
			
		fdao.insertLicense(vo);
		
		logger.debug(" DAO TEST : 경력등록_테스트() 끝 ");
		
	}
	
//	@Test
	public void 스킬등록_테스트() {
		logger.debug(" DAO TEST : 스킬등록_테스트() 실행 ");
		
		SkillVO vo = new SkillVO();
		
		vo.setSkill_nm("자바");
		vo.setSkill_lev("고급");
		
		fdao.insertSkill(vo);
		
		logger.debug(" DAO TEST : 스킬등록_테스트() 끝 ");
	}
	
//	@Test
	public void 지역등록_테스트() {
		logger.debug(" DAO TEST : 지역등록_테스트() 실행 ");
		
		RegionVO vo = new RegionVO();
		
		vo.setRegion("영국");
		vo.setDistrict("런던");
		
		fdao.insertReg(vo);
		
		logger.debug(" DAO TEST : 지역등록_테스트() 끝 ");
	}
	
}
