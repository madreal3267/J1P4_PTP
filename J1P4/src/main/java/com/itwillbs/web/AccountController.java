package com.itwillbs.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.service.AccountService;

@Controller
@RequestMapping(value = "/member/*")
public class AccountController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//서비스객체 주입
	@Inject
	private AccountService aService;

		
	
		
	// http://localhost:8088/member/account
		@GetMapping(value = "/account")
		public void accountHOME() {
			logger.debug("/account -> accountHOME() 호출 ");
		}
	
	
	//폰 번호 입력/수정
//		@RequestMapping(value = "/phone", method = RequestMethod.GET)
//		public void phoneNoGET(MemberVO vo){
//			logger.debug("/account -> phoneNoGET() 호출 ");
//
//		}
		@ResponseBody
		@RequestMapping(value = "/phone", method = RequestMethod.POST)
		public void phoneNoPOST(MemberVO vo){
			aService.phonNo(vo);
			logger.debug("/account -> phoneNoPOST() 호출 ");
			logger.debug("vo : "+ vo);
			
		}
		
		//현재 비밀번호 입력
		@GetMapping(value = "/nowPass")
		public String passwordGET() {
			return"/member/account";
		}
		
		
		@PostMapping(value = "/nowPass")
		@ResponseBody
		public int password(Model model, MemberVO vo, HttpSession session) {
			logger.debug("/account -> password() 호출 ");
			int member = aService.password(vo);
			logger.debug("@@@@@@@@@@@@ 비번 일치여부 확인 입니다 :" + member); //0또는 1
			
			
			return member;
		}
		
		
//		//변경 할 비밀번호
//		@GetMapping(value = "/chagePass")
//		public void passwordupdateGET() {
//			
//		}
		
		
	
		
		 // 회원정보 수정 - 변경된 내용을 DB에 전달 및 수정
	    @RequestMapping(value = "/changePass", method = RequestMethod.POST)
	    @ResponseBody
	    public String updatePost(@RequestParam("user_id") String user_id, 
	                             @RequestParam("user_pw2") String user_pw,
	                             MemberVO vo, HttpSession session, Model model) throws Exception {
	        logger.debug(" /update -> updatePost() 호출 ");
	        
	        // 사용자 ID로 현재 비밀번호 조회
	        String currentPw = aService.pass(user_id);
	        logger.debug(" ############# "+currentPw);
	        logger.debug(" %%%%%%%%%%% "+user_pw);
	        
	        vo.setUser_id(user_id);
	        logger.debug(" @@@@@@@@@@ 아이디 %%%%%%%%%%% "+vo.getUser_id());
	        vo.setUser_pw(user_pw);
	        logger.debug(" @@@@@@@@@@ 비밀번호 %%%%%%%%%%% "+vo.getUser_pw());
	        // 비밀번호가 일치하면 회원정보 수정
	       
	        aService.passwordUpdate(vo);
	        
	        return "redirect:/member/accountHOME";
	    }
		
		
	
		//이용방법
		@GetMapping(value = "/guide")
		public void guideGET() {
			
		}

}
