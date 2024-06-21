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
	
	
	// 프로젝트 번호 불러오기
	@Override
	public int getProjNo(String id) {
		logger.debug(" DAO : Proj(vo) 호출 (❁´◡`❁) ");
		return sqlSession.selectOne(NAMESPACE+"getProjNo",id);
	}



	// 프로젝트 최초 임시 저장 -> insert문
	@Override
	public boolean saveProj(ProjectVO vo) {
		logger.debug(" DAO : saveProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "saveProj", vo);
		
		logger.debug(" DAO : 프로젝트 최초 임시저장 완료! ╰(*°▽°*)╯ ");
		
		return false;
	}


	// 프로젝트 기술 최초 임시 저장
	@Override
	public void insertSkill(SkillVO vo) {
		logger.debug(" DAO : insertSkill(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertSkill", vo);
		
		logger.debug(" DAO : 기술스택 최초 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 프로젝트 위치 최초 임시 저장
	@Override
	public void insertReg(RegionVO vo) {
		logger.debug(" DAO : insertReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "insertReg", vo);
		
		logger.debug(" DAO : 지역 최초 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 최초 임시 저장 후 임시저장 또는 등록 -> update문
	@Override
	public void multiSaveProj(ProjectVO vo) {
		logger.debug(" DAO : multiSaveProj(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveProj", vo);
		
		logger.debug(" DAO : 최초 임시 저장 후 수정 완료! ╰(*°▽°*)╯ ");
	}

	// 최초 임시 저장 후 스킬 저장 또는 등록 
	@Override
	public void multiSaveSk(SkillVO vo) {
		logger.debug(" DAO : multiSaveSk(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveSk", vo);
		
		logger.debug(" DAO : 최초 임시 저장 후 스킬 수정 완료! ╰(*°▽°*)╯ ");
		
	}

	// 최초 임시 저장 후 지역 저장 또는 등록 
	@Override
	public void multiSaveReg(RegionVO vo) {
		logger.debug(" DAO : multiSaveReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "multiSaveReg", vo);
		
		logger.debug(" DAO : 최초 임시 저장 후 지역 수정 완료! ╰(*°▽°*)╯ ");
		
	}

	// 임시저장된 프로젝트 불러오기
	@Override
	public ProjectVO saveProjDt(int proj_no) {
		logger.debug(" DAO : saveProjDT(proj_no) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 임시 저장 불러오기 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectOne(NAMESPACE + "saveProjDt", proj_no);

	}

	// 임시저장된 프로젝트의 스킬 불러오기
	@Override
	public List<SkillVO> saveSkDt(int proj_no) {
		logger.debug(" DAO : saveSkDt(proj_no) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 임시 저장 스킬 불러오기 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectList(NAMESPACE + "saveSkDt", proj_no);
	}

	// 임시저장된 프로젝트의 지역 불러오기
	@Override
	public RegionVO saveRegDt(int proj_no) {
		logger.debug(" DAO : saveRegDt(proj_no) 호출 (❁´◡`❁) ");
		
		logger.debug(" DAO : 임시 저장 지역 불러오기 완료! ╰(*°▽°*)╯ ");
		
		return sqlSession.selectOne(NAMESPACE + "saveRegDt", proj_no);
	}

	// 임시저장된 프로젝트 수정 또는 등록
	@Override
	public void saveProjSave(ProjectVO vo) {
		logger.debug(" DAO : saveProjSave(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "saveProjSave", vo);
		
		logger.debug(" DAO : 임시 저장 프로젝트 수정 또는 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 임시저장된 프로젝트의 스킬 수정 또는 등록
	@Override
	public void saveSkSave(SkillVO vo) {
		logger.debug(" DAO : saveSkSave(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "saveSkSave", vo);
		
		logger.debug(" DAO : 임시 저장 스킬 수정 또는 등록 완료! ╰(*°▽°*)╯ ");
	}

	
	// 임시저장된 프로젝트의 지역 수정 또는 등록
	@Override
	public void saveRegSave(RegionVO vo) {
		logger.debug(" DAO : saveRegSave(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE + "saveRegSave", vo);
		
		logger.debug(" DAO : 임시 저장 지역 수정 또는 등록 완료! ╰(*°▽°*)╯ ");
	}
	
	
	
	
	
}
