package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.MemberVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.PortfolioVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

public interface MyProfileDAO {
	
	// 프로필 불러오기
	public FreelancerVO getProfile(FreelancerVO vo);
	
	// 스킬 불러오기
	public List<SkillVO> getSkill(FreelancerVO vo);
	
	// 지역 불러오기
	public RegionVO getReg(FreelancerVO vo);
	
	// 경력 불러오기
	public List<CareerVO> getCareer(FreelancerVO vo);
	
	// 자격증 불러오기
	public List<LicenseVO> getLicense(FreelancerVO vo);
	
	// 회사연혁 불러오기
	public List<CompanyVO> getComp(FreelancerVO vo);
	
	// 협력업체 불러오기
	public List<PartnersVO> getPartn(FreelancerVO vo);
	
	// 포트폴리오 불러오기
	public List<PortfolioVO> getPortf(FreelancerVO vo);
	
	// 이름& 프로필 불러오기
	public MemberVO getUser(FreelancerVO vo);
}
