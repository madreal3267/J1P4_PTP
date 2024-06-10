package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectVO;

@Repository
public class OfferProjDAOImpl implements OfferProjDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(OfferProjDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.OfferMapper.";

	// 프로젝트 상세내용 조회
	@Override
	public List<ProjectVO> getProj() {
		logger.debug(" DAO : getProj(vo) 호출 (❁´◡`❁) ");
		
		return sqlSession.selectList(NAMESPACE + "getProj");
	}

	// 제안하기
	@Override
	public void insertOffer(ProjectVO vo) {
		
		sqlSession.selectOne(NAMESPACE+"insertOffer", vo);
	}
	
	
	
	
}
