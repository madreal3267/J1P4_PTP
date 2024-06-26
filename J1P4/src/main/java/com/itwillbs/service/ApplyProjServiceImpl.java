package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.persistence.ApplyProjDAO;

@Service
public class ApplyProjServiceImpl implements ApplyProjService {
	
	private static final Logger logger = LoggerFactory.getLogger(ApplyProjServiceImpl.class);
	
	@Inject
	private ApplyProjDAO aDao;

	@Override
	public List<SkillVO> getSkill() {
		logger.debug(" (●'◡'●) Service: getSkill() 실행 ");
		return aDao.getSkill();
	}

	@Override
	public void insertApply(ApplyVO vo) {
		logger.debug(" (●'◡'●) Service: insertApply() 실행 ");
		aDao.insertApply(vo);
	}
	
	
}
