package com.itwillbs.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.service.MemberService;
// @RequestMapping(value = "/member/*")
// URI가 /member/~ 시작하는 모든 주소를 처리(매핑) ~.me, ~.bo
// GET/POST 방식 상관 없이 모두 처리 가능

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체를 주입
	@Inject
	private MemberService mService;

	
	//http://localhost:8088/member/login
	//로그인 페이지
	
	//GET - 뷰페이지를연결해줌
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		
		return"/member/login";
	}
	
	//POST - 데이터를 처리하는 역할
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpSession session, MemberVO vo ) {
		
		MemberVO resultVO= mService.memberLogin(vo);
		
		if(resultVO == null ) {
			
			return "redirect:/member/login";
		}
		
		session.setAttribute("user_id", resultVO.getUser_id());
		return"redirect:/member/test2";
	}
	
	//로그인을 눌렀을때 테스트2페이랑 연결해주기 위해서 매핑을 한번 더 해야함.
	//http://localhost:8088/member/test2
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public void test() {
		
	}
	
	
} // Controller
