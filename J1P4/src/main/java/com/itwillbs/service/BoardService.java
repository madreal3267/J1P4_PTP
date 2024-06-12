package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.ProjectVO;

public interface BoardService {
	
	// 프로젝트 목록
//	public List<ProjectVO> projList();
	
	// 프로젝트 갯수 출력
	public int pNum();
	
	// 목록 페이징
	public List<ProjectVO> pListPaging(Criteria cri);
	
	// 프로젝트 정렬
	public List<ProjectVO> pCostDesc(Criteria cri);
	public List<ProjectVO> prDateDesc(Criteria cri);
	public List<ProjectVO> pDdayDesc(Criteria cri);
	
	//프로젝트 필터
	public List<ProjectVO> proSort(Criteria cri);
	public List<ProjectVO> proLSort(Criteria cri);
	
	// 북마크 등록
	
	// 북마크 삭제

}
