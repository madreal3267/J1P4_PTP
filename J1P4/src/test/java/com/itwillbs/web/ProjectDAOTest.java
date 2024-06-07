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
	
	@Test
	public void testDAO() {
		logger.debug(" DAO TEST : testDAO() 실행 ");
		
		LocalDate ld = null;
		ProjectVO vo = new ProjectVO();
		
		vo.setWork_field("개발");
		vo.setProj_title("한번더 테스트 시도 해봄");
		vo.setProj_progress(1);
		vo.setDeadline(ld.now());
		vo.setStart_date(ld.now());
		vo.setWork_period(18);
		vo.setNo_recruited(100);
		vo.setProj_cost(100000);
		vo.setProj_content("얍");
		
		pdao.insertProj(vo);
		
		logger.debug(" DAO TEST : testDAO() 끝 ");
	}
}
