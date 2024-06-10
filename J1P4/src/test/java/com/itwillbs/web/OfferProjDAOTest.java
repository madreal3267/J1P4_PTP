package com.itwillbs.web;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.persistence.OfferProjDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class OfferProjDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(OfferProjDAOTest.class);
	
	@Inject
	private OfferProjDAO odao;
	
	@Test
	public void getProjTest() {
		logger.debug(" @@@@@@@@@@@@@@@@@@@@@@@@ DAO TEST : getProjTest() 실행 ");
		List<ProjectVO> vo = odao.getProj();
		logger.debug(" @@@@@@@@@@@@@@@@@@@@@@@@ test 결과 : "+vo);
	}
}
