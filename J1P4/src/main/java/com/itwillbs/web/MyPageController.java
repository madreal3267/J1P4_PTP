package com.itwillbs.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.service.MyPageService;

@Controller
@RequestMapping(value = "/member/*")
public class MyPageController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MyPageService myService;
	
	
	//은행계좌 추가
	// http://localhost:8088/member/mypage
	@GetMapping(value = "/mypage")
	public void enrollBankGET() {
		logger.debug("/bank ->  enrollBankGET()호출 ");
	}
	
	@PostMapping(value = "/bank")
	@ResponseBody
	public void enrollBankPOST(MemberVO vo) {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/bank ->  enrollBankPOST()호출 ");
		myService.addBank(vo);
		logger.debug("vo :"+vo);
		
	}
	
//	//회원정보 추가
//	@GetMapping(value = "/addinfo")
//	public void enrollInfoGET(Model model, MemberVO vo) {
//		logger.debug("/addinfo-> enrollInfoGET()호출 ");
//		
//		
//	}
	
	
	@PostMapping(value = "/addinfo")
	@ResponseBody
	public void  enrollInfoPOST(MemberVO vo, HttpSession session) {
		logger.debug("@@@@@@@@@@@@@@@@@@/addinfo -> enrollInfoPOST()호출 ");
		logger.debug("vo :"+vo);
		// 세션에 user_type 저장
		myService.addInfo(vo);
		session.setAttribute("user_type", vo.getUser_type());
		
	}
	
//	@GetMapping(value = "/addinfo2")
//	public void infoOk() {
//		logger.debug("회원정보 수정완료 ");
//	}
	
//	
//	//신원정보 추가
//	@GetMapping(value = "/addidentity")
//	public void enrollIdentiGET() {
//		logger.debug("/addidentity -> enrollIdentiGET()호출 ");
//	}
	
	
	@PostMapping(value = "/addidentity")
	@ResponseBody
	public void enrollIdentiPOST(MemberVO vo) {
		logger.debug("@@@@@@@@@@@@@@@@@@/addidentity -> enrollIdentiPOST()호출 ");
		logger.debug("vo :"+vo);
		myService.addIdentity(vo);
	}
	
	
	
}
