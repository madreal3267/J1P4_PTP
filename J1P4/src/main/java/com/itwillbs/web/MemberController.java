package com.itwillbs.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체를 주입
		@Inject
		private MemberService mService;
	
		
		
	//로그인 페이지
	// http://localhost:8088/member/login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		
		return"/member/login";
	}
	
	
	//POST
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String loginPOST(HttpSession session, MemberVO vo ) {
			
			MemberVO resultVO= mService.memberLogin(vo);
			
			System.out.println("resultVO : "+resultVO);
			
			if(resultVO == null) {
				
				System.out.println("로그인실패");
				return "redirect:/member/login";
			}
			
			session.setAttribute("user_id", resultVO.getUser_id());
			
			return"redirect:/member/main";
		}
		
		
		@GetMapping(value = "/main")
		public void mainGET() {
			
		}

	
	
	//아이디 찾기 페이지 
	// http://localhost:8088/member/idfind
	@RequestMapping(value = "/idfind", method = RequestMethod.GET)
	public String search_id(HttpServletRequest request, Model model, MemberVO vo ) {
		
		
		return"/member/idfind";
	}
	
	//아이디 찾기 로직
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(MemberVO vo,Model model) throws Exception{
		logger.info("memberEmail"+vo.getUser_email());
				
		if(mService.findIdCheck(vo.getUser_email())==0) {
		model.addAttribute("msg", "이메일이 맞는지 확인해주세요");
		
		return "/member/idfind";
		
		}else {
		model.addAttribute("member", mService.findId(vo.getUser_email()));
		
		return"/member/findId";
		}
	}
	
	@GetMapping(value = "/findId")
	public void findIdGET() {
		
	}
	
	//Post로 처리하고, count한 값이 0이면 
	//아이디찾기 페이지로 msg라는 String값을 보낸다.
	//그렇지 않으면 아이디찾기 로직을 수행하고 /member/findId페이지로 이동
	
	//--------------------------------------------------------------
	
	

	
	
	
	
	
	
}
