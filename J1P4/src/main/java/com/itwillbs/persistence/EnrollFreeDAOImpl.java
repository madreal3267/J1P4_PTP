package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.PartnersVO;
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
	public void updateFree(FreelancerVO vo) {
		logger.debug(" DAO : updateFree(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updateFree",vo);
		
		logger.debug(" DAO : 프리랜서 업데이트 완료! ╰(*°▽°*)╯ ");
	}
	
	@Override
	public void updateFreeB(FreelancerVO vo) {
		logger.debug(" DAO : updateFreeB(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updateFreeB",vo);
		
		logger.debug(" DAO : 프리랜서 업데이트 완료! ╰(*°▽°*)╯ ");
	}

	// 프리랜서 경력
	@Override
	public void updateCareer(CareerVO vo) {
		logger.debug(" DAO : updateCareer(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updateCareer",vo);
		
		logger.debug(" DAO : 프리랜서 경력 업데이트 완료! ╰(*°▽°*)╯ ");
	}

	// 프리랜서 보유 자격증
	@Override
	public void updateLicense(LicenseVO vo) {
		logger.debug(" DAO : updateLicense(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updateLicense",vo);
		
		logger.debug(" DAO : 프리랜서 자격증 업데이트 완료! ╰(*°▽°*)╯ ");
	}

	// 프리랜서 보유 기술
	@Override
	public void updateSkill(SkillVO vo) {
		logger.debug(" DAO : updateSkill(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updateSkill",vo);
		
		logger.debug(" DAO : 프리랜서 기술 업데이트 완료! ╰(*°▽°*)╯ ");	
	}

	// 프리랜서 희망 지역
	@Override
	public void updateReg(RegionVO vo) {
		logger.debug(" DAO : updateReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updateReg",vo);
		
		logger.debug(" DAO : 프리랜서 희망지역 업데이트 완료! ╰(*°▽°*)╯ ");
	}
	
	// 프리랜서 협력 업체
	@Override
	public void updatePartners(PartnersVO vo) {
		logger.debug(" DAO : updateReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updatePartners",vo);
		
		logger.debug(" DAO : 프리랜서 협력업체 업데이트 완료! ╰(*°▽°*)╯ ");		
	}
	
	// 프리랜서 회사 연혁
	@Override
	public void updateComp(CompanyVO vo) {
		logger.debug(" DAO : updateReg(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.update(NAMESPACE+"updateComp",vo);
		
		logger.debug(" DAO : 프리랜서 회사연혁 업데이트 완료! ╰(*°▽°*)╯ ");				
	}
	
	
	
	
}
