package com.itwillbs.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ApplyMgmtVO;
import com.itwillbs.domain.EvaluateProjectDTO;
import com.itwillbs.domain.ProjectDTO;
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
	
	// 관심 프로젝트 목록 - 조회
	// http://localhost:8088/myProManage/interestProject
	@RequestMapping(value = "/interestProject", method = RequestMethod.GET)
	public void interestProjectList(Model model) {
		logger.debug("/interestProject -> interestProjectList() 호출");
		
		// 서비스 -> DAO 관심 프로젝트 목록 조회 메서드
		List<ProjectDTO> interestProjectList = myService.interestProjectList();
		logger.debug("interestProjectList : " + interestProjectList.size());
		
		// DAO 데이터 -> 뷰페이지
		model.addAttribute("interestProjectList", interestProjectList);		
	}
	
	// 관심 프로젝트 목록 - 지원하기
	@RequestMapping(value = "/interestProject",method = RequestMethod.POST)
	public String interestProjectApply(ApplyMgmtVO avo) {
		logger.debug("/interestProject -> interestProjectApply() 호출");
		
		myService.applyProject(avo);
		
		return "redirect:/myProManage/applyingProject";
	}
	
	// 제안받은 프로젝트 목록 조회
	// http://localhost:8088/myProManage/proposedProject
	@RequestMapping(value = "/proposedProject",method = RequestMethod.GET)
	public void proposedProjectList(Model model) {
		logger.debug("/proposedProject -> propoesedProjectList() 호출");
		
		List<ProjectDTO> proposedProjectList = myService.proposedProjectList();
		logger.debug("proposedProjectList : " + proposedProjectList.size());
		
		model.addAttribute("proposedProjectList", proposedProjectList);
		
	}	
	
	// 제안받은 프로젝트 - 지원하기
	@RequestMapping(value = "/proposedProject",method = RequestMethod.POST)
	public String proposedProjectApply(ApplyMgmtVO avo) {
		logger.debug("/proposedProject -> proposedProjectApply() 호출");
		
		myService.applyProject(avo);
		
		return "redirect:/myProManage/applyingProject";
	}
	
	// 지원 중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/applyingProject
	@RequestMapping(value = "/applyingProject",method = RequestMethod.GET)
	public void applyingProjectList(Model model) {
		logger.debug("/applyingProject -> applyingProjectList() 호출");
		
		List<ProjectDTO> applyingProjectList = myService.applyingProjectList();
		logger.debug("applyingProjectList : " + applyingProjectList.size());
		
		model.addAttribute("applyingProjectList", applyingProjectList);		
	}		
	
	// 지원 중 프로젝트 목록 - 지원 취소	
	@RequestMapping(value = "/applyingProject",method = RequestMethod.POST)
	public String deleteApply(ApplyMgmtVO avo) {
		logger.debug("/applyingProject -> deleteApply(applyMgmtVO avo) 호출");
		
		int result = myService.deleteApply(avo);
		
		if(result == 1) {
			logger.debug("지원 취소되었습니다.");
		}
		return "redirect:/myProManage/applyingProject";
	}
		
	// 지원 종료 프로젝트 목록 조회
	// http://localhost:8088/myProManage/endApplyProject
	@RequestMapping(value = "/endApplyProject",method = RequestMethod.GET)
	public void endApplyProjectList(Model model) {
		logger.debug("/endApplyProject -> endApplyProjectList() 호출");
		
		List<ProjectDTO> endApplyProjectList = myService.endApplyProjectList();
		logger.debug("endApplyProjectList : " + endApplyProjectList.size());
		
		model.addAttribute("endApplyProjectList", endApplyProjectList);		
	}	
	
	// 지원 종료 프로젝트 목록 - 지원 종료 목록에서 삭제	
	@RequestMapping(value = "/endApplyProject",method = RequestMethod.POST)
	public String deleteEndApply(ApplyMgmtVO avo) {
		logger.debug("/endApplyProject -> deleteEndApply(applyMgmtVO avo) 호출");
		
		int result = myService.deleteApply(avo);
		
		if(result == 1) {
			logger.debug("지원 목록에서 삭제하였습니다.");
		}
		return "redirect:/myProManage/endApplyProject";
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
		
		List<ProjectDTO> ongoingProjectList = myService.ongoingProjectList();
		logger.debug("ongoingProjectList : " + ongoingProjectList.size());
		
		model.addAttribute("ongoingProjectList", ongoingProjectList);		
	}	
	
	// 평가 대기중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/waitEvaluationProject	
	@RequestMapping(value = "/waitEvaluationProject",method = RequestMethod.GET)
	public void waitEvaluationProjectList(Model model) {
		logger.debug("/waitEvaluationProject -> waitEvaluationProjectList() 호출");
		
	// 프로젝트 평가 여부 체크 후 평가 대기중 프로젝트 목록 조회
		List<EvaluateProjectDTO> waitEvaluationProjectList = myService.evaluateProjectList();
		List<EvaluateProjectDTO> filteredProjList = new ArrayList<>();

		for (EvaluateProjectDTO project : waitEvaluationProjectList) {
		    if (myService.checkEvaluate(project) == 0) {
		        filteredProjList.add(project);
		    }
		}

		if (!filteredProjList.isEmpty()) {
		    logger.debug("filteredProjList : " + filteredProjList.size());
		    model.addAttribute("waitEvaluationProjectList", filteredProjList);
		} else {
		    logger.debug("No projects found for evaluation.");
		}
	}		
	
	// 평가 대기중 프로젝트 - 평가하기
	@RequestMapping(value = "/waitEvaluationProject",method = RequestMethod.POST)
	public void evaluationProject(EvaluateProjectDTO edto) {
		logger.debug("/waitEvaluationProject -> evaluationProject() 호출");
		myService.evaluateProject(edto);
		
	}			
	
	// 완료한 프로젝트 목록 조회
	// http://localhost:8088/myProManage/completedProject
	@RequestMapping(value = "/completedProject",method = RequestMethod.GET)
	public void completedProjectList(EvaluateProjectDTO edto, Model model,
			@RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "5") int pageSize) {
		logger.debug("/completedProject -> completedProjectList() 호출");
		
		List<EvaluateProjectDTO> completedProjectList = myService.completedProjectList();
		List<EvaluateProjectDTO> filteredProjList = new ArrayList<>();

		for (EvaluateProjectDTO project : completedProjectList) {
		    if (myService.checkEvaluate(project) == 1) {
		        filteredProjList.add(project);
		    }
		}
		logger.debug("q(≧▽≦q)q(≧▽≦q)q(≧▽≦q)q(≧▽≦q)q(≧▽≦q)" + filteredProjList.size());
		int totalProjects = filteredProjList.size();
		int totalPages = (int) Math.ceil((double) totalProjects / pageSize);
		
		int startIndex = (page - 1) * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalProjects);
		List<EvaluateProjectDTO> pageProjects = filteredProjList.subList(startIndex, endIndex);
		
		model.addAttribute("pageProjects", pageProjects);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pageSize", pageSize);

		if (!filteredProjList.isEmpty()) {
		    logger.debug("filteredProjList : " + filteredProjList.size());
		    model.addAttribute("completedProjectList", filteredProjList);
		} else {
		    logger.debug("No projects found for evaluation.");
		}		
		
	}	
	
	// 완료한 프로젝트 평가 수정하기
	@RequestMapping(value = "/completedProject",method = RequestMethod.POST)
	public String updateEvaluate(EvaluateProjectDTO edto) {
		logger.debug("/completedProject -> updateEvaluate(EvaluateProjectDTO edto) 호출");
		
		myService.updateEvaluate(edto);
		
		return "redirect:/myProManage/completedProject";
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
