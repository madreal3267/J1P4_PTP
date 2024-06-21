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
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.persistence.EnrollFreeDAO;

@Service
public class EnrollFreeServiceImpl implements EnrollFreeService {

	private static final Logger logger = LoggerFactory.getLogger(EnrollFreeServiceImpl.class);
	
	@Inject
	private EnrollFreeDAO fdao;
	
	@Override
	public void insertFree(FreelancerVO vo) {
		logger.debug(" (●'◡'●) Service: insertFree(vo) 실행 ");
		
		fdao.insertFree(vo);
		
		logger.debug(" (●'◡'●) Service: 프리랜서 등록 성공! (●'◡'●) ");
	}

	@Override
	public void insertCareer(CareerVO vo) {
		logger.debug(" (●'◡'●) Service: insertCareer(vo) 실행 ");
		
		fdao.insertCareer(vo);
		
		logger.debug(" (●'◡'●) Service: 경력 등록 성공! (●'◡'●) ");
		
	}

	@Override
	public void insertLicense(LicenseVO vo) {
		logger.debug(" (●'◡'●) Service: insertLicense(vo) 실행 ");
		
		fdao.insertLicense(vo);
		
		logger.debug(" (●'◡'●) Service: 자격증 등록 성공! (●'◡'●) ");
		
	}

	@Override
	public void insertSkill(SkillVO vo) {
		logger.debug(" (●'◡'●) Service: insertSkill(vo) 실행 ");
		
		fdao.insertSkill(vo);
		
		logger.debug(" (●'◡'●) Service: 스킬 등록 성공! (●'◡'●) ");
		
	}

	@Override
	public void insertReg(RegionVO vo) {
		logger.debug(" (●'◡'●) Service: insertReg(vo) 실행 ");
		
		fdao.insertReg(vo);
		
		logger.debug(" (●'◡'●) Service: 지역 등록 성공! (●'◡'●) ");
		
	}

	@Override
	public void insertPartners(PartnersVO vo) {
		logger.debug(" (●'◡'●) Service: insertReg(vo) 실행 ");
		
		fdao.insertPartners(vo);
		
		logger.debug(" (●'◡'●) Service: 협력업체 등록 성공! (●'◡'●) ");
		
	}

	@Override
	public void insertComp(CompanyVO vo) {
		logger.debug(" (●'◡'●) Service: insertReg(vo) 실행 ");
		
		fdao.insertComp(vo);
		
		logger.debug(" (●'◡'●) Service: 회사연혁 등록 성공! (●'◡'●) ");
		
	}
	
	
	
	
}

