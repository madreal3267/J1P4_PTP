package com.itwillbs.persistence;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.PortfolioVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

public interface EnrollFreeDAO {
	
	// 프리랜서 등록 정보 입력
	public void updateFree(FreelancerVO vo);
	public void updateFreeB(FreelancerVO vo);
	
	// 프리랜서 경력
	public void updateCareer(CareerVO vo);
	
	// 프리랜서 보유 자격증
	public void updateLicense(LicenseVO vo);
	
	// 프리랜서 보유 기술
	public void updateSkill(SkillVO vo);
	
	// 프리랜서 희망 지역
	public void updateReg(RegionVO vo);
	
	// 프리랜서 협력 업체
	public void updatePartners(PartnersVO vo);
	
	// 프리랜서 회사 연혁
	public void updateComp(CompanyVO vo);
	
	// 프리랜서 포트폴리오
	public void updatePortf(PortfolioVO vo);
}	