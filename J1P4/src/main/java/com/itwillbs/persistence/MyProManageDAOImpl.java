package com.itwillbs.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.FreelancerVO;
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
	public List<ProjectVO> interestProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE + "interestProjectList");
		
		return resultVO;
	}

	// 관심있는 프로젝트 리스트 - 지원하기 
	@Override
	public void applyProject(ApplyMgmtVO avo) {
		sqlSession.insert(NAMESPACE + "applyProject", avo);
		
	}

	// 제안받은 프로젝트 리스트
	@Override
	public List<ProjectVO> proposedProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE + "proposedProjectList");

		return resultVO;
	}

	// 지원중 프로젝트 리스트
	@Override
	public List<ProjectVO> applyingProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE + "applyingProjectList");
		
		return resultVO;
	}
	
	// 지원중 프로젝트 리스트 - 지원취소
	@Override
	public int deleteApply(ApplyMgmtVO avo) {
		
		int result = sqlSession.delete(NAMESPACE+"deleteApply", avo);
		
		return result;
	}
	
	// 지원종료 프로젝트 리스트
	@Override
	public List<ProjectVO> endApplyProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE + "endApplyProjectList");
		
		return resultVO;
	}

	// 계약중 프로젝트 리스트
	@Override
	public List<ProjectVO> contractProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"contractProjectList");
		
		return resultVO;
	}

	// 진행중 프로젝트 리스트
	@Override
	public List<ProjectVO> ongoingProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"ongoingProjectList");
		
		return resultVO;
	}

	// 평가 대기중 프로젝트 리스트
	@Override
	public List<ProjectVO> waitEvaluationProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"waitEvaluationProjectList");
		
		return resultVO;
	}

	// 검수중 프로젝트 리스트
	@Override
	public List<ProjectVO> underReviewProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"underReviewProjectList");
		
		return resultVO;
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
	public List<ProjectVO> recruitingProjectList() {
		List<ProjectVO> resultVO = sqlSession.selectList(NAMESPACE+"recruitingProjectList");
		
		return resultVO;
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
	public List<EvaluateProjectDTO> evaluateProjectList() {
		List<EvaluateProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE+"evProjList");
		
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
	public List<EvaluateProjectDTO> completedProjectList() {
		List<EvaluateProjectDTO> resultDTO = sqlSession.selectList(NAMESPACE+"completedProjectList");
		return resultDTO;
	}
	
	// 관심 프리랜서 목록 조회
	@Override
	public List<freeInfoDTO> interestFreelancerList() {
		List<freeInfoDTO> result = sqlSession.selectList(NAMESPACE+"freeInfo");
	    logger.debug("result : " + result.size());
	   
	    return result;
	}

	// 제안한 프리랜서 목록 조회
	@Override
	public List<proposeFreeDTO> proposeFreelancerList() {
		List<proposeFreeDTO> result = sqlSession.selectList(NAMESPACE+"proposeFreelancerList");
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
}
