package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.ProjectVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.BoardMapper.";
	
//	@Override
//	public List<ProjectVO> projList() {
//		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"projList");
//		return resultVO;
//	}

	@Override
	public int pNum() {
		int result = sqlSession.selectOne(NAMESPACE+"pNum");
		return result;
	}

	@Override
	public List<ProjectVO> pListPaging(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"pListPaging",cri);
		return resultVO;
	}
	
	@Override
	public List<ProjectVO> pCostDesc(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"pCost",cri);
		return null;
	}

	@Override
	public List<ProjectVO> prDateDesc(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"prDate",cri);
		return null;
	}

	@Override
	public List<ProjectVO> pDdayDesc(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"pDday",cri);
		return null;
	}

	@Override
	public List<ProjectVO> proSort(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"proSort",cri);
		return null;
	}

	@Override
	public List<ProjectVO> proLSort(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"proLSort",cri);
		return resultVO;
	}

	
	

}
