package com.itwillbs.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
	}
	
	// 입력받은 회원정보를 보여줘야 하니깐 DB가 필요!! -> 매개변수 MemberVO vo를 써준다.
	// 입력받은 정보를 처리해야하니깐 -> POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertjoinPOST(@ModelAttribute MemberVO vo) throws Exception {
		
		//디비에 회원가입 정보 입력
		mService.join(vo);
		
		return "redirect:/member/test2"; 
		// 회원가입하기 눌렀을때 test2에 이메일 인증하기 버튼이 있는 페이지로 이동
		
	}
		
	
	//로그인을 눌렀을때 테스트2페이랑 연결해주기 위해서 매핑을 한번 더 해야함.
	//http://localhost:8088/member/test2
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public void test() {
		
	}
	
	
	//이메일 인증 메일 
	@RequestMapping(value = "/registerEmail",method = RequestMethod.POST)
	public String emailConfirm(String user_email, Model model)throws Exception{
		mailSend.updateMailAuth(user_email);
		model.addAttribute("user_email", user_email);
		
		return "/member/registerEmail"; //인증 성공 후 이동하는 페이지
	}
		
		
		

		
		
		
		
	

	
	
	
	
	
} // Controller
