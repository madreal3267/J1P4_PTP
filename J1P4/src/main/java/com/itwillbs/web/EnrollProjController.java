package com.itwillbs.web;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.service.EnrollProjService;

@Controller
@RequestMapping(value = "/enroll/*")
public class EnrollProjController {

	private static final Logger logger = LoggerFactory.getLogger(EnrollProjController.class);
	
	@Inject
	private EnrollProjService eService;
	
	// http://localhost:8088/enroll/enrollProj
	@GetMapping(value="/enrollProj")
	public void enrollGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollProj -> enrollGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollProj.jsp 페이지 연결 ");
		
	}
	
	@PostMapping(value="/enrollProj")
	public String enrollPOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /enrollProj -> enrollPOST() 실행 ");
		
		eService.insertProj(pVO);
		eService.insertSkill(sVO);
		eService.insertReg(rVO);
		
		return "redirect:/enroll/enrollSuccess";
	}
	
	@PostMapping(value="/saveProj")
	@ResponseBody
	public HashMap<String, Object> savePOST(ProjectVO pVO, SkillVO sVO, RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /saveProj -> enrollPOST() 실행 ");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		boolean result = eService.saveProj(pVO);
		map.put("result", result);
		eService.insertSkill(sVO);
		eService.insertReg(rVO);
		
		
		return map;
	}
	
	@PostMapping(value="/multiSaveProj")
	@ResponseBody
	public void multiSavePOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /multiSaveProj -> enrollPOST() 실행 ");
		
		eService.multiSaveProj(pVO);
		eService.multiSaveSk(sVO);
		eService.multiSaveReg(rVO);

	}
	
	// http://localhost:8088/enroll/enrollSuccess
	@GetMapping(value="/enrollSuccess")
	public void enrollSuccessGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollSuccess -> enrollSuccessGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollSuccess.jsp 페이지 연결 ");
		
	}
	
}
