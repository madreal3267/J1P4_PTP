package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.SkillVO;

@Repository
public class ApplyProjDAOImpl implements ApplyProjDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ApplyProjDAOImpl.class);

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.ApplyMapper.";
	
	// 클라이언트가 요구하는 스킬 출력
	@Override
	public List<SkillVO> getSkill() {
		logger.debug(" DAO : getSkill() 호출 (❁´◡`❁) ");
		
		return sqlSession.selectList(NAMESPACE+"getSkill");
	}
	
	// 지원하기
	@Override
	public void insertApply(ApplyVO vo) {
		logger.debug(" DAO : insertApply(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE+"applyProj",vo);
		
	}
	
	
	
}
