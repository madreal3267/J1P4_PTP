package com.itwillbs.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.persistence.MyProManageDAO;
import com.itwillbs.service.MyProManageService;

@Controller
@RequestMapping(value = "/myProManage/*")
public class MyProManageController {

	private static final Logger logger = LoggerFactory.getLogger(MyProManageController.class);
	
	@Inject
	private MyProManageService myService;
	
	// http://localhost:8088/myProManage/dbtime
	@RequestMapping(value = "/dbtime", method = RequestMethod.GET)
	public void showDBTime(Model model) {
		logger.debug("서버시간 : " + myService.getDBTime());
		
		String serverTime = myService.getDBTime();
		
		model.addAttribute("serverTime", serverTime);
	}
	
	// 관심 프로젝트 목록 조회
	// http://localhost:8088/myProManage/interestProject
	@RequestMapping(value = "/interestProject", method = RequestMethod.GET)
	public void interestProjectList(Model model) {
		logger.debug("/interestProjectList -> interestProjectList() 호출");
		
		// 서비스 -> DAO 관심 프로젝트 목록 조회 메서드
		List<ProjectVO> interestProjectList = myService.interestProjectList();
		logger.debug("interestProjectList : " + interestProjectList.size());
		
		// DAO 데이터 -> 뷰페이지
		model.addAttribute("interestProjectList", interestProjectList);		
	}
	
	// 제안받은 프로젝트 목록 조회
	// http://localhost:8088/myProManage/proposedProject
	@RequestMapping(value = "/proposedProject",method = RequestMethod.GET)
	public void proposedProjectList(Model model) {
		logger.debug("/proposedProject -> propoesedProjectList() 호출");
		
		List<ProjectVO> proposedProjectList = myService.proposedProjectList();
		logger.debug("proposedProjectList : " + proposedProjectList.size());
		
		model.addAttribute("proposedProjectList", proposedProjectList);
	}	
	
	// 지원 중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/applyingProject
	@RequestMapping(value = "/applyingProject",method = RequestMethod.GET)
	public void applyingProjectList(Model model) {
		logger.debug("/applyingProject -> applyingProjectList() 호출");
		
		List<ProjectVO> applyingProjectList = myService.applyingProjectList();
		logger.debug("applyingProjectList : " + applyingProjectList.size());
		
		model.addAttribute("applyingProjectList", applyingProjectList);		
	}		
		
	// 지원 종료 프로젝트 목록 조회
	// http://localhost:8088/myProManage/endApplyProject
	@RequestMapping(value = "/endApplyProject",method = RequestMethod.GET)
	public void endApplyProjectList(Model model) {
		logger.debug("/endApplyProject -> endApplyProjectList() 호출");
		
		List<ProjectVO> endApplyProjectList = myService.endApplyProjectList();
		logger.debug("endApplyProjectList : " + endApplyProjectList.size());
		
		model.addAttribute("endApplyProjectList", endApplyProjectList);		
	}	
	
	// 계약 진행 중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/contractProject	
	@RequestMapping(value = "/contractProject",method = RequestMethod.GET)
	public void contractProjectList(Model model) {
		logger.debug("/contractProject -> contractProjectList() 호출");
		
		List<ProjectVO> contractProjectList = myService.contractProjectList();
		logger.debug("contractProjectList : " + contractProjectList.size());
		
		model.addAttribute("contractProjectList", contractProjectList);		
	}
	
	// 프로젝트 진행중 목록 조회
	// http://localhost:8088/myProManage/ongoingProject	
	@RequestMapping(value = "/ongoingProject",method = RequestMethod.GET)
	public void ongoingProjectList(Model model) {
		logger.debug("/ongoingProject -> ongoingProjectList() 호출");
		
		List<ProjectVO> ongoingProjectList = myService.ongoingProjectList();
		logger.debug("ongoingProjectList : " + ongoingProjectList.size());
		
		model.addAttribute("ongoingProjectList", ongoingProjectList);		
	}	
	
	// 평가 대기중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/waitEvaluationProject	
	@RequestMapping(value = "/waitEvaluationProject",method = RequestMethod.GET)
	public void waitEvaluationProjectList(Model model) {
		logger.debug("/waitEvaluationProject -> waitEvaluationProjectList() 호출");
		
		List<ProjectVO> waitEvaluationProjectList = myService.waitEvaluationProjectList();
		logger.debug("waitEvaluationProjectList : " + waitEvaluationProjectList.size());
		
		model.addAttribute("waitEvaluationProjectList", waitEvaluationProjectList);		
	}		
	
	// 완료한 프로젝트 목록 조회
	// http://localhost:8088/myProManage/completedProject
	@RequestMapping(value = "/completedProject",method = RequestMethod.GET)
	public void completedProjectList(Model model,
			@RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "5") int pageSize) {
		logger.debug("/completedProject -> completedProjectList() 호출");
		
		List<ProjectVO> completedProjectList = myService.completedProjectList();
        int totalProjects = completedProjectList.size();
        int totalPages = (int) Math.ceil((double) totalProjects / pageSize);

        int startIndex = (page - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalProjects);
        List<ProjectVO> pageProjects = completedProjectList.subList(startIndex, endIndex);

        model.addAttribute("pageProjects", pageProjects);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pageSize", pageSize);
		
				
	}		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
