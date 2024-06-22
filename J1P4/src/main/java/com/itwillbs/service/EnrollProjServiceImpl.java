package com.itwillbs.service;

import java.util.List;

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
		
		logger.debug(" (●'◡'●) Service: 프로젝트 등록 성공! (●'◡'●) "+vo);
	}

	// 프로젝트 최초 임시 저장 -> insert문
	@Override
	public boolean saveProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: saveProj(vo) 실행 ");
		
		logger.debug(" (●'◡'●) Service: 프로젝트 임시저장 성공! (●'◡'●) ");

		return pdao.saveProj(vo);

	}
	
	// 프로젝트 기술 등록 또는 최초 임시 저장
	@Override
	public void insertSkill(SkillVO vo) {
		logger.debug(" (●'◡'●) Service: insertSkill(vo) 실행 ");
		
		pdao.insertSkill(vo);
		
		logger.debug(" (●'◡'●) Service: 스킬 등록 성공! (●'◡'●) ");
	}
	
	// 프로젝트 위치 등록 또는 최초 임시 저장
	@Override
	public void insertReg(RegionVO vo) {
		logger.debug(" (●'◡'●) Service: insertReg(vo) 실행 ");
		
		pdao.insertReg(vo);
		
		logger.debug(" (●'◡'●) Service: 지역 등록 성공! (●'◡'●) ");
	}

	// 최초 임시 저장 후 임시저장 또는 등록 -> update문
	@Override
	public void multiSaveProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: multiSaveProj(vo) 실행 ");
		
		pdao.multiSaveProj(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 또 성공! (●'◡'●) ");
		
	}

	// 최초 임시 저장 후 스킬 저장 또는 등록
	@Override
	public void multiSaveSk(SkillVO vo) {
		logger.debug(" (●'◡'●) Service: multiSaveSk(vo) 실행 ");
		
		pdao.multiSaveSk(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 스킬 수정 성공! (●'◡'●) ");
		
	}
	
	
	// 최초 임시 저장 후 지역 저장 또는 등록
	@Override
	public void multiSaveReg(RegionVO vo) {
		logger.debug(" (●'◡'●) Service: multiSaveReg(vo) 실행 ");
		
		pdao.multiSaveReg(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 지역 수정 성공! (●'◡'●) ");
		
	}

	// 임시저장된 프로젝트 불러오기
	@Override
	public ProjectVO getSavedProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: getSavedProj(vo) 실행 ");
		
		logger.debug(" (●'◡'●) Service: 임시 저장 불러오기 성공! (●'◡'●) ");		
		
		return pdao.getSavedProj(vo);
	}

	// 임시저장된 프로젝트의 스킬 불러오기
	@Override
	public List<SkillVO> getSavedSk(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: getSavedSk(vo) 실행 ");
		
		logger.debug(" (●'◡'●) Service: 임시 저장 스킬 불러오기 성공! (●'◡'●) ");		
		
		return pdao.getSavedSk(vo);
	}

	// 임시저장된 프로젝트의 지역 불러오기
	@Override
	public RegionVO getSavedReg(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: getSavedReg(vo) 실행 ");
		
		logger.debug(" (●'◡'●) Service: 임시 저장 지역 불러오기 성공! (●'◡'●) ");		
		
		return pdao.getSavedReg(vo);
	}

	
	// 임시저장된 프로젝트 수정 또는 등록
	@Override
	public void savedProjSave(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: savedProjSave(vo) 실행 ");
		
		pdao.savedProjSave(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 프로젝트 수정 또는 등록 완료! (●'◡'●) ");
	}

	
	// 임시저장된 프로젝트의 스킬 수정 또는 등록 
	@Override
	public void savedSkSave(SkillVO vo) {
		logger.debug(" (●'◡'●) Service: savedSkSave(vo) 실행 ");
		
		pdao.savedSkSave(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 스킬 수정 또는 등록 완료! (●'◡'●) ");
	}

	
	// 임시저장된 프로젝트의 지역 수정 또는 등록
	@Override
	public void savedRegSave(RegionVO vo) {
		logger.debug(" (●'◡'●) Service: savedRegSave(vo) 실행 ");
		
		pdao.savedRegSave(vo);
		
		logger.debug(" (●'◡'●) Service: 임시 저장 지역 수정 또는 등록 완료! (●'◡'●) ");
	}
	
	// 임시저장된 프로젝트를 불러올 때 본인의 프로젝트가 맞는지 확인
	@Override
	public Integer chkProj(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: chkProj(vo) 실행 ");
		
		logger.debug(" (●'◡'●) Service: 본인의 프로젝트가 맞는지 확인 완료! (●'◡'●) ");
		
		return pdao.chkProj(vo);
	}

	// 임시저장된 프로젝트를 불러올 때 임시저장 프로젝트가 맞는지 체크
	@Override
	public Integer chkTemp(ProjectVO vo) {
		logger.debug(" (●'◡'●) Service: chkTemp(vo) 실행 ");
		
		logger.debug(" (●'◡'●) Service: 임시저장 프로젝트가 맞는지 확인 완료! (●'◡'●) ");
		
		return pdao.chkTemp(vo);
	}
	
	
	
}
