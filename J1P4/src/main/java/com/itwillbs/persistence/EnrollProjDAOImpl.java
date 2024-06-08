package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectVO;

@Repository
public class EnrollProjDAOImpl implements EnrollProjDAO {
	
	

	private static final Logger logger = LoggerFactory.getLogger(EnrollProjDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.ProjectMapper.";
	
	@Override
	public void insertProj(ProjectVO vo) {
		logger.debug(" DAO : insertProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertProj", vo);
		
		logger.debug(" DAO : 프로젝트 등록 완료! ╰(*°▽°*)╯ ");
	}
	
}
