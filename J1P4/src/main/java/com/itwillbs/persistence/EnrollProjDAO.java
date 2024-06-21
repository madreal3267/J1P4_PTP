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
	
	// 프로젝트 기술 최초 임시 저장
	public void insertSkill(SkillVO vo);
	
	// 프로젝트 위치 최초 임시 저장
	public void insertReg(RegionVO vo);
	
	// 최초 임시 저장 후 임시저장 또는 등록 -> update문
	public void multiSaveProj(ProjectVO vo);
	
	// 최초 임시 저장 후 스킬 저장 또는 등록
	public void multiSaveSk(SkillVO vo);
	
	// 최초 임시 저장 후 지역 저장 또는 등록
	public void multiSaveReg(RegionVO vo);
	
	// 임시저장된 프로젝트 불러오기
	public ProjectVO saveProjDt(int proj_no);
	
	// 임시저장된 프로젝트의 스킬 불러오기
	public List<SkillVO> saveSkDt(int proj_no);
	
	// 임시저장된 프로젝트의 지역 불러오기
	public RegionVO saveRegDt(int proj_no);
	
	// 임시저장된 프로젝트 수정 또는 등록
	public void saveProjSave(ProjectVO vo);
	
	// 임시저장된 프로젝트의 스킬 수정 또는 등록
	public void saveSkSave(SkillVO vo);
	
	// 임시저장된 프로젝트의 지역 수정 또는 등록
	public void saveRegSave(RegionVO vo);
	
	
}
