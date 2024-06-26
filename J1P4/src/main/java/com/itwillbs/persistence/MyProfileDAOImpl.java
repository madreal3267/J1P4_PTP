package com.itwillbs.persistence;

import java.util.List;

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
import com.itwillbs.domain.PortfolioVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

@Repository
public class MyProfileDAOImpl implements MyProfileDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(MyProfileDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.myProfileMapper.";
	
	// 프로필 불러오기
	@Override
	public FreelancerVO getProfile(FreelancerVO vo) {
		return sqlSession.selectOne(NAMESPACE+"getProfile",vo);
	}

	@Override
	public List<SkillVO> getSkill(FreelancerVO vo) {
		return sqlSession.selectList(NAMESPACE+"getSkill",vo);
	}

	@Override
	public RegionVO getReg(FreelancerVO vo) {
		return sqlSession.selectOne(NAMESPACE+"getReg",vo);
	}

	@Override
	public List<CareerVO> getCareer(FreelancerVO vo) {
		return sqlSession.selectList(NAMESPACE+"getCareer",vo);
	}

	@Override
	public List<LicenseVO> getLicense(FreelancerVO vo) {
		return sqlSession.selectList(NAMESPACE+"getLicense",vo);
	}

	@Override
	public List<CompanyVO> getComp(FreelancerVO vo) {
		return sqlSession.selectList(NAMESPACE+"getComp",vo);
	}

	@Override
	public List<PartnersVO> getPartn(FreelancerVO vo) {
		return sqlSession.selectList(NAMESPACE+"getPartn",vo);
	}

	@Override
	public List<PortfolioVO> getPortf(FreelancerVO vo) {
		return sqlSession.selectList(NAMESPACE+"getPortf",vo);
	}
	
	
	
	
	
	
	

}
