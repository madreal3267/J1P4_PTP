package com.itwillbs.web;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.MailHandler;
import com.itwillbs.persistence.TempKey;
import com.itwillbs.service.MemberService;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체를 주입
		@Inject
		private MemberService mService;
		
		@Autowired
		private JavaMailSender mailSender;
	
		
		
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
	
	
//	//비밀번호 찾기 페이지 
//	// http://localhost:8088/member/pwfind
//	@RequestMapping(value = "/pwfind", method = RequestMethod.GET)
//	public String search_pw(HttpServletRequest request, Model model, MemberVO vo ) {
//			
//			
//			return"/member/pwfind";
//		}
	//비밀번호 찾기 페이지 
	// http://localhost:8088/member/pwfind
	@RequestMapping(value = "/pwfind", method = RequestMethod.GET)
	public void search_pw() {
		
	}
	
	
	//비밀번호 재설정페이지로 이동 -> 난수 저장
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public String findpw(MemberVO vo, Model model) throws Exception {
		
		System.out.println(vo);
		logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@"+vo);
		logger.info("@@@@@@@@@@@@@@@@@"+vo.getUser_id());
		
		if(vo.getUser_id() != null) {
			String key = new TempKey().getKey(8, false); //난수를 생성하는 키
			System.out.println("key:"+ key);
			vo.setMail_key(key);
			
			mService.findpw(vo);
			
			MailHandler mailhandler = new MailHandler(mailSender);
			mailhandler.setSubject("[캐프리 비밀번호 재설정 메일입니다.]"); //메일제목
			mailhandler.setText(
					"<h1>메일인증</h1>" +
							"<br/>"+vo.getUser_id()+"님 "+
							"<br/>비밀번호 변경을 위해서"+
							"<br/>아래 [비밀번호 변경하기]를 눌러주세요."+
							"<a href='http://192.168.0.26:8088/member/findpw?user_email=" + vo.getUser_email() +
							"&key=" + key +
							"' target='_blenk'>비밀번호 변경하기</a>");
			mailhandler.setFrom("itwil_j1p4@naver.com", "캐프리");
			mailhandler.setTo(vo.getUser_email());
			mailhandler.send();
			
			
			logger.debug("이메일 인증");
			
			return"/member/findpw2";
			
			
		}else {
			String msg ="아이디가 없습니다";
			model.addAttribute("msg", msg);
			
			return "/member/pwfind";
			
		}
		
	}
	
	@GetMapping(value = "/findpw")
	public void findpw() {
		
	}
	
	//변경한 비밀번호 DB에 전달

	@PostMapping(value = "/main")
	public void main(MemberVO vo, Model model) throws Exception {
		logger.debug("비번변경 Post()호출");
		String result = vo.getMail_key();
		String key = new TempKey().getKey(8, false); 
		if(result == key) {
			mService.chagepw(vo);
			
			logger.debug("비밀번호 변경완료");
		}else {
			
			String msg ="비밀번호 변경실패";
			model.addAttribute("msg", msg);
		}
		
	}
	
	
	
	
	

	
	
	
	
	
	
}
