package com.itwillbs.service;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

public interface EnrollProjService {
	
	// 프로젝트 등록
	public void insertProj(ProjectVO vo);
	
	// 프로젝트 최초 임시저장
	public boolean saveProj(ProjectVO vo);
	
	// 스킬 등록 또는 임시저장
	public void insertSkill(SkillVO vo);
	
	// 지역 등록 또는 임시저장
	public void insertReg(RegionVO vo);
	
	// 프로젝트 최초 임시저장 후 임시저장
	public void multiSaveProj(ProjectVO vo);
	
	// 프로젝트 최초 임시저장 후 스킬 임시저장 또는 등록
	public void multiSaveSk(SkillVO vo);
	
	// 프로젝트 최초 임시저장 후 지역 임시저장 또는 등록
	public void multiSaveReg(RegionVO vo);

}
