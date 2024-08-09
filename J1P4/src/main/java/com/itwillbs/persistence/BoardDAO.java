package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

public interface BoardDAO {
	
	// 프로젝트 목록
//	public List<ProjectVO> projList();
	
	// 프로젝트 갯수 세기
	public int pNum();
	
	// 목록 페이징
	public List<ProjectVO> pListPaging(Criteria cri);
	
	// 프로젝트 정렬하기(최신, 견적)
	public List<ProjectVO> proLSort(Criteria cri);

	// 프로젝트 정렬하기(마감)
	public List<ProjectVO> proLSortD(Criteria cri);
	
	// 프로젝트 필터
	public List<ProjectVO> proFi(Criteria cri);
	// 필터된 갯수
	public int fiNum(ProjectVO vo);
	
	// 프로젝트 상세페이지 이동
	public ProjectVO dePro(int proj_no);
	public ProjectVO dePro(ProjectVO vo);
	
	// 프리랜서 페이징
	public List<FreelancerVO> fListPaging(Criteria cri);
	
	// 프리랜서 수
	public int fNum();

	// 북마크 등록
	public void doBMark(BMarkVO vo);
	
	// 북마크 삭제
	public void deleteBMark(BMarkVO vo);
	
	// 모달 필터
	public List<ProjectVO> moFiPro(Criteria cri);
	// skill_nm 예외
	public List<ProjectVO> moFiProNs(Criteria cri);	
	// 모달 후 정렬 데드라인 예외
	public List<ProjectVO> moFiProD(Criteria cri);
	// skill_nm 예외
	public List<ProjectVO> moFiProDNs(Criteria cri);
	// 모달 필터된 프로젝트 수
	public int mofiNum(ProjectVO vo);
	public int mofiNumNs(ProjectVO vo);
	
	// 북마크된 프로젝트 번호
	public List<BMarkVO> freebMark(int free_no);
	
	// 프리랜서 정렬
	public List<FreelancerVO> freeLSort(Criteria cri);
	// 프리랜서 필터
	// 필터된 프리랜서 수
	public int fiNumFree(FreelancerVO vo);
	// 모달 필터
	public List<FreelancerVO> moFiFree(Criteria cri);
	public List<FreelancerVO> moFiFreeNs(Criteria cri);
	// 모달 필터된 프리랜서 수
	public int mofiNumFree(FreelancerVO vo);
	public int mofiNumNsFree(FreelancerVO vo);
	// 프리랜서 상세페이지
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
	
	// 북마크 등록
	public void doBMarkC(BMarkVO vo);
	
	// 북마크 삭제
	public void deleteBMarkC(BMarkVO vo);
	// 북마크된 프리랜서 번호
	public List<BMarkVO> bMarkC(int ct_no);
	
	// 클라이언트가 프리랜서에게 제안하기
	// 프로젝트 상세내용 조회
	public List<ProjectVO> getProj(int ct_no);
	// 제안하기
	public void insertOffer(OfferVO vo);
	
	// 프로젝트 지원하기
	// 클라이언트가 요구하는 스킬 출력
	public List<SkillVO> getSkillA(int proj_no);

	// 지원하기
	public void insertApply(ApplyVO vo);
	
	// 프로젝트(클라이언트) 평점
	public double proSco(int ct_no);
	// 프로젝트 평가 내용(평점 null 피하기)
	public int proScoC(int ct_no);
	
	// 포트폴리오 불러오기
	public List<PortfolioVO> getPortf(FreelancerVO vo);
	
	// 이름& 프로필 불러오기
	public MemberVO getUser(FreelancerVO vo);
}
