package com.itwillbs.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.service.EnrollFreeService;

@Controller
@RequestMapping(value="/enroll/*")
public class EnrollFreeController {

	private static final Logger logger = LoggerFactory.getLogger(EnrollFreeController.class);
	
	@Inject
	private EnrollFreeService fService;
	
	// http://localhost:8088/enroll/enrollFree
	@GetMapping(value="/enrollFree")
	public void enrollFreeGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollFree -> enrollFreeGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollFree.jsp 페이지 연결 ");
	}
	
	@PostMapping(value="/enrollFree")
	public String enrollFreePOST(FreelancerVO fVO,CareerVO cVO, LicenseVO lVO, SkillVO sVO, RegionVO rVO) {		
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollFree -> enrollFreePOST() 실행 ");
		
		fService.insertFree(fVO);
		fService.insertCareer(cVO);
		fService.insertLicense(lVO);
		fService.insertSkill(sVO);
		fService.insertReg(rVO);
		
		return "redirect:/enroll/enrollSuccess";
	}
	
	// http://localhost:8088/enroll/enrollFreeB
	@GetMapping(value="/enrollFreeB")
	public void enrollFreeBGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollFreeB -> enrollFreeBGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollFree.jsp 페이지 연결 ");
	}
	
	@PostMapping(value="/enrollFreeB")
	public String enrollFreeBPOST(FreelancerVO fVO,CareerVO cVO, PartnersVO pVO, CompanyVO cpVO, SkillVO sVO, RegionVO rVO) {		
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollFree -> enrollFreeBPOST() 실행 ");
		
		fService.insertFree(fVO);
		fService.insertCareer(cVO);
		fService.insertPartners(pVO);
		fService.insertComp(cpVO);
		fService.insertSkill(sVO);
		fService.insertReg(rVO);
		
		return "redirect:/enroll/enrollSuccess";
	}
	
	@GetMapping(value="/enrollSuccess")
	public void enrollSuccessGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollFree -> enrollSuccessGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollSuccess.jsp 페이지 연결 ");		
	}
	
}
