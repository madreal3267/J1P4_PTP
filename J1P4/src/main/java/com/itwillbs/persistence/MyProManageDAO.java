package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.ProjectVO;

public interface MyProManageDAO {

	// 디비 서버의 시간정보 조회
	public String getTime();	
	
	// 관심 프로젝트 목록
	public List<ProjectVO> interestProjectList();	
	
	// 제안받은 프로젝트 목록
	public List<ProjectVO> proposedProjectList();
	
	// 지원 중 프로젝트 목록
	public List<ProjectVO> applyingProjectList();
	
	// 지원 종료 프로젝트 목록
	public List<ProjectVO> endApplyProjectList();	
	
	// 계약 진행 중 프로젝트 목록
	public List<ProjectVO> contractProjectList();
	
	// 프로젝트 진행 중 목록
	public List<ProjectVO> ongoingProjectList();
	
	// 평가 대기중 프로젝트 목록
	public List<ProjectVO> waitEvaluationProjectList();
	
	// 완료한 프로젝트 목록
	public List<ProjectVO> completedProjectList();
	
	// 관심 프리랜서 목록
	public List<FreelancerVO> interestFreelancerList();
	
	// 제안한 프리랜서 목록
	public List<FreelancerVO> proposeFreelancerList();
	
	// 검수중 프로젝트 목록
	public List<ProjectVO> underReviewProjectList();
	
	// 임시저장 프로젝트 목록
	public List<ProjectVO> temSaveProjectList();
	
	// 등록실패 프로젝트 목록
	public List<ProjectVO> regFailedProjectList();
	
	// 지원자 모집중 프로젝트 목록
	public List<ProjectVO> recruitingProjectList();
	
	// 계약 진행중 프로젝트 목록
	public List<ProjectVO> ctContractProjectList();
	
	// 프로젝트 진행중 목록 
	public List<ProjectVO> ctOngoingProjectList();
	
	// 평가 대기중 프린랜서 목록
	public List<FreelancerVO> waitEvaluationFreelancerList();
	
	// 완료한 프로젝트의 평가완료 프리랜서 목록
	public List<FreelancerVO> completedFreelancerList();
}
