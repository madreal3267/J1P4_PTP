package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.object.RdbmsOperation;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.ctOngoingProjectDTO;
import com.itwillbs.domain.freeInfoDTO;
import com.itwillbs.domain.proposeFreeDTO;
import com.itwillbs.domain.ApplyMgmtVO;
import com.itwillbs.domain.EvaluateFreelancerDTO;
import com.itwillbs.domain.EvaluateProjectDTO;

@Repository
public class MyProManageDAOImpl implements MyProManageDAO {

	private static final Logger logger = LoggerFactory.getLogger(MyProManageDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.MyProManageMapper.";

	@Override
	public String getTime() {
		
		String result = sqlSession.selectOne(NAMESPACE+"getTime");
		logger.debug("DAO : 결과 -" + result);
		return result;
	}

	// 관심있는 프로젝트 리스트
	@Override
	public List<ProjectDTO> interestProjectList(String user_id) {
		List<ProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE + "interestProjectList", user_id);
		
		return resultDTO;
	}

	// 제안받은 프로젝트 리스트
	@Override
	public List<ProjectDTO> proposedProjectList(String user_id) {
		List<ProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE + "proposedProjectList", user_id);

		return resultDTO;
	}

	// 지원중 프로젝트 리스트
	@Override
	public List<ProjectDTO> applyingProjectList(String user_id) {
		List<ProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE + "applyingProjectList", user_id);
		
		return resultDTO;
	}
	
	// 프로젝트 리스트 - 지원취소
	@Override
	public int deleteApply(ApplyMgmtVO avo) {
		int result = sqlSession.delete(NAMESPACE+"deleteApply", avo);
		
		return result;
	}
	
	// 지원종료 프로젝트 리스트
	@Override
	public List<ProjectDTO> endApplyProjectList(String user_id) {
		List<ProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE + "endApplyProjectList", user_id);
		
		return resultDTO;
	}

	// 계약중 프로젝트 리스트 
	@Override
	public List<ProjectDTO> contractProjectList(String user_id) {
		List<ProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE+"contractProjectList", user_id);
		
		return resultDTO;
	}

	// 진행중 프로젝트 리스트
	@Override
	public List<ProjectDTO> ongoingProjectList(String user_id) {
		List<ProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE+"ongoingProjectList", user_id);
		
		return resultDTO;
	}

	// 검수중 프로젝트 리스트
	@Override
	public List<ProjectVO> underReviewProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"underReviewProjectList");
		
		return resultVO;
	}
	
	// 검수중 프로젝트 리스트 - 프로젝트 삭제하기
	@Override
	public int deleteProject(int proj_no) {
		int result = sqlSession.delete(NAMESPACE+"deleteProject", proj_no);
		
		return result;
	}
	
	// 임시저장 프로젝트 리스트
	@Override
	public List<ProjectVO> temSaveProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"temSaveProjectList");
		
		return resultVO;
	}


	// 등록실패 프로젝트 리스트
	@Override
	public List<ProjectVO> regFailedProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"regFailedProjectList");
		
		return resultVO;
	}

	// 지원자 모집중 프로젝트 리스트
	@Override
	public List<proposeFreeDTO> recruitingProjectList() {
		List<proposeFreeDTO> resultDTO = sqlSession.selectList(NAMESPACE+"rpl");
		
		return resultDTO;
	}

	// 계약중 프로젝트 리스트(클라이언트 ver.)
	@Override
	public List<ProjectVO> ctContractProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"ctContractProjectList");
		
		return resultVO;
	}

		
	// DTO 로 변경 하여 재적용
	// 평가 대기중 프로젝트 리스트
	@Override
	public List<EvaluateProjectDTO> evaluateProjectList(String user_id) {
		List<EvaluateProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE+"evProjList", user_id);
		
		return resultDTO;
	}
	
	// 평가 대기중 프로젝트 - 평가하기
	@Override
	public void evaluateProject(EvaluateProjectDTO edto) {
		sqlSession.insert(NAMESPACE + "evaluate", edto);
		
	}
	
	// 프로젝트 평가 여부 체크
	@Override
	public int checkEvaluate(EvaluateProjectDTO edto) {
		int result = sqlSession.selectOne(NAMESPACE + "checkEvaluate", edto);
		logger.debug("result : " + result );
		return result;
	}

	// 완료한 프로젝트 목록
	@Override
	public List<EvaluateProjectDTO> completedProjectList(String user_id) {
		List<EvaluateProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE+"completedProjectList", user_id);
		return resultDTO;
	}
	
	// 프로젝트 평가 수정하기
	@Override
	public void updateEvaluate(EvaluateProjectDTO edto) {
		sqlSession.update(NAMESPACE+"updateEvaluate", edto);
		
	}

	// 관심 프리랜서 목록 조회
	@Override
	public List<freeInfoDTO> interestFreelancerList(String user_id) {
		List<freeInfoDTO> result = sqlSession.selectList(NAMESPACE+"freeInfo", user_id);
	    logger.debug("result : " + result.size());
	   
	    return result;
	}

	// 제안한 프리랜서 목록 조회
	@Override
	public List<proposeFreeDTO> proposeFreelancerList(String user_id) {
		List<proposeFreeDTO> result = sqlSession.selectList(NAMESPACE+"proposeFreelancerList", user_id);
	    logger.debug("result : " + result.size());
	   
	    return result;
	}

	// 진행중 프로젝트 목록 조회
	@Override
	public List<ctOngoingProjectDTO> ctOngoingProjectList() {
		List<ctOngoingProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE+"ctOngoingProjectList");
		logger.debug("resultDTO : "+ resultDTO.size());
		
		return resultDTO;
	}	
	
	// 평가 대기중 프리랜서 목록 조회
	@Override
	public List<EvaluateFreelancerDTO> waitEvaluationFreelancerList() {
		List<EvaluateFreelancerDTO> resultDTO =sqlSession.selectList(NAMESPACE+"waitEvaluationFreelancerList");
		
		return resultDTO;
	}

	// 평가 대기중 프리랜서 - 평가하기
	@Override
	public void evaluateFreelancer(EvaluateFreelancerDTO edto) {
		sqlSession.insert(NAMESPACE+"evaluateFree",edto);
		
	}

	// 프리랜서 평가 여부 체크
	@Override
	public int checkEvaluateFree(EvaluateFreelancerDTO edto) {
		int result = sqlSession.selectOne(NAMESPACE+"checkFreeEvaluate", edto);
		
		return result;
	}

	// 완료된 프로젝트 - 평가 완료된 프로젝트 목록
	@Override
	public List<EvaluateFreelancerDTO> completedFreelancerList() {
		List<EvaluateFreelancerDTO> resultDTO =sqlSession.selectList(NAMESPACE+"completedProjectFreeList");
		
		return resultDTO;
	}

	// 완료된 프로젝트 - 프리랜서 평가 수정하기
	@Override
	public void updateEvaluateFree(EvaluateFreelancerDTO edto) {
		logger.debug("(/≧▽≦)/(/≧▽≦)/(/≧▽≦)/");
		logger.debug("(/≧▽≦)/(/≧▽≦)/(/≧▽≦)/(/≧▽≦)/"+edto);
		sqlSession.update(NAMESPACE+"updateEvaluateFree", edto);
									
	}

	// 지원자 모집중 프로젝트 - 지원거절
	@Override
	public void rejectApply(proposeFreeDTO pfdto) {
		sqlSession.update(NAMESPACE+"rejectApply", pfdto);
		
	}
	
	// 지원자 모집중 프로젝트 - 계약 제안 
	@Override
	public void offerContract(proposeFreeDTO pfdto) {
		sqlSession.update(NAMESPACE+"offerContract", pfdto);
		
	}

	// 지원자 모집중 프로젝트 - 모집완료
	@Override
	public void recruitmentCompleted(proposeFreeDTO pfdto) {
		sqlSession.update(NAMESPACE+"recruitmentCompleted", pfdto);
		
	}

	// 진행중 프로젝트 - 완료하기(정산요청)
	@Override
	public void requestSettlement(ctOngoingProjectDTO cdto) {
		sqlSession.update(NAMESPACE+"requestSettlement", cdto);
		
	}

	// 지원중 프로젝트 - 제안동의
	@Override
	public void agreeContract(proposeFreeDTO pfdto) {
		sqlSession.update(NAMESPACE+"agreeContract",pfdto);
		
	}

	

	
}
