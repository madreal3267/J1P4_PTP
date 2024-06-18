package com.itwillbs.persistence;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

public interface EnrollProjDAO {
	
	// 프로젝트 등록 정보 입력
	public void insertProj(ProjectVO vo);
	
	// 프로젝트 등록 최초 임시 저장
	public boolean saveProj(ProjectVO vo);
	
	// 주요 기술 스택
	public void insertSkill(SkillVO vo);
	
	// 클라이언트 위치
	public void insertReg(RegionVO vo);
	
	// 최초 임시 저장 후 임시저장
	public void multiSaveProj(ProjectVO vo);
	
	// 최초 임시 저장 후 스킬저장
	public void multiSaveSk(SkillVO vo);
	
	// 최초 임시 저장 후 지역저장
	public void multiSaveReg(RegionVO vo);
	
	
}
