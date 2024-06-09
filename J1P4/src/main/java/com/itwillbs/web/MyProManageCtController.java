package com.itwillbs.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.ProjectVO;
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
	public void interestFreelancerList(Model model) {
		logger.debug("/interestFreelancer -> interestFreelancerList() 호출");
		
		List<FreelancerVO> interestFreelancerList = myService.interestFreelancerList();
		logger.debug("interestFreelancerList : " + interestFreelancerList.size());
		
		model.addAttribute("interestFreelancerList", interestFreelancerList);
	}		
	
	// 제안한 프리랜서 목록 조회
	// http://localhost:8088/myProManageCt/proposeFreelancer
	@RequestMapping(value = "/proposeFreelancer",method = RequestMethod.GET)
	public void proposeFreelancerList(Model model) {
		logger.debug("/proposeFreelancer -> proposeFreelancerList() 호출");
		
		List<FreelancerVO> proposeFreelancerList = myService.proposeFreelancerList();
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
	
	// 임시저장 프로젝트 목록 조회
	// http://localhost:8088/myProManageCt/temSaveProject
	@RequestMapping(value = "/temSaveProject",method = RequestMethod.GET)
	public void temSaveProjectList(Model model) {
		logger.debug("/temSaveProject -> temSaveProjectList() 호출");
		
		List<ProjectVO> temSaveProjectList = myService.temSaveProjectList();
		logger.debug("temSaveProjectList : " + temSaveProjectList.size());
		
		model.addAttribute("temSaveProjectList", temSaveProjectList);		
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
		
		List<ProjectVO> recruitingProjectList = myService.recruitingProjectList();
		logger.debug("recruitingProjectList : " + recruitingProjectList.size());
		
		model.addAttribute("recruitingProjectList", recruitingProjectList);		
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
		
		List<ProjectVO> ctOngoingProjectList = myService.ctOngoingProjectList();
		logger.debug("ctOngoingProjectList : " + ctOngoingProjectList.size());
		
		model.addAttribute("ctOngoingProjectList", ctOngoingProjectList);		
	}		
	
	// 평가 대기중 프리랜서 목록 조회
	// http://localhost:8088/myProManageCt/waitEvaluationFreelancer
	@RequestMapping(value = "/waitEvaluationFreelancer",method = RequestMethod.GET)
	public void waitEvaluationFreelancerList(Model model) {
		logger.debug("/waitEvaluationFreelancer -> waitEvaluationFreelancerList() 호출");
		
		List<FreelancerVO> waitEvaluationFreelancerList = myService.waitEvaluationFreelancerList();
		logger.debug("waitEvaluationFreelancerList : " + waitEvaluationFreelancerList.size());
		
		model.addAttribute("waitEvaluationFreelancerList", waitEvaluationFreelancerList);		
	}	
	
	// 완료한 프로젝트의 평가완료 프리랜서 목록 조회
	// http://localhost:8088/myProManageCt/completedFreelancer
	@RequestMapping(value = "/completedFreelancer",method = RequestMethod.GET)
	public void completedFreelancer(Model model) {
		logger.debug("/completedFreelancer -> completedFreelancerList() 호출");
		
		List<FreelancerVO> completedFreelancerList = myService.completedFreelancerList();
		logger.debug("completedFreelancerList : " + completedFreelancerList.size());
		
		model.addAttribute("completedFreelancerList", completedFreelancerList);		
	}	
	
	
	
	
	
	
	
	
	
	
}
