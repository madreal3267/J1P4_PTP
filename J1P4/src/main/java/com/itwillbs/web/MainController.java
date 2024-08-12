package com.itwillbs.web;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/main/*")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// 서비스 객체 주입
	
	// http://localhost:8088/main/home
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String mainGET(HttpSession session) {
		logger.debug(" /main -> mainGET() 호출 ");
		// 연결된 뷰페이지 실행 /WEB-INF/views/main.jsp
		logger.debug("/views/main.jsp 페이지 연결");
		return "/main/home";
		
	}
	
} // MainController 클래스
