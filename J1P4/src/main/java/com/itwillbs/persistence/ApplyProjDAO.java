package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.SkillVO;

public interface ApplyProjDAO {
	
	// 클라이언트가 요구하는 스킬 출력
	public List<SkillVO> getSkill();

	// 지원하기
	public void insertApply(ApplyVO vo);
	
}
