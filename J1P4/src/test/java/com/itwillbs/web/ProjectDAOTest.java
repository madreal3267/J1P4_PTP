package com.itwillbs.web;

import java.time.LocalDate;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.persistence.EnrollProjDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
		locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"}
		)
public class ProjectDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectDAOTest.class);
	
	@Inject
	private EnrollProjDAO pdao;
	
//	@Test
	public void testDAO() {
		logger.debug(" DAO TEST : testDAO() 실행 ");
		
//		LocalDate ld = null;
		ProjectVO vo = new ProjectVO();
		
		vo.setWork_field("개발");
		vo.setProj_title("한번더 테스트 시도 해봄");
		vo.setProj_progress(1);
//		vo.setDeadline(ld.now());
//		vo.setStart_date(ld.now());
		vo.setWork_period(18);
		vo.setNo_recruited(100);
		vo.setProj_cost(100000);
		vo.setProj_content("얍");
		
		pdao.insertProj(vo);
		
		logger.debug(" DAO TEST : testDAO() 끝 ");
	}
	
//	@Test
	public void updateTest() {
		logger.debug(" DAO TEST : updateTest() 실행 ");
		ProjectVO uVO = new ProjectVO();
		
		uVO.setProj_no(51);
		uVO.setDate_nego(1);
		uVO.setProj_title("update 쿼리 테스트 중");
		uVO.setWork_field("퍼블리싱");
		
		pdao.updateProj(uVO);
		
		logger.debug(" DAO TEST : updateTest() 끝 ");
	}
	
//	@Test
	public void skillTest() {
		logger.debug(" DAO TEST : skillTest() 실행 ");
		SkillVO sVO = new SkillVO();
		
		sVO.setSkill_nm("테스트");
		sVO.setSkill_lev("뷁");
		
		pdao.insertSkill(sVO);
		
		logger.debug(" DAO TEST : skillTest() 끝 ");
	}
	
//	@Test
	public void regionTest() {
		logger.debug(" DAO TEST : regionTest() 실행 ");
		
		RegionVO rVO = new RegionVO();
		
		rVO.setRegion("부산");
		rVO.setDistrict("연제구");
		
		pdao.insertReg(rVO);
		
		logger.debug(" DAO TEST : regionTest() 끝 ");
		
	}
	@Test
	public void 임시저장() {
		logger.debug(" DAO TEST : 임시저장() 실행 ");
		
		ProjectVO vo = new ProjectVO();
		vo.setUser_id("user_10");
		vo.setProj_no(118);
		vo.setWork_field("디자인");
		
		pdao.multiSaveProj(vo);
		
		logger.debug(" DAO TEST : 임시저장() 끝 ");
	}

}
