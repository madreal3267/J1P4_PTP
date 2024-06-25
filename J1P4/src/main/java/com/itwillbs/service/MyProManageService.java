package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.ctOngoingProjectDTO;
import com.itwillbs.domain.freeInfoDTO;
import com.itwillbs.domain.proposeFreeDTO;
import com.itwillbs.domain.ApplyMgmtVO;
import com.itwillbs.domain.EvaluateFreelancerDTO;
import com.itwillbs.domain.EvaluateProjectDTO;

public interface MyProManageService {

	// DB 시간정보 조회
	public String getDBTime();
	
	// 관심 프로젝트 목록
	public List<ProjectDTO> interestProjectList(String user_id);
	
	// 제안받은 프로젝트 목록
	public List<ProjectDTO> proposedProjectList(String user_id);
	
	// 지원 중 프로젝트 목록
	public List<ProjectDTO> applyingProjectList(String user_id);
	
	// 프로젝트 목록 - 지원취소
	public int deleteApply(ApplyMgmtVO avo);	
	
	// 지원 종료 프로젝트 목록
	public List<ProjectDTO> endApplyProjectList(String user_id);
	
	// 계약 진행 중 프로젝트 목록
	public List<ProjectDTO> contractProjectList(String user_id);
	
	// 프로젝트 진행 중 목록
	public List<ProjectDTO> ongoingProjectList(String user_id);

	// 검수중 프로젝트 목록
	public List<ProjectVO> underReviewProjectList(String user_id);
	
	// 검수중 프로젝트 목록 - 프로젝트 삭제하기
	public int deleteProject(int proj_no);	
	
	// 임시저장 프로젝트 목록
	public List<ProjectVO> temSaveProjectList(String user_id);
	
	// 등록실패 프로젝트 목록
	public List<ProjectVO> regFailedProjectList(String user_id);
	
	// 지원자 모집중 프로젝트 목록
	public List<proposeFreeDTO> recruitingProjectList(String user_id);
	
	// 계약 진행중 프로젝트 목록
	public List<ProjectVO> ctContractProjectList(String user_id);
	
	// DTO 변경 적용 중
	// 평가 대기중 프로젝트 리스트
	public List<EvaluateProjectDTO> evaluateProjectList(String user_id);
	
	// 평가 대기중 프로젝트 - 평가하기
	public void evaluateProject(EvaluateProjectDTO edto);	
	
	// 프로젝트 평가 여부 체크
	public int checkEvaluate(EvaluateProjectDTO edto);
	
	// 완료한 프로젝트 목록
	public List<EvaluateProjectDTO> completedProjectList(String user_id);
	
	// 프로젝트 평가 수정하기
	public void updateEvaluate(EvaluateProjectDTO edto);
	
	// 관심 프리랜서 목록
	public List<freeInfoDTO> interestFreelancerList(String user_id);
	
	// 제안한 프리랜서 목록
	public List<proposeFreeDTO> proposeFreelancerList(String user_id);	
	
	// 프로젝트 진행중 목록 
	public List<ctOngoingProjectDTO> ctOngoingProjectList(String user_id);
	
	// 평가 대기중 프리랜서 목록
	public List<EvaluateFreelancerDTO> waitEvaluationFreelancerList(String user_id);
	
	// 평개 대기중 프리랜서 - 평가하기
	public void evaluateFreelancer(EvaluateFreelancerDTO edto);
	
	// 프리랜서 평가 여부 체크
	public int checkEvaluateFree(EvaluateFreelancerDTO edto);
	
	// 완료한 프로젝트의 평가완료 프리랜서 목록
	public List<EvaluateFreelancerDTO> completedFreelancerList(String user_id);
	
	// 프리랜서 평가 수정하기
	public void updateEvaluateFree(EvaluateFreelancerDTO edto);

	// 지원자 모집중 프로젝트 - 지원 거절
	public void rejectApply(proposeFreeDTO pfdto);

	// 지원자 모집중 프로젝트 - 게약 제안
	public void offerContract(proposeFreeDTO pfdto);
	
	// 지원자 모집중 프로젝트 - 모집 완료
	public void recruitmentCompleted(proposeFreeDTO pfdto);

	// 진행중 프로젝트 - 결제하기(대금지불)
	public void payment(ctOngoingProjectDTO cdto);

	// 진행중 프로젝트 - 완료하기(정산요청)
	public void requestSettlement(ctOngoingProjectDTO cdto);

	// 지원중 프로젝트 - 제안동의
	public void agreeContract(proposeFreeDTO pfdto);


	






	
}
