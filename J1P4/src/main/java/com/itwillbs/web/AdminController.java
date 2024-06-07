package com.itwillbs.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	// 관리자 메인페이지 이동
	// http://localhost:8088/admin/adminMain
	@GetMapping(value = "/adminMain")
	public void adminMainGET() {
		logger.debug(" adminMain -> adminMainGET() 호출");
		
		logger.debug("/views/admin/adminMain.jsp 페이지 연결");
	}
	
	
}
