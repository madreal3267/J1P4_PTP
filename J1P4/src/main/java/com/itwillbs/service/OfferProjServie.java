package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ProjectVO;

public interface OfferProjServie {
	// 프로젝트 상세내용 조회
	public List<ProjectVO> getProj();
	
	// 제안하기
	public void insertOffer(ProjectVO vo);
}
