package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.PortfolioVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.persistence.EnrollFreeDAO;

@Service
public class EnrollFreeServiceImpl implements EnrollFreeService {

	private static final Logger logger = LoggerFactory.getLogger(EnrollFreeServiceImpl.class);
	
	@Inject
	private EnrollFreeDAO fdao;
	
	@Override
	public void updateFree(FreelancerVO vo) {
		logger.debug(" (●'◡'●) Service: updateFree(vo) 실행 ");
		
		fdao.updateFree(vo);
		
		logger.debug(" (●'◡'●) Service: 프리랜서 업데이트 성공! (●'◡'●) ");
	}
	@Override
	public void updateFreeB(FreelancerVO vo) {
		logger.debug(" (●'◡'●) Service: updateFreeB(vo) 실행 ");
		
		fdao.updateFreeB(vo);
		
		logger.debug(" (●'◡'●) Service: 프리랜서 업데이트 성공! (●'◡'●) ");
	}

	@Override
	public void updateCareer(CareerVO vo) {
		logger.debug(" (●'◡'●) Service: updateCareer(vo) 실행 ");
		
		fdao.updateCareer(vo);
		
		logger.debug(" (●'◡'●) Service: 경력 업데이트 성공! (●'◡'●) ");
		
	}

	@Override
	public void updateLicense(LicenseVO vo) {
		logger.debug(" (●'◡'●) Service: updateLicense(vo) 실행 ");
		
		fdao.updateLicense(vo);
		
		logger.debug(" (●'◡'●) Service: 자격증 업데이트 성공! (●'◡'●) ");
		
	}

	@Override
	public void updateSkill(SkillVO vo) {
		logger.debug(" (●'◡'●) Service: updateSkill(vo) 실행 ");
		
		fdao.updateSkill(vo);
		
		logger.debug(" (●'◡'●) Service: 스킬 업데이트 성공! (●'◡'●) ");
		
	}

	@Override
	public void updateReg(RegionVO vo) {
		logger.debug(" (●'◡'●) Service: updateReg(vo) 실행 ");
		
		fdao.updateReg(vo);
		
		logger.debug(" (●'◡'●) Service: 지역 업데이트 성공! (●'◡'●) ");
		
	}

	@Override
	public void updatePartners(PartnersVO vo) {
		logger.debug(" (●'◡'●) Service: updateReg(vo) 실행 ");
		
		fdao.updatePartners(vo);
		
		logger.debug(" (●'◡'●) Service: 협력업체 업데이트 성공! (●'◡'●) ");
		
	}

	@Override
	public void updateComp(CompanyVO vo) {
		logger.debug(" (●'◡'●) Service: updateReg(vo) 실행 ");
		
		fdao.updateComp(vo);
		
		logger.debug(" (●'◡'●) Service: 회사연혁 업데이트 성공! (●'◡'●) ");
		
	}
	@Override
	public void updatePortf(PortfolioVO vo) {
		logger.debug(" (●'◡'●) Service: updatePortf(vo) 실행 ");
		
		fdao.updatePortf(vo);
		
		logger.debug(" (●'◡'●) Service: 포트폴리오 업데이트 성공! (●'◡'●) ");
	}
	
	
	
	
	
}

