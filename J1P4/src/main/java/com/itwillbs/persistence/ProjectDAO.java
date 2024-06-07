package com.itwillbs.persistence;

import com.itwillbs.domain.ProjectVO;

public interface ProjectDAO {
	
	// 프로젝트 등록 정보 입력
	public void insertProj(ProjectVO vo);
	
}
