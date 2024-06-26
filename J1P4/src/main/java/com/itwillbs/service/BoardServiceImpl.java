package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.BMarkVO;
import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.EvaluateProjectDTO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.OfferVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.PortfolioVO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDAO bdao;
	
//	@Override
//	public List<ProjectVO> projList() {
//		logger.debug(" 컨트롤러 -> 서비스 호출 ");
//		logger.debug("  projList() 실행 ");
//		
//		return bdao.projList();
//	}

	@Override
	public int pNum() {
		logger.debug(" 컨트롤러 -> 서비스 호출 확인중11111");
		logger.debug(" pNum(ProjectVO nVO) 실행 ");
		
		return bdao.pNum();
	}

	@Override
	public List<ProjectVO> pListPaging(Criteria cri) {
		logger.debug(" pPageList(Criteria cri)) 실행 ");
		
		return bdao.pListPaging(cri);
	}


	@Override
	public List<ProjectVO> proLSort(Criteria cri) {
		logger.debug("ghkgdfdsf");
		return bdao.proLSort(cri);
	}
	
	@Override
	public List<ProjectVO> proLSortD(Criteria cri) {
		logger.debug("proLSortD(Criteria cri)마감 정렬 실행");
		return bdao.proLSortD(cri);
	}

	@Override
	public List<ProjectVO> proFi(Criteria cri) {
		return bdao.proFi(cri);
	}

	@Override
	public int fiNum(ProjectVO vo) {
		return bdao.fiNum(vo);
	}

	@Override
	public ProjectVO dePro(int proj_no) {
		return bdao.dePro(proj_no);
	}

	@Override
	public List<FreelancerVO> fListPaging(Criteria cri) {
		logger.debug(" fPageList(Criteria cri)) 실행 ");
		
		return bdao.fListPaging(cri);
	}

	@Override
	public int fNum() {
		return bdao.fNum();
	}
	
	// 북마크 등록
	@Override
	public void doBMark(BMarkVO vo) {
		bdao.doBMark(vo);
	}

	// 북마크 삭제
	@Override
	public void deleteBMark(BMarkVO vo) {
		bdao.deleteBMark(vo);
	}
	
	// 모달 필터
	@Override
	public List<ProjectVO> moFiPro(Criteria cri) {
		logger.debug(" moFiPro(Criteria cri) 실행"); 
		return bdao.moFiPro(cri);
	}
	
	@Override
	public List<ProjectVO> moFiProNs(Criteria cri) {
		logger.debug("moFiProNs(Criteria cri) 실행"); 
		return bdao.moFiProNs(cri);
	}

	@Override
	public List<ProjectVO> moFiProD(Criteria cri) {
		logger.debug(" moFiProD(Criteria cri) 실행"); 
		return bdao.moFiProD(cri);
	}

	@Override
	public List<ProjectVO> moFiProDNs(Criteria cri) {
		logger.debug(" moFiProDNs(Criteria cri) 실행"); 
		return bdao.moFiProDNs(cri);
	}

	// 모달 필터된 프로젝트 수
	@Override
	public int mofiNum(ProjectVO vo) {
		return bdao.mofiNum(vo);
	}

	// 모달 필터된 프로젝트 수 skill_nm 없을때
	@Override
	public int mofiNumNs(ProjectVO vo) {
		return bdao.mofiNumNs(vo);
	}

	@Override
	public List<BMarkVO> freebMark(int free_no) {
		return bdao.freebMark(free_no);
	}
	
	// 프리랜서찾기 정렬
	@Override
	public List<FreelancerVO> freeLSort(Criteria cri) {
		return bdao.freeLSort(cri);
	}

	@Override
	public int fiNumFree(FreelancerVO vo) {
		return bdao.fiNumFree(vo);
	}

	@Override
	public List<FreelancerVO> moFiFree(Criteria cri) {
		return bdao.moFiFree(cri);
	}

	@Override
	public List<FreelancerVO> moFiFreeNs(Criteria cri) {
		return bdao.moFiFreeNs(cri);
	}

	@Override
	public int mofiNumFree(FreelancerVO vo) {
		return bdao.mofiNumFree(vo);
	}

	@Override
	public int mofiNumNsFree(FreelancerVO vo) {
		return bdao.mofiNumNsFree(vo);
	}
	
	// 프로필 불러오기
	@Override
	public FreelancerVO getProfile(FreelancerVO vo) {
		return bdao.getProfile(vo);
	}

	@Override
	public List<SkillVO> getSkill(FreelancerVO vo) {
		return bdao.getSkill(vo);
	}

	@Override
	public RegionVO getReg(FreelancerVO vo) {
		return bdao.getReg(vo);
	}

	@Override
	public List<CareerVO> getCareer(FreelancerVO vo) {
		return bdao.getCareer(vo);
	}

	@Override
	public List<LicenseVO> getLicense(FreelancerVO vo) {
		return bdao.getLicense(vo);
	}

	@Override
	public List<CompanyVO> getComp(FreelancerVO vo) {
		return bdao.getComp(vo);
	}

	@Override
	public List<PartnersVO> getPartn(FreelancerVO vo) {
		return bdao.getPartn(vo);
	}

	@Override
	public void doBMarkC(BMarkVO vo) {
		bdao.doBMarkC(vo);
		
	}

	@Override
	public void deleteBMarkC(BMarkVO vo) {
		bdao.deleteBMarkC(vo);
	}

	@Override
	public List<BMarkVO> bMarkC(int ct_no) {
		return bdao.bMarkC(ct_no);
	}
	
	@Override
	public List<ProjectVO> getProj(int ct_no) {
		logger.debug(" (●'◡'●) Service: getProj(vo) 실행 ");
		return bdao.getProj(ct_no);
	}

	@Override
	public void insertOffer(OfferVO vo) {
		bdao.insertOffer(vo);
	}
	
	@Override
	public List<SkillVO> getSkillA(int proj_no) {
		logger.debug(" (●'◡'●) Service: getSkill() 실행 ");
		return bdao.getSkillA(proj_no);
	}

	@Override
	public void insertApply(ApplyVO vo) {
		logger.debug(" (●'◡'●) Service: insertApply() 실행 ");
		bdao.insertApply(vo);
	}

	@Override
	public double proSco(int ct_no) {
		return bdao.proSco(ct_no);
	}

	@Override
	public int proScoC(int ct_no) {
		return bdao.proScoC(ct_no);
	}

	@Override
	public List<PortfolioVO> getPortf(FreelancerVO vo) {
		return bdao.getPortf(vo);
	}
	
	
	
	
	

}
