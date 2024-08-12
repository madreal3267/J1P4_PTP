package com.itwillbs.web;
 
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.ApplyMgmtVO;
import com.itwillbs.domain.EvaluateProjectDTO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.proposeFreeDTO;
import com.itwillbs.persistence.MyProManageDAO;
import com.itwillbs.service.MyProManageService;

@Controller
@RequestMapping(value = "J1P4_PTP/myProManage/*")
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
	public void interestProjectList(HttpSession session, Model model) {
		logger.debug("/interestProject -> interestProjectList() 호출");	
	
		// 로그로 아이디 확인
		logger.debug("user_id : "+session.getAttribute("user_id")); 
		String user_id = (String)session.getAttribute("user_id");
		
		// 서비스 -> DAO 관심 프로젝트 목록 조회 메서드
		List<ProjectDTO> interestProjectList = myService.interestProjectList(user_id);
		logger.debug("interestProjectList : " + interestProjectList.size());
		
		// DAO 데이터 -> 뷰페이지
		model.addAttribute("interestProjectList", interestProjectList);		
	}
		
	// 제안받은 프로젝트 목록 조회
	// http://localhost:8088/myProManage/proposedProject
	@RequestMapping(value = "/proposedProject",method = RequestMethod.GET)
	public void proposedProjectList(HttpSession session, Model model) {
		logger.debug("/proposedProject -> propoesedProjectList() 호출");
		 
		String user_id = (String)session.getAttribute("user_id");
		
		List<ProjectDTO> proposedProjectList = myService.proposedProjectList(user_id);
		logger.debug("proposedProjectList : " + proposedProjectList.size());
		
		model.addAttribute("proposedProjectList", proposedProjectList);
		
	}	
	
	// 지원 중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/applyingProject
	@RequestMapping(value = "/applyingProject",method = RequestMethod.GET)
	public void applyingProjectList(HttpSession session, Model model) {
		logger.debug("/applyingProject -> applyingProjectList() 호출");
		
		String user_id = (String)session.getAttribute("user_id");
		
		List<ProjectDTO> applyingProjectList = myService.applyingProjectList(user_id);
		logger.debug("applyingProjectList : " + applyingProjectList.size());
		
		model.addAttribute("applyingProjectList", applyingProjectList);		
	}		
	
	// 지원 중 프로젝트 목록 - 지원 취소	
	@RequestMapping(value = "/applyingProject",method = RequestMethod.POST)
	public String deleteApply(ApplyMgmtVO avo, RedirectAttributes rttr) {
		logger.debug("/applyingProject -> deleteApply(applyMgmtVO avo) 호출");
		
		int result = myService.deleteApply(avo);
		
		if(result == 1) {
			logger.debug("지원 취소되었습니다.");
		}
		// 지원 취소 정보를 전달
		rttr.addFlashAttribute("msg", "deletApply");
		
		return "redirect:/myProManage/applyingProject";
	}
	
	// 지원 중 프로젝트 목록 - 제안 동의
	@RequestMapping(value = "/agreeContract",method = RequestMethod.POST)
	public String agreeContract(proposeFreeDTO pfdto, RedirectAttributes rttr) {
		logger.debug("/agreeContract -> agreeContract(proposeFreeDTO pfdto) 호출");
		
		myService.agreeContract(pfdto);
		
		// 지원 취소 정보를 전달
		rttr.addFlashAttribute("msg", "deletApply");
		
		return "redirect:/myProManage/applyingProject";
	}
	
		
	// 지원 종료 프로젝트 목록 조회
	// http://localhost:8088/myProManage/endApplyProject
	@RequestMapping(value = "/endApplyProject",method = RequestMethod.GET)
	public void endApplyProjectList(HttpSession session, Model model) {
		logger.debug("/endApplyProject -> endApplyProjectList() 호출");
		
		String user_id = (String)session.getAttribute("user_id");
		
		List<ProjectDTO> endApplyProjectList = myService.endApplyProjectList(user_id);
		logger.debug("endApplyProjectList : " + endApplyProjectList.size());
		
		model.addAttribute("endApplyProjectList", endApplyProjectList);		
	}	
	
	// 지원 종료 프로젝트 목록 - 지원 종료 목록에서 삭제	
	@RequestMapping(value = "/endApplyProject",method = RequestMethod.POST)
	public String deleteEndApply(ApplyMgmtVO avo, RedirectAttributes rttr) {
		logger.debug("/endApplyProject -> deleteEndApply(applyMgmtVO avo) 호출");
		
		int result = myService.deleteApply(avo);
		
		if(result == 1) {
			logger.debug("지원 목록에서 삭제하였습니다.");
		}
		
		// 지원 취소 정보를 전달
		rttr.addFlashAttribute("msg", "deletApply");
		
		return "redirect:/myProManage/endApplyProject";
	}
	
	// 계약 진행 중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/contractProject	
	@RequestMapping(value = "/contractProject",method = RequestMethod.GET)
	public void contractProjectList(HttpSession session, Model model) {
		logger.debug("/contractProject -> contractProjectList() 호출");
		
		String user_id = (String)session.getAttribute("user_id");
		
		List<ProjectDTO> contractProjectList = myService.contractProjectList(user_id);
		logger.debug("contractProjectList : " + contractProjectList.size());
		
		model.addAttribute("contractProjectList", contractProjectList);		
	}
	
	// 계약 진행 중 프로젝트 목록 - 지원 취소	
	@RequestMapping(value = "/contractProject",method = RequestMethod.POST)
	public String deleteApplyContractProject(ApplyMgmtVO avo) {
		logger.debug("/contractProject -> deleteApplyContractProject(applyMgmtVO avo) 호출");
		
		int result = myService.deleteApply(avo);
		
		if(result == 1) {
			logger.debug("지원 취소되었습니다.");
		}
		return "redirect:/myProManage/contractProject";
	}
	
	// 프로젝트 진행중 목록 조회
	// http://localhost:8088/myProManage/ongoingProject	
	@RequestMapping(value = "/ongoingProject",method = RequestMethod.GET)
	public void ongoingProjectList(HttpSession session, Model model) {
		logger.debug("/ongoingProject -> ongoingProjectList() 호출");
		
		String user_id = (String)session.getAttribute("user_id");
		
		List<ProjectDTO> ongoingProjectList = myService.ongoingProjectList(user_id);
		logger.debug("ongoingProjectList : " + ongoingProjectList.size());
		
		model.addAttribute("ongoingProjectList", ongoingProjectList);		
	}	
	
	// 평가 대기중 프로젝트 목록 조회
	// http://localhost:8088/myProManage/waitEvaluationProject	
	@RequestMapping(value = "/waitEvaluationProject",method = RequestMethod.GET)
	public void waitEvaluationProjectList(HttpSession session,Model model) {
		logger.debug("/waitEvaluationProject -> waitEvaluationProjectList() 호출");
	
		String user_id = (String)session.getAttribute("user_id");
		
	// 프로젝트 평가 여부 체크 후 평가 대기중 프로젝트 목록 조회
		List<EvaluateProjectDTO> waitEvaluationProjectList = myService.evaluateProjectList(user_id);
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
	public String evaluationProject(EvaluateProjectDTO edto, RedirectAttributes rttr) {
		logger.debug("/waitEvaluationProject -> evaluationProject() 호출");
		myService.evaluateProject(edto);
		
		rttr.addFlashAttribute("msg", "evaluateOK");
		
		return "redirect:/myProManage/completedProject";
		
	}			
	
	// 완료한 프로젝트 목록 조회
	// http://localhost:8088/myProManage/completedProject
	@RequestMapping(value = "/completedProject",method = RequestMethod.GET)
	public void completedProjectList(HttpSession session, Model model) {
		logger.debug("/completedProject -> completedProjectList() 호출");
		
		String user_id = (String)session.getAttribute("user_id");
		
		List<EvaluateProjectDTO> completedProjectList = myService.completedProjectList(user_id);
		List<EvaluateProjectDTO> filteredProjList = new ArrayList<>();

		for (EvaluateProjectDTO project : completedProjectList) {
		    if (myService.checkEvaluate(project) == 1) {
		        filteredProjList.add(project);
		    }
		}
		logger.debug("q(≧▽≦q)q(≧▽≦q)q(≧▽≦q)q(≧▽≦q)q(≧▽≦q) 필터링된 프로젝트 : " + filteredProjList.size());

		if (!filteredProjList.isEmpty()) {
		    logger.debug("filteredProjList : " + filteredProjList.size());
		    model.addAttribute("completedProjectList", filteredProjList);
		} else {
		    logger.debug("No projects found for evaluation.");
		}		
		
	}	
	
	// 완료한 프로젝트 평가 수정하기
	@RequestMapping(value = "/completedProject",method = RequestMethod.POST)
	public String updateEvaluate(EvaluateProjectDTO edto, RedirectAttributes rttr) {
		logger.debug("/completedProject -> updateEvaluate(EvaluateProjectDTO edto) 호출");
		
		myService.updateEvaluate(edto);
		
		rttr.addFlashAttribute("msg", "modifyOK");
		
		return "redirect:/myProManage/completedProject";
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
