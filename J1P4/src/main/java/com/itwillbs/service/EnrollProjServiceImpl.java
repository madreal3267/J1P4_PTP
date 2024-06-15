package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.persistence.EnrollProjDAO;

@Service
public class EnrollProjServiceImpl implements EnrollProjService {

	private static final Logger logger = LoggerFactory.getLogger(EnrollProjServiceImpl.class);
	
	@Inject
	private EnrollProjDAO pdao;
	
	// 프로젝트 등록
	@Override
	public void insertProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: insertProj(vo) 실행 ");
		
		pdao.insertProj(vo);
		
		logger.debug(" (●'◡'●) Service: 프로젝트 등록 성공! (●'◡'●) ");
	}

	// 프로젝트 임시저장
	@Override
	public boolean saveProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: saveProj(vo) 실행 ");
		
		logger.debug(" (●'◡'●) Service: 프로젝트 임시저장 성공! (●'◡'●) ");

		return pdao.saveProj(vo);
		

	// 스킬 등록
	}
	@Override
	public void insertSkill(SkillVO vo) {
		logger.debug(" (●'◡'●) Service: insertSkill(vo) 실행 ");
		
		pdao.insertSkill(vo);
		
		logger.debug(" (●'◡'●) Service: 스킬 등록 성공! (●'◡'●) ");
	}
	
	// 지역 등록
	@Override
	public void insertReg(RegionVO vo) {
		logger.debug(" (●'◡'●) Service: insertReg(vo) 실행 ");
		
		pdao.insertReg(vo);
		
		logger.debug(" (●'◡'●) Service: 지역 등록 성공! (●'◡'●) ");
	}

	// 프로젝트 임시저장 여러번
	@Override
	public void multiSaveProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: multiSaveProj(vo) 실행 ");
		
		pdao.multiSaveProj(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 또 성공! (●'◡'●) ");
		
	}

	// 임시저장 후 스킬 수정
	@Override
	public void multiSaveSk(SkillVO vo) {
		logger.debug(" (●'◡'●) Service: multiSaveSk(vo) 실행 ");
		
		pdao.multiSaveSk(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 스킬 수정 성공! (●'◡'●) ");
		
		
	}
	
	
	// 임시저장 후 지역 수정
	@Override
	public void multiSaveReg(RegionVO vo) {
		logger.debug(" (●'◡'●) Service: multiSaveReg(vo) 실행 ");
		
		pdao.multiSaveReg(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 지역 수정 성공! (●'◡'●) ");
		
	}	
	
	
}
