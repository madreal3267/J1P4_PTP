package com.itwillbs.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.service.EnrollProjService;

@Controller
@RequestMapping(value = "/enroll/*")
public class EnrollProjController {

	private static final Logger logger = LoggerFactory.getLogger(EnrollProjController.class);
	
	@Inject
	private EnrollProjService eService;
	
	// http://localhost:8088/enroll/enrollProj
	@GetMapping(value="enrollProj")
	public void enrollGET() {
		logger.debug(" ( •̀ ω •́ )y /enrollProj -> enrollGET() 실행 ");
		
		logger.debug(" ( •̀ ω •́ )y /views/enroll/enrollProj.jsp 페이지 연결 ");
		
	}
}
