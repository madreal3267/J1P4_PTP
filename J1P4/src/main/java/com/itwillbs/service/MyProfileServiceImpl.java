package com.itwillbs.service;

import java.util.List;

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
import com.itwillbs.persistence.MyProfileDAO;

@Service
public class MyProfileServiceImpl implements MyProfileService {
	
	private static final Logger logger = LoggerFactory.getLogger(MyProfileServiceImpl.class);
	
	@Inject
	private MyProfileDAO mDAO;

	// 프로필 불러오기
	@Override
	public FreelancerVO getProfile(FreelancerVO vo) {
		return mDAO.getProfile(vo);
	}

	@Override
	public List<SkillVO> getSkill(FreelancerVO vo) {
		return mDAO.getSkill(vo);
	}

	@Override
	public RegionVO getReg(FreelancerVO vo) {
		return mDAO.getReg(vo);
	}

	@Override
	public List<CareerVO> getCareer(FreelancerVO vo) {
		return mDAO.getCareer(vo);
	}

	@Override
	public List<LicenseVO> getLicense(FreelancerVO vo) {
		return mDAO.getLicense(vo);
	}

	@Override
	public List<CompanyVO> getComp(FreelancerVO vo) {
		return mDAO.getComp(vo);
	}

	@Override
	public List<PartnersVO> getPartn(FreelancerVO vo) {
		return mDAO.getPartn(vo);
	}

	@Override
	public List<PortfolioVO> getPortf(FreelancerVO vo) {
		return mDAO.getPortf(vo);
	}

	
	

}
