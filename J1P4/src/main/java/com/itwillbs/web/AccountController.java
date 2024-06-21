package com.itwillbs.web;

import javax.inject.Inject;

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

		
		//폰 번호 입력/수정
		// http://localhost:8088/member/account
		@RequestMapping(value = "/account", method = RequestMethod.GET)
		public void phoneNoGET(){
			logger.debug("/account -> phoneNoGET() 호출 ");

		}
		
		
		//현재 비밀번호 입력
		@PostMapping(value = "/account")
		@ResponseBody
		public String password(@RequestParam("passwordButton")String passwordButton, MemberVO vo, Model model,String user_pw, String user_id) {
			logger.debug("/account -> password() 호출 ");
			String member = aService.password(user_id);
			if(passwordButton.equals("123")) { //입력한 비번과 현재 비번이 같을때
				model.addAttribute("msg", "새 비밀번호를 설정해주세요.");
				
			}else {
				model.addAttribute("msg", "비밀번호를 다시 입력해주세요.");
			}
			
			logger.debug("passwordButton : "+passwordButton);
			
			return"/member/account";
		}
		
		//수정할 비밀번호
		public void passwordupdate(MemberVO vo, String user_pw) {
			logger.debug("/account -> passwordUpdate() 호출 ");
			
		}
	
	
	

}
