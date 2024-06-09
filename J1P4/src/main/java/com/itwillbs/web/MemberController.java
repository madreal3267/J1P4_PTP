package com.itwillbs.web;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberVO;

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//아이디 찾기
	// http://localhost:8088/member/idfind
	// http://localhost:8088/member/login
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
		return"/member/login";
	}
	
	@RequestMapping(value = "/idfind", method = RequestMethod.GET)
	public String search_id(HttpServletRequest request, Model model, MemberVO vo ) {
		
		
		return"/member/idfind";
	}
	
	
	

	
	
	
	
	
	
}
