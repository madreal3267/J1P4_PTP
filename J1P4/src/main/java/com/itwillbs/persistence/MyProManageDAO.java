package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.domain.ApplyMgmtVO;
import com.itwillbs.domain.EvaluateFreelancerDTO;
import com.itwillbs.domain.EvaluateProjectDTO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.ctOngoingProjectDTO;
import com.itwillbs.domain.freeInfoDTO;
import com.itwillbs.domain.proposeFreeDTO;

public interface MyProManageDAO {

	// 디비 서버의 시간정보 조회
	public String getTime();	
	
	// 관심 프로젝트 목록
	public List<ProjectDTO> interestProjectList();	
	
	// 프로젝트 목록 - 지원하기
	public void applyProject(ApplyMgmtVO avo);
	
	// 제안받은 프로젝트 목록
	public List<ProjectDTO> proposedProjectList();
	
	// 지원 중 프로젝트 목록
	public List<ProjectDTO> applyingProjectList();
	
	// 프로젝트 목록 - 지원취소
	public int deleteApply(ApplyMgmtVO avo);
	
	// 지원 종료 프로젝트 목록
	public List<ProjectDTO> endApplyProjectList();	
	
	// 계약 진행 중 프로젝트 목록
	public List<ProjectDTO> contractProjectList();
	
	// 프로젝트 진행 중 목록
	public List<ProjectDTO> ongoingProjectList();
	
	// 평가 대기중 프로젝트 목록
	public List<ProjectVO> waitEvaluationProjectList();
	
	// 검수중 프로젝트 목록
	public List<ProjectVO> underReviewProjectList();
	
	// 검수중 프로젝트 목록 - 프로젝트 삭제하기
	public int deleteProject(int proj_no);
	
	// 임시저장 프로젝트 목록
	public List<ProjectVO> temSaveProjectList();
	
	// 등록실패 프로젝트 목록
	public List<ProjectVO> regFailedProjectList();
	
	// 지원자 모집중 프로젝트 목록
	public List<proposeFreeDTO> recruitingProjectList();
	
	// 계약 진행중 프로젝트 목록
	public List<ProjectVO> ctContractProjectList();
	

	
	
	// DTO로 재구성중...
	// 평가 대기중 프로젝트 리스트
	public List<EvaluateProjectDTO> evaluateProjectList();
	
	// 평가 대기중 프로젝트 - 평가하기
	public void evaluateProject(EvaluateProjectDTO edto);
	
	// 프로젝트 평가 여부 체크
	public int checkEvaluate(EvaluateProjectDTO edto);
	
	// 완료한 프로젝트 목록
	public List<EvaluateProjectDTO> completedProjectList();

	// 프로젝트 평가 수정하기
	public void updateEvaluate(EvaluateProjectDTO edto);	
	
	// 관심 프리랜서 목록
	public List<freeInfoDTO> interestFreelancerList();
	
	// 제안한 프리랜서 목록
	public List<proposeFreeDTO> proposeFreelancerList();
	
	// 프로젝트 진행중 목록 
	public List<ctOngoingProjectDTO> ctOngoingProjectList();
	
	// 평가 대기중 프린랜서 목록 조회
	public List<EvaluateFreelancerDTO> waitEvaluationFreelancerList();
	
	// 평가 대기중 프리랜서 - 평가하기
	public void evaluateFreelancer(EvaluateFreelancerDTO edto);
	
	// 프리랜서 평가 여부 체크
	public int checkEvaluateFree(EvaluateFreelancerDTO edto);
	
	// 완료한 프로젝트의 평가완료 프리랜서 목록
	public List<EvaluateFreelancerDTO> completedFreelancerList();

	// 프리랜서 평가 수정하기
	public void updateEvaluateFree(EvaluateFreelancerDTO edto);

	// 지원자 모집중 프로젝트 - 지원거절
	public void rejectApply(proposeFreeDTO pfdto);
	
	// 지원자 모집중 프로젝트 - 계약 제안
	public void offerContract(proposeFreeDTO pfdto);	
	
	// 지원자 모집중 프로젝트 - 모집완료
	public void recruitmentCompleted(proposeFreeDTO pfdto);

	// 진행중 프로젝트 - 완료하기(정산요청)
	public void requestSettlement(ctOngoingProjectDTO cdto);

	// 지원중 프로젝트 -  제안 동의
	public void agreeContract(proposeFreeDTO pfdto);

	

	
}
