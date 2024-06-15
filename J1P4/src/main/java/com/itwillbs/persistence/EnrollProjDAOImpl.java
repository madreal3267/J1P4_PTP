package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

@Repository
public class EnrollProjDAOImpl implements EnrollProjDAO {
	
	

	private static final Logger logger = LoggerFactory.getLogger(EnrollProjDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.ProjectMapper.";
	
	// 프로젝트 등록 정보 입력
	@Override
	public void insertProj(ProjectVO vo) {
		logger.debug(" DAO : insertProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertProj", vo);
		
		logger.debug(" DAO : 프로젝트 등록 완료! ╰(*°▽°*)╯ ");
	}
	
	// 프로젝트 등록 임시 저장
	@Override
	public boolean saveProj(ProjectVO vo) {
		logger.debug(" DAO : saveProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "saveProj", vo);
		
		logger.debug(" DAO : 프로젝트 임시저장 완료! ╰(*°▽°*)╯ ");
		
		return false;
	}

	// 임시 저장 프로젝트 수정 후 등록
	@Override
	public void updateProj(ProjectVO vo) {
		logger.debug(" DAO : updateProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "updateProj", vo);
		
		logger.debug(" DAO : 임시저장 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 주요 기술 스택
	@Override
	public void insertSkill(SkillVO vo) {
		logger.debug(" DAO : insertSkill(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertSkill", vo);
		
		logger.debug(" DAO : 기술스택 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 클라이언트 위치
	@Override
	public void insertReg(RegionVO vo) {
		logger.debug(" DAO : insertReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertReg", vo);
		
		logger.debug(" DAO : 지역 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 최초 임시 저장 후 임시저장
	@Override
	public void multiSaveProj(ProjectVO vo) {
		logger.debug(" DAO : multiSaveProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveProj", vo);
		
		logger.debug(" DAO : 임시 저장 수정 완료! ╰(*°▽°*)╯ ");
	}

	// 최초 임시 저장 후 스킬저장
	@Override
	public void multiSaveSk(SkillVO vo) {
		logger.debug(" DAO : multiSaveSk(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveSk", vo);
		
		logger.debug(" DAO : 임시 저장 스킬 수정 완료! ╰(*°▽°*)╯ ");
		
	}

	// 최초 임시 저장 후 지역저장
	@Override
	public void multiSaveReg(RegionVO vo) {
		logger.debug(" DAO : multiSaveReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveReg", vo);
		
		logger.debug(" DAO : 임시 저장 지역 수정 완료! ╰(*°▽°*)╯ ");
		
	}

	
	
	
	
	
	
	
	
}
