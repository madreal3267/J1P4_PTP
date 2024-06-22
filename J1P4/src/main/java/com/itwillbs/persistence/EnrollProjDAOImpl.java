package com.itwillbs.persistence;

import java.util.List;

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
	
	// 프로젝트 등록
	@Override
	public void insertProj(ProjectVO vo) {
		logger.debug(" DAO : insertProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertProj", vo);
		
		logger.debug(" DAO : 프로젝트 등록 완료! ╰(*°▽°*)╯ ");
	}


	// 프로젝트 최초 임시 저장 -> insert문
	@Override
	public boolean saveProj(ProjectVO vo) {
		logger.debug(" DAO : saveProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "saveProj", vo);
		
		logger.debug(" DAO : 프로젝트 최초 임시저장 완료! ╰(*°▽°*)╯ ");
		
		return false;
	}

	// 프로젝트 기술 등록 또는 최초 임시 저장
	@Override
	public void insertSkill(SkillVO vo) {
		logger.debug(" DAO : insertSkill(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertSkill", vo);
		
		logger.debug(" DAO : 기술스택 등록 또는 최초 임시저장 완료! ╰(*°▽°*)╯ ");
	}

	// 프로젝트 위치 최초 임시 저장
	@Override
	public void insertReg(RegionVO vo) {
		logger.debug(" DAO : insertReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertReg", vo);
		
		logger.debug(" DAO : 지역 등록 또는 최초 임시저장 완료! ╰(*°▽°*)╯ ");
	}

	// 최초 임시 저장 후 임시저장 또는 등록 -> update문
	@Override
	public void multiSaveProj(ProjectVO vo) {
		logger.debug(" DAO : multiSaveProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveProj", vo);
		
		logger.debug(" DAO : 최초 임시 저장 후 임시저장 또는 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 최초 임시 저장 후 스킬 저장 또는 등록 
	@Override
	public void multiSaveSk(SkillVO vo) {
		logger.debug(" DAO : multiSaveSk(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveSk", vo);
		
		logger.debug(" DAO : 최초 임시 저장 후 스킬 임시저장 또는 등록 완료! ╰(*°▽°*)╯ ");
		
	}

	// 최초 임시 저장 후 지역 저장 또는 등록 
	@Override
	public void multiSaveReg(RegionVO vo) {
		logger.debug(" DAO : multiSaveReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveReg", vo);
		
		logger.debug(" DAO : 최초 임시 저장 후 지역 임시저장 또는 등록 완료! ╰(*°▽°*)╯ ");
		
	}

	// 임시저장된 프로젝트 불러오기
	@Override
	public ProjectVO getSavedProj(ProjectVO vo) {
		logger.debug(" DAO : getSavedProj(vo) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 임시 저장 불러오기 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectOne(NAMESPACE + "getSavedProj", vo);

	}

	// 임시저장된 프로젝트의 스킬 불러오기
	@Override
	public List<SkillVO> getSavedSk(ProjectVO vo) {
		logger.debug(" DAO : getSavedSk(vo) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 임시 저장 스킬 불러오기 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectList(NAMESPACE + "getSavedSk", vo);
	}

	// 임시저장된 프로젝트의 지역 불러오기
	@Override
	public RegionVO getSavedReg(ProjectVO vo) {
		logger.debug(" DAO : getSavedReg(vo) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 임시 저장 지역 불러오기 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectOne(NAMESPACE + "getSavedReg", vo);
	}

	// 임시저장된 프로젝트 수정 또는 등록
	@Override
	public void savedProjSave(ProjectVO vo) {
		logger.debug(" DAO : savedProjSave(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "savedProjSave", vo);
		
		logger.debug(" DAO : 임시 저장 프로젝트 수정 또는 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 임시저장된 프로젝트의 스킬 수정 또는 등록
	@Override
	public void savedSkSave(SkillVO vo) {
		logger.debug(" DAO : savedSkSave(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "savedSkSave", vo);
		
		logger.debug(" DAO : 임시 저장 스킬 수정 또는 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 임시저장된 프로젝트의 지역 수정 또는 등록
	@Override
	public void savedRegSave(RegionVO vo) {
		logger.debug(" DAO : saveRegSave(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "savedRegSave", vo);
		
		logger.debug(" DAO : 임시 저장 지역 수정 또는 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 임시저장된 프로젝트를 불러올 때 본인의 프로젝트가 맞는지 확인
	@Override
	public Integer chkProj(ProjectVO vo) {
		logger.debug(" DAO : chkProj(vo) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 본인의 프로젝트가 맞는지 확인 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectOne(NAMESPACE+"chkProj",vo);
	}


	// 임시저장된 프로젝트를 불러올 때 임시저장 프로젝트가 맞는지 체크
	@Override
	public Integer chkTemp(ProjectVO vo) {
		logger.debug(" DAO : chkTemp(vo) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 임시저장 프로젝트가 맞는지 확인 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectOne(NAMESPACE+"chkTemp",vo);
	}
	
	
	
}
