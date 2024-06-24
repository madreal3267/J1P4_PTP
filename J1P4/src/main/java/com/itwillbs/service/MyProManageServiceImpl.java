package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.ctOngoingProjectDTO;
import com.itwillbs.domain.freeInfoDTO;
import com.itwillbs.domain.proposeFreeDTO;
import com.itwillbs.domain.ApplyMgmtVO;
import com.itwillbs.domain.EvaluateFreelancerDTO;
import com.itwillbs.domain.EvaluateProjectDTO;
import com.itwillbs.persistence.MyProManageDAO;

@Service
public class MyProManageServiceImpl implements MyProManageService {

	private static final Logger logger = LoggerFactory.getLogger(MyProManageServiceImpl.class);
	
	@Inject
	private MyProManageDAO mpmdao;

	@Override
	public String getDBTime() {
		
		return mpmdao.getTime();
	}
	
	// 관심 프로젝트 목록
	@Override
	public List<ProjectDTO> interestProjectList() {
		logger.debug("interestProjectList() 실행");
		
		return mpmdao.interestProjectList();
	}
	
	// 프로젝트 - 지원하기
	@Override
	public void applyProject(ApplyMgmtVO avo) {
		logger.debug("applyProject(applyMgmtVO avo) 실행");
		
		mpmdao.applyProject(avo);
		logger.debug("프로젝트 - 지원하기 성공");
	}

	// 제안받은 프로젝트 목록
	@Override
	public List<ProjectDTO> proposedProjectList() {
		logger.debug("proposedProjectList() 실행");
		
		return mpmdao.proposedProjectList();
	}
	
	// 지원 중 프로젝트 목록
	@Override
	public List<ProjectDTO> applyingProjectList() {
		logger.debug("applyingProjectList() 실행");
		
		return mpmdao.applyingProjectList();
	}

	// 프로젝트 목록 - 지원취소
	@Override
	public int deleteApply(ApplyMgmtVO avo) {
		logger.debug("deleteApply(applyMgmtVO avo) 실행");
		
		return mpmdao.deleteApply(avo);
	}

	// 지원 종료 프로젝트 목록
	@Override
	public List<ProjectDTO> endApplyProjectList() {
		logger.debug("endApplyProjectList() 실행");
		
		return mpmdao.endApplyProjectList();
	}

	// 계약 진행 중 프로젝트 목록
	@Override
	public List<ProjectDTO> contractProjectList() {
		logger.debug("contractProjectList() 실행");
		
		return mpmdao.contractProjectList();
	}

	// 프로젝트 진행 중 목록
	@Override
	public List<ProjectDTO> ongoingProjectList() {
		logger.debug("ongoingProjectList() 실행");
		
		return mpmdao.ongoingProjectList();
	}

	// 검수중 프로젝트 목록
	@Override
	public List<ProjectVO> underReviewProjectList() {
		logger.debug("underReviewProjectList() 실행");
		
		return mpmdao.underReviewProjectList();
	}

	// 검수중 프로젝트 목록 - 프로젝트 삭제하기
	@Override
	public int deleteProject(int proj_no) {
		logger.debug("deleteProject(int proj_no) 실행");
		
		int result = mpmdao.deleteProject(proj_no);
		logger.debug("프로젝트 - 삭제하기 성공");
		
		return result;
	}

	// 임시저장 프로젝트 목록
	@Override
	public List<ProjectVO> temSaveProjectList() {
		logger.debug("temSaveProjectList() 실행");
		
		return mpmdao.temSaveProjectList();
	}
	
	// 등록실패 프로젝트 목록
	@Override
	public List<ProjectVO> regFailedProjectList() {
		logger.debug("regFailedProjectList() 실행");
		
		return mpmdao.regFailedProjectList();
	}

	// 지원자 모집중 프로젝트 목록
	@Override
	public List<proposeFreeDTO> recruitingProjectList() {
		logger.debug("recruitingProjectList() 실행");
		
		return mpmdao.recruitingProjectList();
	}

	// 계약 진행중 프로젝트 목록
	@Override
	public List<ProjectVO> ctContractProjectList() {
		logger.debug("ctContractProjectList() 실행");
		
		return mpmdao.ctContractProjectList();
	}

	// VO -> DTO 로 변경하여 재구성중
	// 평가 대기중 프로젝트 리스트	
	@Override
	public List<EvaluateProjectDTO> evaluateProjectList() {
		logger.debug("evaluateProjectList() 실행");
		
		return mpmdao.evaluateProjectList();
	}
	
	// 평가 대기중 프로젝트 - 평가하기
	@Override
	public void evaluateProject(EvaluateProjectDTO edto) {
		logger.debug("evaluateProject(EvaluateProjectDTO edto) 실행");
		
		mpmdao.evaluateProject(edto);
	}

	// 프로젝트 평가 여부 체크
	@Override
	public int checkEvaluate(EvaluateProjectDTO edto) {
		logger.debug("checkEvaluate(EvaluateProjectDTO edto) 실행");
		
		return mpmdao.checkEvaluate(edto);
	}
	
	// 완료한 프로젝트 목록
	@Override
	public List<EvaluateProjectDTO> completedProjectList() {
			logger.debug("completedProjectList() 실행");
			
			return mpmdao.completedProjectList();
	}
	
	// 프로젝트 평가 수정하기
	@Override
	public void updateEvaluate(EvaluateProjectDTO edto) {
		logger.debug("updateEvaluate(ProjectDTO pdto) 실행");
		
		 mpmdao.updateEvaluate(edto);
	}
	
	@Override
	public List<freeInfoDTO> interestFreelancerList() {
		logger.debug("interestFreelancerList() 실행");
		
		return mpmdao.interestFreelancerList();
	}
	
	@Override
	public List<proposeFreeDTO> proposeFreelancerList() {
		logger.debug("proposeFreelancerList() 실행");
		
		return mpmdao.proposeFreelancerList();
	}
	
	@Override
	public List<ctOngoingProjectDTO> ctOngoingProjectList() {
		logger.debug("ctOngoingProjectList() 실행");
		
		return mpmdao.ctOngoingProjectList();
	}
	
	// 평가 대기중 프리랜서 목록 조회
	@Override
	public List<EvaluateFreelancerDTO> waitEvaluationFreelancerList() {
		logger.debug("waitEvaluationFreelancerList() 실행");
		
		return mpmdao.waitEvaluationFreelancerList();
	}
	
	// 평가 대기중 프리랜서 - 평가하기
	@Override
	public void evaluateFreelancer(EvaluateFreelancerDTO edto) {
		logger.debug("evaluateFreelancer(EvaluateFreelancerDTO edto) 실행");
		
		mpmdao.evaluateFreelancer(edto);
	}

	// 프리랜서 평가 여부 체크
	@Override
	public int checkEvaluateFree(EvaluateFreelancerDTO edto) {
		logger.debug("checkEvaluateFree(EvaluateFreelancerDTO edto) 실행");
		
		return mpmdao.checkEvaluateFree(edto);
	}

	// 평가 완료한 프리랜서 목록 조회
	@Override
	public List<EvaluateFreelancerDTO> completedFreelancerList() {
		logger.debug("completedFreelancerList() 실행");
		
		return mpmdao.completedFreelancerList();
	}

	// 평가 완료한 프로젝트 - 프리랜서 평가 수정하기
	@Override
	public void updateEvaluateFree(EvaluateFreelancerDTO edto) {
		logger.debug("updateEvaluateFree(EvaluateFreelancerDTO edto) 실행");
		
		mpmdao.updateEvaluateFree(edto);
	}
	
	// 지원자 모집중 프로젝트 - 지원거절
	@Override
	public void rejectApply(proposeFreeDTO pfdto) {
		logger.debug("rejectApply(proposeFreeDTO pfdto) 실행");
		
		mpmdao.rejectApply(pfdto);
	}

	// 지원자 모집중 프로젝트 - 게약 제안
	@Override
	public void offerContract(proposeFreeDTO pfdto) {
		logger.debug("offerContract(proposeFreeDTO pfdto) 실행");
		
		mpmdao.offerContract(pfdto);
	}
	
	// 지원자 모집중 프로젝트 - 모집완료
	@Override
	public void recruitmentCompleted(proposeFreeDTO pfdto) {
		logger.debug("recruitmentCompleted(proposeFreeDTO pfdto) 실행");
		
		mpmdao.recruitmentCompleted(pfdto);
	}


	// 진행중 프로젝트 - 완료하기(정산요청)
	@Override
	public void requestSettlement(ctOngoingProjectDTO cdto) {
		logger.debug(" requestSettlement(ctOngoingProjectDTO cdto) 실행");
		
		mpmdao.requestSettlement(cdto);
	}

	@Override
	public void agreeContract(proposeFreeDTO pfdto) {
		logger.debug(" agreeContract(proposeFreeDTO pfdto) 실행");
		
		mpmdao.agreeContract(pfdto);
	}


	
}
