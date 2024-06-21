package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FreelancerVO;
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
	public List<ProjectVO> proLSort(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"proLSort",cri);
		return resultVO;
	}

	@Override
	public List<ProjectVO> proFi(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"proFi",cri);
		return resultVO;
	}

	@Override
	public int fiNum(ProjectVO vo) {
		int result = sqlSession.selectOne(NAMESPACE+"fiNum",vo);
		return result;
	}

	@Override
	public ProjectVO dePro(int proj_no) {
		return sqlSession.selectOne(NAMESPACE+"dePro",proj_no);
	}

	@Override
	public ProjectVO dePro(ProjectVO vo) {
		return sqlSession.selectOne(NAMESPACE+"dePro",vo);
	}

	@Override
	public List<FreelancerVO> fListPaging(Criteria cri) {
		List<FreelancerVO> resultVO = sqlSession.selectList(NAMESPACE+"fListPaging",cri);
		return resultVO;
	}

	@Override
	public int fNum() {
		int result = sqlSession.selectOne(NAMESPACE+"fNum");
		return result;
	}

	
	

}
