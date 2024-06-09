package com.itwillbs.persistence;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

public interface EnrollProjDAO {
	
	// 프로젝트 등록 정보 입력
	public void insertProj(ProjectVO vo);
	
	// 프로젝트 등록 임시 저장
	public void saveProj(ProjectVO vo);
	
	// 임시 저장 프로젝트 수정 후 등록
	public void updateProj(ProjectVO vo);
	
	// 주요 기술 스택
	public void insertSkill(SkillVO vo);
	
	// 클라이언트 위치
	public void insertReg(RegionVO vo);

	
}
