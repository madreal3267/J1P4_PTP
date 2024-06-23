package com.itwillbs.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.EvaluateFreelancerDTO;
import com.itwillbs.domain.EvaluateProjectDTO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.ProjectDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.ctOngoingProjectDTO;
import com.itwillbs.domain.freeInfoDTO;
import com.itwillbs.domain.proposeFreeDTO;
import com.itwillbs.persistence.MyProManageDAO;
import com.itwillbs.service.MyProManageService;

@Controller
@RequestMapping(value = "/myProManageCt/*")
public class MyProManageCtController {

	private static final Logger logger = LoggerFactory.getLogger(MyProManageCtController.class);
	
	@Inject
	private MyProManageService myService;
	
	// 관심 프리랜서 목록 조회
	// http://localhost:8088/myProManageCt/interestFreelancer
	@RequestMapping(value = "/interestFreelancer",method = RequestMethod.GET)
	public void interestFreelancerList(Criteria cri, Model model) {
		logger.debug("/interestFreelancer -> interestFreelancerList() 호출");
		
		List<freeInfoDTO> interestFreelancerList = myService.interestFreelancerList();
		logger.debug("interestFreelancerList : " + interestFreelancerList.size());
		
		model.addAttribute("interestFreelancerList", interestFreelancerList);
	}
	
	// 프로젝트 지원하기
	
	
	// 제안한 프리랜서 목록 조회
	// http://localhost:8088/myProManageCt/proposeFreelancer
	@RequestMapping(value = "/proposeFreelancer",method = RequestMethod.GET)
	public void proposeFreelancerList(Model model) {
		logger.debug("/proposeFreelancer -> proposeFreelancerList() 호출");
		
		List<proposeFreeDTO> proposeFreelancerList = myService.proposeFreelancerList();
		logger.debug("proposeFreelancerList : " + proposeFreelancerList.size());
		
		model.addAttribute("proposeFreelancerList", proposeFreelancerList);
	}		
	
	// 검수중 프로젝트 목록 조회
	// http://localhost:8088/myProManageCt/underReviewProject
	@RequestMapping(value = "/underReviewProject",method = RequestMethod.GET)
	public void underReviewProjectList(Model model) {
		logger.debug("/underReviewProject -> underReviewProjectList() 호출");
		
		List<ProjectVO> underReviewProjectList = myService.underReviewProjectList();
		logger.debug("underReviewProjectList : " + underReviewProjectList.size());
		
		model.addAttribute("underReviewProjectList", underReviewProjectList);		
	}	
	
	// 검수중 프로젝트 목록 - 프로젝트 삭제하기
	@RequestMapping(value = "/underReviewProject",method = RequestMethod.POST)
	public String deleteUnderReviewProject(int proj_no, RedirectAttributes rttr) {
		logger.debug("/underReviewProject -> deleteUnderReviewProject(int proj_no) 호출");
		
		int result = myService.deleteProject(proj_no);

		if(result == 1) {
			logger.debug("프로젝트를 삭제하였습니다.");
		}		
		// 삭제 성공 정보를 전달
		rttr.addFlashAttribute("msg", "deleteProject");
		
		return "redirect:/myProManageCt/underReviewProject";
	}
	
	// 임시저장 프로젝트 목록 조회
	// http://localhost:8088/myProManageCt/temSaveProject
	@RequestMapping(value = "/temSaveProject",method = RequestMethod.GET)
	public void temSaveProjectList(Model model) {
		logger.debug("/temSaveProject -> temSaveProjectList() 호출");
		
		List<ProjectVO> temSaveProjectList = myService.temSaveProjectList();
		logger.debug("temSaveProjectList : " + temSaveProjectList.size());
		
		model.addAttribute("temSaveProjectList", temSaveProjectList);		
	}		
	
	// 임시저장 프로젝트 목록 - 프로젝트 삭제하기
	@RequestMapping(value = "/temSaveProject",method = RequestMethod.POST)
	public String deletetemSaveProject(int proj_no, RedirectAttributes rttr) {
		logger.debug("/temSaveProject -> temSaveProject(int proj_no) 호출");
		
		int result = myService.deleteProject(proj_no);

		if(result == 1) {
			logger.debug("프로젝트를 삭제하였습니다.");
		}		
		// 삭제 성공 정보를 전달
		rttr.addFlashAttribute("msg", "deleteProject");
		
		return "redirect:/myProManageCt/temSaveProject";
	}
	
	// 등록실패 프로젝트 목록 조회
	// http://localhost:8088/myProManageCt/regFailedProject
	@RequestMapping(value = "/regFailedProject",method = RequestMethod.GET)
	public void regFailedProjectList(Model model) {
		logger.debug("/regFailedProject -> regFailedProjectList() 호출");
		
		List<ProjectVO> regFailedProjectList = myService.regFailedProjectList();
		logger.debug("regFailedProjectList : " + regFailedProjectList.size());
		
		model.addAttribute("regFailedProjectList", regFailedProjectList);		
	}		
	
	// 지원자 모집중 프로젝트 목록 조회
	// http://localhost:8088/myProManageCt/recruitingProject
	@RequestMapping(value = "/recruitingProject",method = RequestMethod.GET)
	public void recruitingProjectList(Model model) {
		logger.debug("/recruitingProject -> recruitingProjectList() 호출");
		
		List<proposeFreeDTO> recruitingProjectList = myService.recruitingProjectList();
		logger.debug("recruitingProjectList : " + recruitingProjectList.size());
		
		model.addAttribute("recruitingProjectList", recruitingProjectList);		
	}		
	
	// 지원자 모집중 프로젝트 목록 - 지원 거절
	@RequestMapping(value = "/rejectApply",method = RequestMethod.POST)
	public String rejectApply(proposeFreeDTO pfdto, RedirectAttributes rttr) {
		logger.debug("/rejectApply -> rejectApply() 호출");
		
		myService.rejectApply(pfdto);
		rttr.addFlashAttribute("msg", "rejectApply");
		
		return "redirect:/myProManageCt/recruitingProject";
	}
	
	// 지원자 모집중 프로젝트 목록 - 계약하기
	@RequestMapping(value = "/contractFree",method = RequestMethod.POST)
	public String contractFree(proposeFreeDTO pfdto, RedirectAttributes rttr) {
		logger.debug("/contractFree -> contractFree() 호출");
		
		myService.contractFree(pfdto);
		rttr.addFlashAttribute("msg", "contractOffer");
		
		return "redirect:/myProManageCt/recruitingProject";
	}
	
	// 계약 진행중 프로젝트 목록 조회
	// http://localhost:8088/myProManageCt/ctContractProject
	@RequestMapping(value = "/ctContractProject",method = RequestMethod.GET)
	public void ctContractProjectList(Model model) {
		logger.debug("/ctContractProject -> ctContractProjectList() 호출");
		
		List<ProjectVO> ctContractProjectList = myService.ctContractProjectList();
		logger.debug("ctContractProjectList : " + ctContractProjectList.size());
		
		model.addAttribute("ctContractProjectList", ctContractProjectList);		
	}		
	
	// 프로젝트 진행중 목록 조회
	// http://localhost:8088/myProManageCt/ctOngoingProject
	@RequestMapping(value = "/ctOngoingProject",method = RequestMethod.GET)
	public void ctOngoingProjectList(Model model) {
		logger.debug("/ctOngoingProject -> ctOngoingProjectList() 호출");
		
		List<ctOngoingProjectDTO> ctOngoingProjectList = myService.ctOngoingProjectList();
		logger.debug("ctOngoingProjectList : " + ctOngoingProjectList.size());
		
		model.addAttribute("ctOngoingProjectList", ctOngoingProjectList);		
	}		
	
	// 프로젝트 진행중 프로젝트 - 결제하기
	
	// 프로젝트 진행중 프로젝트 - 완료하기
	@RequestMapping(value = "/requestSettlement",method = RequestMethod.POST)
	public String requestSettlement(ctOngoingProjectDTO cdto, RedirectAttributes rttr) {
		logger.debug("/requestSettlement -> requestSettlement(ctOngoingProjectDTO cdto) 호출");
		myService.requestSettlement(cdto);
		
		rttr.addFlashAttribute("msg", "requestSettlement");
		
		return "redirect:/myProManageCt/ctOngoingProject";
	}
	
	// 평가 대기중 프리랜서 목록 조회
	// http://localhost:8088/myProManageCt/waitEvaluationFreelancer
	@RequestMapping(value = "/waitEvaluationFreelancer",method = RequestMethod.GET)
	public void waitEvaluationFreelancerList(Model model) {
		logger.debug("/waitEvaluationFreelancer -> waitEvaluationFreelancerList() 호출");
		
		// 프리랜서 평가 여부 체크후 평가 대기중 프리랜서 목록조회
		List<EvaluateFreelancerDTO> waitEvaluationFreelancerList = myService.waitEvaluationFreelancerList();
		List<EvaluateFreelancerDTO> filteredFreeList = new ArrayList<EvaluateFreelancerDTO>();
		
		for (EvaluateFreelancerDTO freelancer : waitEvaluationFreelancerList) {
		    if (myService.checkEvaluateFree(freelancer) == 0) {
		    	filteredFreeList.add(freelancer);
		    }
		}
		
		// 평가 미입력 프리랜서만 필터링해서 모델에 추가
		if (!filteredFreeList.isEmpty()) {
		    logger.debug("filteredFreeList : " + filteredFreeList.size());
		    model.addAttribute("waitEvaluationFreelancerList", filteredFreeList);
		} else {
		    logger.debug("No freelancer found for evaluation.");
		}
	}	
	
	// 평가 대기중 프리랜서 - 평가하기
	@RequestMapping(value = "/waitEvaluationFreelancer",method = RequestMethod.POST)
	public String evaluationFreelancer(EvaluateFreelancerDTO edto, RedirectAttributes rttr) {
		logger.debug("/waitEvaluationFreelancer -> evaluationFreelancer(EvaluateProjectDTO edto) 호출");
		myService.evaluateFreelancer(edto);
		
		rttr.addFlashAttribute("msg", "evaluateOK");
		
		return "redirect:/myProManageCt/completedFreelancer";
	}			
	
	// 완료한 프로젝트의 평가완료 프리랜서 목록 조회
	// http://localhost:8088/myProManageCt/completedFreelancer
	@RequestMapping(value = "/completedFreelancer",method = RequestMethod.GET)
	public void completedFreelancerList(Model model) {
		logger.debug("/completedFreelancer -> completedFreelancerList() 호출");
		
		List<EvaluateFreelancerDTO> completedFreelancerList = myService.completedFreelancerList();
		logger.debug("completedFreelancerList : " + completedFreelancerList.size());
		
		model.addAttribute("completedFreelancerList", completedFreelancerList);		
	}	
	
	// 완료한 프로젝트 - 프리랜서 평가 수정하기
	@RequestMapping(value = "/completedFreelancer",method = RequestMethod.POST)
	public String updateEvaluateFree(EvaluateFreelancerDTO edto, RedirectAttributes rttr) {
		logger.debug("/completedFreelancer -> updateEvaluateFree(EvaluateFreelancerDTO edto) 호출");
		
		myService.updateEvaluateFree(edto);
		
		rttr.addFlashAttribute("msg", "modifyOK");
		
		return "redirect:/myProManageCt/completedFreelancer";
	}	
	
}
