package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

public interface EnrollProjDAO {
	
	// 프로젝트 등록
	public void insertProj(ProjectVO vo);
	
	// 프로젝트 최초 임시 저장 -> insert문
	public boolean saveProj(ProjectVO vo);
	
	// 프로젝트 기술 등록 또는 최초 임시 저장
	public void insertSkill(SkillVO vo);
	
	// 프로젝트 위치 등록 또는 최초 임시 저장
	public void insertReg(RegionVO vo);
	
	// 최초 임시 저장 후 임시저장 또는 등록 -> update문
	public void multiSaveProj(ProjectVO vo);
	
	// 최초 임시 저장 후 스킬 저장 또는 등록
	public void multiSaveSk(SkillVO vo);
	
	// 최초 임시 저장 후 지역 저장 또는 등록
	public void multiSaveReg(RegionVO vo);
	
	// 임시저장된 프로젝트 불러오기
	public ProjectVO getSavedProj(ProjectVO vo);
	
	// 임시저장된 프로젝트의 스킬 불러오기
	public List<SkillVO> getSavedSk(ProjectVO vo);
	
	// 임시저장된 프로젝트의 지역 불러오기
	public RegionVO getSavedReg(ProjectVO vo);
	
	// 임시저장된 프로젝트 수정 또는 등록
	public void savedProjSave(ProjectVO vo);
	
	// 임시저장된 프로젝트의 스킬 수정 또는 등록
	public void savedSkSave(SkillVO vo);
	
	// 임시저장된 프로젝트의 지역 수정 또는 등록
	public void savedRegSave(RegionVO vo);
	
	// 임시저장된 프로젝트를 불러올 때 본인의 프로젝트가 맞는지 체크
	public Integer chkProj(ProjectVO vo);
	
	// 임시저장된 프로젝트를 불러올 때 임시저장 프로젝트가 맞는지 체크
	public Integer chkTemp(ProjectVO vo);
	
	
}
