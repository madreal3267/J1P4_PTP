package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.BMarkVO;
import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.EvaluateProjectDTO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.MemberVO;
import com.itwillbs.domain.OfferVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.PortfolioVO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.BoardMapper.";
	
//	@Override
//	public List<ProjectVO> projList() {
//		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"projList");
//		return resultVO;
//	}

	@Override
	public int pNum() {
		int result = sqlSession.selectOne(NAMESPACE+"pNum");
		return result;
	}

	@Override
	public List<ProjectVO> pListPaging(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"pListPaging",cri);
		return resultVO;
	}
	

	@Override
	public List<ProjectVO> proLSort(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"proLSort",cri);
		return resultVO;
	}

	@Override
	public List<ProjectVO> proLSortD(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"proLSortD",cri);
		return resultVO;
	}

	@Override
	public List<ProjectVO> proFi(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"proFi",cri);
		return resultVO;
	}

	@Override
	public int fiNum(ProjectVO vo) {
		int result = sqlSession.selectOne(NAMESPACE+"fiNum",vo);
		return result;
	}

	@Override
	public ProjectVO dePro(int proj_no) {
		return sqlSession.selectOne(NAMESPACE+"dePro",proj_no);
	}

	@Override
	public ProjectVO dePro(ProjectVO vo) {
		return sqlSession.selectOne(NAMESPACE+"dePro",vo);
	}

	@Override
	public List<FreelancerVO> fListPaging(Criteria cri) {
		List<FreelancerVO> resultVO = sqlSession.selectList(NAMESPACE+"fListPaging",cri);
		return resultVO;
	}

	@Override
	public int fNum() {
		int result = sqlSession.selectOne(NAMESPACE+"fNum");
		return result;
	}

	@Override
	public void doBMark(BMarkVO vo) {
		logger.debug(" doBMark(BMarkVO vo) 실행 ");
		sqlSession.insert(NAMESPACE+"doBMark", vo);
	}

	@Override
	public void deleteBMark(BMarkVO vo) {

		
		sqlSession.delete(NAMESPACE+"deleteBMark", vo);
	}

	@Override
	public List<ProjectVO> moFiPro(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"moFiPro",cri);
		return resultVO;
	}

	@Override
	public List<ProjectVO> moFiProNs(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"moFiProNs",cri);
		return resultVO;
	}

	@Override
	public List<ProjectVO> moFiProD(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"moFiProD",cri);
		return resultVO;
	}

	@Override
	public List<ProjectVO> moFiProDNs(Criteria cri) {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"moFiProDNs",cri);
		return resultVO;
	}

	@Override
	public int mofiNum(ProjectVO vo) {
		int result = sqlSession.selectOne(NAMESPACE+"mofiNum",vo);
		return result;
	}

	@Override
	public int mofiNumNs(ProjectVO vo) {
		int result = sqlSession.selectOne(NAMESPACE+"mofiNumNs",vo);
		return result;
	}

	@Override
	public List<BMarkVO> freebMark(int free_no) {
		List<BMarkVO> result = sqlSession.selectList(NAMESPACE+"freebMark",free_no);
		return result;
	}

	@Override
	public List<FreelancerVO> freeLSort(Criteria cri) {
		List<FreelancerVO> resultVO = sqlSession.selectList(NAMESPACE+"freeLSort",cri);
		return resultVO;
	}

	@Override
	public int fiNumFree(FreelancerVO vo) {
		int result = sqlSession.selectOne(NAMESPACE+"fiNumFree",vo);
		return result;
	}

	@Override
	public List<FreelancerVO> moFiFree(Criteria cri) {
		List<FreelancerVO> resultVO = sqlSession.selectList(NAMESPACE+"moFiFree",cri);
		return resultVO;
	}

	@Override
	public List<FreelancerVO> moFiFreeNs(Criteria cri) {
		List<FreelancerVO> resultVO = sqlSession.selectList(NAMESPACE+"moFiFreeNs",cri);
		return resultVO;
	}

	@Override
	public int mofiNumFree(FreelancerVO vo) {
		int result = sqlSession.selectOne(NAMESPACE+"mofiNumFree",vo);
		return result;
	}

	@Override
	public int mofiNumNsFree(FreelancerVO vo) {
		int result = sqlSession.selectOne(NAMESPACE+"mofiNumNsFree",vo);
		return result;
	}

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
	public void doBMarkC(BMarkVO vo) {
		logger.debug(" doBMark(BMarkVO vo) 실행 ");
		sqlSession.insert(NAMESPACE+"doBMarkC", vo);
	}

	@Override
	public void deleteBMarkC(BMarkVO vo) {
		sqlSession.delete(NAMESPACE+"deleteBMarkC", vo);
	}

	@Override
	public List<BMarkVO> bMarkC(int ct_no) {
		List<BMarkVO> result = sqlSession.selectList(NAMESPACE+"bMarkC",ct_no);
		return result;
	}
	
	// 프로젝트 상세내용 조회
	@Override
	public List<ProjectVO> getProj(int ct_no) {
		logger.debug(" DAO : getProj(vo) 호출 (❁´◡`❁) ");
		
		return sqlSession.selectList(NAMESPACE + "getProj",ct_no);
	}

	// 제안하기
	@Override
	public void insertOffer(OfferVO vo) {
		
		sqlSession.selectOne(NAMESPACE+"insertOffer", vo);
	}

	// 클라이언트가 요구하는 스킬 출력
	@Override
	public List<SkillVO> getSkillA(int proj_no) {
		logger.debug(" DAO : getSkill() 호출 (❁´◡`❁) ");
		
		return sqlSession.selectList(NAMESPACE+"getSkillA",proj_no);
	}
	
	// 지원하기
	@Override
	public void insertApply(ApplyVO vo) {
		logger.debug(" DAO : insertApply(vo) 호출 (❁´◡`❁) ");
		
		sqlSession.insert(NAMESPACE+"applyProj",vo);

	}

	@Override
	public double proSco(int ct_no) {
		double result = sqlSession.selectOne(NAMESPACE+"proSco",ct_no);
		return result;
	}

	@Override
	public int proScoC(int ct_no) {
		int result = sqlSession.selectOne(NAMESPACE+"proScoC", ct_no);
		return result;
	}

	@Override
	public List<PortfolioVO> getPortf(FreelancerVO vo) {
		return sqlSession.selectList(NAMESPACE+"getPortf", vo);
	}
	

	@Override
	public MemberVO getUser(FreelancerVO vo) {
		return sqlSession.selectOne(NAMESPACE+"getUser",vo);
	}
	
	
}
