package com.itwillbs.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.CareerVO;
import com.itwillbs.domain.CompanyVO;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.LicenseVO;
import com.itwillbs.domain.PartnersVO;
import com.itwillbs.domain.PortfolioVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.service.EnrollFreeService;
import com.itwillbs.service.MyProfileService;

@Controller
@RequestMapping(value = "J1P4_PTP/myProfile/*")
public class MyProfileController {

	private static final Logger logger = LoggerFactory.getLogger(MyProfileController.class);
	
	@Inject
	private MyProfileService mpService;
	
	@Inject
	private EnrollFreeService efService;
	
	// 내 프로필 페이지 연결 - 개인 / 팀
	// http://localhost:8088/myProfile/profile?free_no=366
	@GetMapping(value="/profile")
	public String profileGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session,HttpServletResponse response,String id) throws IOException {
		logger.debug(" Controller : ( •̀ ω •́ )y /profile -> profileGET 실행 ");
		
		vo.setFree_no(free_no);
		
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+vo.getFree_no());
		vo.setFree_id(String.valueOf(session.getAttribute("user_id")));
		id = String.valueOf(session.getAttribute("user_id"));
		
		if(session.getAttribute("user_type").equals("개인") || session.getAttribute("user_type").equals("모임")) {
			if(session.getAttribute("free_no").equals(free_no)) {				
				model.addAttribute("myProfile", mpService.getProfile(vo));
				model.addAttribute("mySkill", mpService.getSkill(vo));
				model.addAttribute("myReg",mpService.getReg(vo));
				model.addAttribute("myCareer", mpService.getCareer(vo));
				model.addAttribute("myLicense", mpService.getLicense(vo));
				model.addAttribute("myPortf", mpService.getPortf(vo));
				model.addAttribute("myUser",mpService.getUser(vo));
				return "/myProfile/profile";
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script> alert('hey Thats not your profile!');");
				out.println("history.back();</script>");
				out.close();
				return null;
			}
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script> alert('You are not Solo or Team');");
			out.println("history.back();</script>");
			out.close();
			return null;
		}
		

	}
	
	// 내 프로필 수정하기 페이지 연결 - 개인 / 팀
	@GetMapping(value="/modify")
	public String profModifyGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session) {
		logger.debug(" Controller : ( •̀ ω •́ )y /modify -> profModifyGET 실행 ");
		
		vo.setFree_no(free_no);
		vo.setFree_id(String.valueOf(session.getAttribute("user_id")));
		
		model.addAttribute("myProfile", mpService.getProfile(vo));
		model.addAttribute("mySkill", mpService.getSkill(vo));
		model.addAttribute("myReg",mpService.getReg(vo));
		model.addAttribute("myCareer", mpService.getCareer(vo));
		model.addAttribute("myLicense", mpService.getLicense(vo));
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/myProfile/modify.jsp 페이지 연결 ");
		
		return "/myProfile/modify";
		
	}
	
	// 내 프로필 수정하기 - 개인 / 팀
	@PostMapping(value="/modify")
	public String profModifyPOST(FreelancerVO fVO,SkillVO sVO, RegionVO rVO, CareerVO cVO, LicenseVO lVO,PortfolioVO pVO,HttpSession session){
		logger.debug(" Controller : ( •̀ ω •́ )y /modify -> profModifyPOST 실행 ");
		
		int free_no = (int) session.getAttribute("free_no");
		pVO.setFree_no(free_no);
		int chk = pVO.getFree_no();
		efService.updateFree(fVO);
		efService.updateSkill(sVO);
		efService.updateReg(rVO);
		efService.updateCareer(cVO);
		efService.updateLicense(lVO);
		efService.updatePortf(pVO);
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/myProfile/modify.jsp 페이지 연결 ");
		
		return "/myProfile/modify";

	}
	
	// 내 프로필 페이지 연결 - 사업자
	// http://localhost:8088/myProfile/profileB?free_no=366
	@GetMapping(value="/profileB")
	public String profileBGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session,HttpServletResponse response,String id) throws IOException {
		logger.debug(" Controller : ( •̀ ω •́ )y /profileB -> profileBGET 실행 ");
		logger.debug("@@@@@@@@@@@@@@"+vo.getFree_id());
		logger.debug("@@@@@@@@@@@@@@"+vo.getFree_no());
		
		vo.setFree_no(free_no);
		vo.setFree_id(String.valueOf(session.getAttribute("user_id")));
		id = String.valueOf(session.getAttribute("user_id"));
		logger.debug("@@@@@@@@@@@@@@"+vo.getFree_id());
		logger.debug("@@@@@@@@@@@@@@"+vo.getFree_no());
		
		if(session.getAttribute("user_type").equals("사업자")) {			
			if(session.getAttribute("free_no").equals(free_no)) {
				model.addAttribute("myProfile", mpService.getProfile(vo));
				model.addAttribute("mySkill", mpService.getSkill(vo));
				model.addAttribute("myReg",mpService.getReg(vo));
				model.addAttribute("myCareer", mpService.getCareer(vo));
				model.addAttribute("myComp", mpService.getComp(vo));
				model.addAttribute("myPartn", mpService.getPartn(vo));
				model.addAttribute("myPortf", mpService.getPortf(vo));
				model.addAttribute("myUser",mpService.getUser(vo));
				return "/myProfile/profileB";
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script> alert('hey Thats not your profile!');");
				out.println("history.back();</script>");
				out.close();
				return null;
			}
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script> alert('You are not Businessman');");
			out.println("history.back();</script>");
			out.close();
			return null;
		}
		
		
	}
	
	// 내 프로필 수정하기 페이지 연결 - 사업자
	@GetMapping(value="/modifyB")
	public void profModifyBGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session) {
		logger.debug(" Controller : ( •̀ ω •́ )y /modifyB -> profModifyBGET 실행 ");
		
		vo.setFree_no(free_no);
		vo.setFree_id(String.valueOf(session.getAttribute("user_id")));
		
		model.addAttribute("myProfile", mpService.getProfile(vo));
		model.addAttribute("mySkill", mpService.getSkill(vo));
		model.addAttribute("myReg",mpService.getReg(vo));
		model.addAttribute("myCareer", mpService.getCareer(vo));
		model.addAttribute("myComp", mpService.getComp(vo));
		model.addAttribute("myPartn", mpService.getPartn(vo));
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/myProfile/modifyB.jsp 페이지 연결 ");
		
	}
	
	// 내 프로필 수정하기 - 사업자
	@PostMapping(value="/modifyB")
	public void profModifyBPOST(FreelancerVO fVO,SkillVO sVO, RegionVO rVO, CareerVO cVO, CompanyVO cpVO, PartnersVO pVO, PortfolioVO poVO,HttpSession session){
		logger.debug(" Controller : ( •̀ ω •́ )y /modifyB -> profModifyBPOST 실행 ");
		
		int free_no = (int) session.getAttribute("free_no");
		poVO.setFree_no(free_no);
		int chk = poVO.getFree_no();
		
		efService.updateFree(fVO);
		efService.updateSkill(sVO);
		efService.updateReg(rVO);
		efService.updateCareer(cVO);
		efService.updateComp(cpVO);
		efService.updatePartners(pVO);
		efService.updatePortf(poVO);
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/myProfile/modifyB.jsp 페이지 연결 ");
		
		
	}
	
}
