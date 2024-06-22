package com.itwillbs.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.service.MyProfileService;

@Controller
@RequestMapping(value = "/myProfile/*")
public class MyProfileController {

	private static final Logger logger = LoggerFactory.getLogger(MyProfileController.class);
	
	@Inject
	private MyProfileService mpService;
	
	// 내 프로필 페이지 연결
	// http://localhost:8088/myProfile/profile?free_no=366
	@GetMapping(value="/profile")
	public void profileGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session) {
		logger.debug(" Controller : ( •̀ ω •́ )y /profile -> profileGET 실행 ");
		
		vo.setFree_no(free_no);
		vo.setFree_id(String.valueOf(session.getAttribute("user_id")));
		
		model.addAttribute("myProfile", mpService.getProfile(vo));
		model.addAttribute("mySkill", mpService.getSkill(vo));
		model.addAttribute("myReg",mpService.getReg(vo));
		model.addAttribute("myCareer", mpService.getCareer(vo));
		model.addAttribute("myLicense", mpService.getLicense(vo));
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/myProfile/profile.jsp 페이지 연결 ");

	}
	
	// 내 프로필 수정하기 페이지 연결
	@GetMapping(value="/modify")
	public void profModifyGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session) {
		logger.debug(" Controller : ( •̀ ω •́ )y /modify -> profModifyGET 실행 ");
		
		vo.setFree_no(free_no);
		vo.setFree_id(String.valueOf(session.getAttribute("user_id")));
		
		model.addAttribute("myProfile", mpService.getProfile(vo));
		model.addAttribute("mySkill", mpService.getSkill(vo));
		model.addAttribute("myReg",mpService.getReg(vo));
		model.addAttribute("myCareer", mpService.getCareer(vo));
		model.addAttribute("myLicense", mpService.getLicense(vo));
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/myProfile/modify.jsp 페이지 연결 ");
		
	}
	
}
