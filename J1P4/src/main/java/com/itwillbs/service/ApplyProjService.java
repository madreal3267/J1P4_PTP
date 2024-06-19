package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.SkillVO;

public interface ApplyProjService {
	
	// 스킬 출력
	public List<SkillVO> getSkill();
	
	// 지원하기
	public void insertApply(ApplyVO vo);
}
