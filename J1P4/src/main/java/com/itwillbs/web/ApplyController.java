package com.itwillbs.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.service.ApplyProjService;

@Controller
@RequestMapping(value="/projectDetail/*")
public class ApplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ApplyController.class);
	
	@Inject
	private ApplyProjService aSerivce;
	
	// http://localhost:8088/projectDetail/applyProj
	@GetMapping(value="/applyProj")
	public void ApplyProjGET(Model model) {
		logger.debug(" Controller : ( •̀ ω •́ )y /applyProj -> ApplyProjGET() 실행 ");
		
		model.addAttribute("skill",aSerivce.getSkill());
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/projectDetail/applyProj.jsp 페이지 연결 ");
		
	}
	
	@PostMapping(value="/applyProj")
	public void ApplyProjPOST(ApplyVO vo) {
		logger.debug(" Controller : ( •̀ ω •́ )y /applyProj -> ApplyProjPOST() 실행 ");
		
		aSerivce.insertApply(vo);
		
	}

}
