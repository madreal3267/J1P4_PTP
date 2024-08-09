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
	public List<ProjectDTO> interestProjectList(String user_id) {
		logger.debug("interestProjectList(String user_id) 실행");
		
		return mpmdao.interestProjectList(user_id);
	}

	// 제안받은 프로젝트 목록
	@Override
	public List<ProjectDTO> proposedProjectList(String user_id) {
		logger.debug("proposedProjectList() 실행");
		
		return mpmdao.proposedProjectList(user_id);
	}
	
	// 지원 중 프로젝트 목록
	@Override
	public List<ProjectDTO> applyingProjectList(String user_id) {
		logger.debug("applyingProjectList() 실행");
		
		return mpmdao.applyingProjectList(user_id);
	}

	// 프로젝트 목록 - 지원취소
	@Override
	public int deleteApply(ApplyMgmtVO avo) {
		logger.debug("deleteApply(applyMgmtVO avo) 실행");
		
		return mpmdao.deleteApply(avo);
	}

	// 지원 종료 프로젝트 목록
	@Override
	public List<ProjectDTO> endApplyProjectList(String user_id) {
		logger.debug("endApplyProjectList() 실행");
		
		return mpmdao.endApplyProjectList(user_id);
	}

	// 계약 진행 중 프로젝트 목록
	@Override
	public List<ProjectDTO> contractProjectList(String user_id) {
		logger.debug("contractProjectList() 실행");
		
		return mpmdao.contractProjectList(user_id);
	}

	// 프로젝트 진행 중 목록
	@Override
	public List<ProjectDTO> ongoingProjectList(String user_id) {
		logger.debug("ongoingProjectList() 실행");
		
		return mpmdao.ongoingProjectList(user_id);
	}

	// 검수중 프로젝트 목록
	@Override
	public List<ProjectVO> underReviewProjectList(String user_id) {
		logger.debug("underReviewProjectList() 실행");
		
		return mpmdao.underReviewProjectList(user_id);
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
	public List<ProjectVO> temSaveProjectList(String user_id) {
		logger.debug("temSaveProjectList() 실행");
		
		return mpmdao.temSaveProjectList(user_id);
	}
	
	// 등록실패 프로젝트 목록
	@Override
	public List<ProjectVO> regFailedProjectList(String user_id) {
		logger.debug("regFailedProjectList() 실행");
		
		return mpmdao.regFailedProjectList(user_id);
	}

	// 지원자 모집중 프로젝트 목록
	@Override
	public List<proposeFreeDTO> recruitingProjectList(String user_id) {
		logger.debug("recruitingProjectList() 실행");
		
		return mpmdao.recruitingProjectList(user_id);
	}

	// 계약 진행중 프로젝트 목록
	@Override
	public List<ProjectVO> ctContractProjectList(String user_id) {
		logger.debug("ctContractProjectList() 실행");
		
		return mpmdao.ctContractProjectList(user_id);
	}

	// VO -> DTO 로 변경하여 재구성중
	// 평가 대기중 프로젝트 리스트	
	@Override
	public List<EvaluateProjectDTO> evaluateProjectList(String user_id) {
		logger.debug("evaluateProjectList() 실행");
		
		return mpmdao.evaluateProjectList(user_id);
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
	public List<EvaluateProjectDTO> completedProjectList(String user_id) {
			logger.debug("completedProjectList() 실행");
			
			return mpmdao.completedProjectList(user_id);
	}
	
	// 프로젝트 평가 수정하기
	@Override
	public void updateEvaluate(EvaluateProjectDTO edto) {
		logger.debug("updateEvaluate(ProjectDTO pdto) 실행");
		
		 mpmdao.updateEvaluate(edto);
	}
	
	@Override
	public List<freeInfoDTO> interestFreelancerList(String user_id) {
		logger.debug("interestFreelancerList() 실행");
		
		return mpmdao.interestFreelancerList(user_id);
	}
	
	@Override
	public List<proposeFreeDTO> proposeFreelancerList(String user_id) {
		logger.debug("proposeFreelancerList() 실행");
		
		return mpmdao.proposeFreelancerList(user_id);
	}
	
	@Override
	public List<ctOngoingProjectDTO> ctOngoingProjectList(String user_id) {
		logger.debug("ctOngoingProjectList() 실행");
		
		return mpmdao.ctOngoingProjectList(user_id);
	}
	
	// 평가 대기중 프리랜서 목록 조회
	@Override
	public List<EvaluateFreelancerDTO> waitEvaluationFreelancerList(String user_id) {
		logger.debug("waitEvaluationFreelancerList() 실행");
		
		return mpmdao.waitEvaluationFreelancerList(user_id);
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
	public List<EvaluateFreelancerDTO> completedFreelancerList(String user_id) {
		logger.debug("completedFreelancerList() 실행");
		
		return mpmdao.completedFreelancerList(user_id);
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

	// 진행중 프로젝트 - 결제하기(대금지불)
	@Override
	public void payment(ctOngoingProjectDTO cdto) {
		logger.debug("payment(ctOngoingProjectDTO cdto) 실행");
		
		mpmdao.payment(cdto);
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
