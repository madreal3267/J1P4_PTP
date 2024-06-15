package com.itwillbs.web;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.service.MailSendService;
import com.itwillbs.service.MemberService;


@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체를 주입
	@Inject
	private MemberService mService;
	
	@Inject
	private MailSendService mailSend;
	
	@Inject
	private SqlSession sqlSession;
	
	

	//회원가입 페이지
	// http://localhost:8088/member/insert
	
	//회원정보를 입력하는 것은 DB가 필요없으니깐 매개변수가 없는 것!
	// 정보를 보여주는 형태는 - GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertjoinGET() {
		logger.debug("/insert -> insertjoinGET() 호출 ");

	}
	
	// 입력받은 회원정보를 보여줘야 하니깐 DB가 필요!! -> 매개변수 MemberVO vo를 써준다.
	// 입력받은 정보를 처리해야하니깐 -> POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertjoinPOST(@ModelAttribute MemberVO vo) throws Exception {
		logger.debug("/insert -> insertjoinPOST() 호출 ");
		
		//디비에 회원가입 정보 입력
		//mService.join(vo);
		mailSend.join(vo);
		
		// 회원가입하기 눌렀을때 mailsend에 인증메일 확인링크를 클릭해달라는 페이지로 이동
		return "redirect:/member/mailsend"; 
	}
		
	
	//회원가입 버튼을 누르면 mailsend와  연결해주기 위해서 매핑을 한번 더 해야함.
	//http://localhost:8088/member/mailsend
	@RequestMapping(value = "/mailsend", method = RequestMethod.GET)
	public void test() {
		
	}
	
	
	
	//이메일 인증 메일 
	@RequestMapping(value = "/registerEmail",method = RequestMethod.POST)
	public String emailConfirm(String user_email, Model model)throws Exception{
		mailSend.updateMailAuth(user_email);
		model.addAttribute("user_email", user_email);
		
		return "/member/registerEmail"; //인증 성공 후 이동하는 페이지
	}
	
	//이메일 인증 메일 - GET
	@RequestMapping(value = "/registerEmail", method = RequestMethod.GET)
	public void emailConfirmGET() {
		
	}	
	
	
	//아이디 중복 체크
	//ajax로 처리할때는 @ResponseBody를 써야 응답이 가능.
	@GetMapping(value = "/idcheck")
	public @ResponseBody int idCheck(@RequestParam("userid") String id) throws Exception {
	
		logger.debug("id :"+id);
	
		int res = mService.idCheck(id);
		
		return res;
		
	}
	

		
		
		
		
	

	
	
	
	
	
} // Controller
