package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDAO bdao;
	
//	@Override
//	public List<ProjectVO> projList() {
//		logger.debug(" 컨트롤러 -> 서비스 호출 ");
//		logger.debug("  projList() 실행 ");
//		
//		return bdao.projList();
//	}

	@Override
	public int pNum() {
		logger.debug(" 컨트롤러 -> 서비스 호출 ");
		logger.debug(" pNum(ProjectVO nVO) 실행 ");
		
		return bdao.pNum();
	}

	@Override
	public List<ProjectVO> pListPaging(Criteria cri) {
		logger.debug(" pPageList(Criteria cri)) 실행 ");
		
		return bdao.pListPaging(cri);
	}

	@Override
	public List<ProjectVO> pCostDesc(Criteria cri) {
		return bdao.pCostDesc(cri);
	}

	@Override
	public List<ProjectVO> prDateDesc(Criteria cri) {
		return bdao.prDateDesc(cri);
	}

	@Override
	public List<ProjectVO> pDdayDesc(Criteria cri) {
		return bdao.pDdayDesc(cri);
	}
	
	

}
