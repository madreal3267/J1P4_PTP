package com.itwillbs.service;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

public interface EnrollFreeService {

	// 프리랜서 등록 정보 입력
	public void insertFree(FreelancerVO vo);
	
	// 프리랜서 경력
	public void insertCareer(CareerVO vo);
	
	// 프리랜서 보유 자격증
	public void insertLicense(LicenseVO vo);
	
	// 프리랜서 보유 기술
	public void insertSkill(SkillVO vo);
	
	// 프리랜서 희망 지역
	public void insertReg(RegionVO vo);
	
	// 프리랜서 협력 업체
	public void insertPartners(PartnersVO vo);
	
	// 프리랜서 회사 연혁
	public void insertComp(CompanyVO vo);
	
}
