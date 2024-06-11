package com.itwillbs.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.TypeVO;
import com.itwillbs.service.TypeService;

@Controller
@RequestMapping(value = "/member/*")
public class TypeController {


	private static final Logger logger = LoggerFactory.getLogger(TypeController.class);
	
	//서비스 객체 주입
	@Inject
	private TypeService tService;
	
	//POST방식 : 변경된 내용을 DB에 전달해서 수정
	// http://localhost:8088/member/registerEmail
	@PostMapping(value = "/registerEmail")
	public String updateType(TypeVO tvo) {
		
		logger.debug("tvo"+tvo);

		
		//수정할 정보 저장
		tService.typeUpdate(tvo);
		return"redirect:/member/main";
	}
	
	//이동한 페이지 매핑
	@GetMapping(value = "/main")
	public void test2() {
		
	}
	
	
	
	
	
}
