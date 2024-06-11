package com.itwillbs.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/enroll/*")
public class EnrollFreeController {

	private static final Logger logger = LoggerFactory.getLogger(EnrollFreeController.class);
	
	// http://localhost:8088/enroll/enrollFree
	@GetMapping(value="/enrollFree")
	public void enrollFreeGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollFree -> enrollFreeGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollFree.jsp 페이지 연결 ");
	}
	
}
