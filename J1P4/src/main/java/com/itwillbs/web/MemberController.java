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
import com.itwillbs.service.MailSendService100;
import com.itwillbs.service.MemberService;
// @RequestMapping(value = "/member/*")
// URI가 /member/~ 시작하는 모든 주소를 처리(매핑) ~.me, ~.bo
// GET/POST 방식 상관 없이 모두 처리 가능

//import sun.jvmstat.monitor.event.VmEvent;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체를 주입
	@Inject
	private MemberService mService;
	@Autowired
	private MailSendService100 mailSend100;
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
		
		//임의의 인증번호 생성, 이메일 발송
		String authkey = mailSend100.sendAuthMail(vo.getUser_email());
		vo.setMail_key(authkey);
		
		 Map<String, String> map = new HashMap<String, String>();
	        map.put("user_email", vo.getUser_email());
	        map.put("mail_key", vo.getMail_key());
	        System.out.println(map);
		
		//디비에 인증번호 업데이트
	        sqlSession.update(authkey);
		
		
		
		return "redirect:/member/test2"; // 회원가입하기 눌렀을때 어디로 페이지 이동할지 정하는 것!
		
	}
	

	
	
	
	
	
} // Controller
