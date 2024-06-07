package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.persistence.EnrollProjDAO;

@Service
public class EnrollProjServiceImpl implements EnrollProjService {

	private static final Logger logger = LoggerFactory.getLogger(EnrollProjServiceImpl.class);
	
	@Inject
	private EnrollProjDAO pdao;

	@Override
	public void insertProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) insertProj(vo) 실행 ");
		
		pdao.insertProj(vo);
		
		logger.debug(" (●'◡'●) 프로젝트 등록 성공! (●'◡'●) ");
	}
	
	
}
