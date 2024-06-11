package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.OfferVO;
import com.itwillbs.domain.ProjectVO;

public interface OfferProjDAO {
	
	// 프로젝트 상세내용 조회
	public List<ProjectVO> getProj();
	
	// 제안하기
	public void insertOffer(OfferVO vo);
	
}
