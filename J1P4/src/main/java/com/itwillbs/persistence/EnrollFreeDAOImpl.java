package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.web.EnrollFreeController;

@Repository
public class EnrollFreeDAOImpl implements EnrollFreeDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(EnrollFreeController.class);

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.freelancerMapper.";
	
	// 프리랜서 등록 정보 입력
	@Override
	public void insertFree(FreelancerVO vo) {
		logger.debug(" DAO : insertFree(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE+"insertFree",vo);
		
		logger.debug(" DAO : 프리랜서 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 프리랜서 경력
	@Override
	public void insertCareer(CareerVO vo) {
		logger.debug(" DAO : insertCareer(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE+"insertCareer",vo);
		
		logger.debug(" DAO : 프리랜서 경력 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 프리랜서 보유 자격증
	@Override
	public void insertLicense(LicenseVO vo) {
		logger.debug(" DAO : insertLicense(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE+"insertLicense",vo);
		
		logger.debug(" DAO : 프리랜서 자격증 등록 완료! ╰(*°▽°*)╯ ");
	}

	// 프리랜서 보유 기술
	@Override
	public void insertSkill(SkillVO vo) {
		logger.debug(" DAO : insertSkill(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE+"insertSkill",vo);
		
		logger.debug(" DAO : 프리랜서 기술 등록 완료! ╰(*°▽°*)╯ ");	
	}

	// 프리랜서 희망 지역
	@Override
	public void insertReg(RegionVO vo) {
		logger.debug(" DAO : insertReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE+"insertReg",vo);
		
		logger.debug(" DAO : 프리랜서 희망지역 등록 완료! ╰(*°▽°*)╯ ");
	}
	
	
	
	
}
