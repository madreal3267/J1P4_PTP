package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FreelancerVO;
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
		logger.debug(" 컨트롤러 -> 서비스 호출 확인중11111");
		logger.debug(" pNum(ProjectVO nVO) 실행 ");
		
		return bdao.pNum();
	}

	@Override
	public List<ProjectVO> pListPaging(Criteria cri) {
		logger.debug(" pPageList(Criteria cri)) 실행 ");
		
		return bdao.pListPaging(cri);
	}


	@Override
	public List<ProjectVO> proLSort(Criteria cri) {
		logger.debug("ghkgdfdsf");
		return bdao.proLSort(cri);
	}

	@Override
	public List<ProjectVO> proFi(Criteria cri) {
		return bdao.proFi(cri);
	}

	@Override
	public int fiNum(ProjectVO vo) {
		return bdao.fiNum(vo);
	}

	@Override
	public ProjectVO dePro(int proj_no) {
		return bdao.dePro(proj_no);
	}

	@Override
	public List<FreelancerVO> fListPaging(Criteria cri) {
		logger.debug(" fPageList(Criteria cri)) 실행 ");
		
		return bdao.fListPaging(cri);
	}

	@Override
	public int fNum() {
		return bdao.fNum();
	}
	
	
	
	
	
	
	
	

}
