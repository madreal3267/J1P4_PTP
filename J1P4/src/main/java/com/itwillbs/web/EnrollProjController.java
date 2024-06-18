package com.itwillbs.web;

import java.util.HashMap;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	// 프로젝트 등록 페이지 연결
	// http://localhost:8088/enroll/enrollProj
	@GetMapping(value="/enrollProj")
	public void enrollGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollProj -> enrollGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollProj.jsp 페이지 연결 ");
		
	}
	
	// 프로젝트 등록
	@PostMapping(value="/enrollProj")
	public String enrollPOST(ProjectVO pVO, SkillVO sVO, RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /enrollProj -> enrollPOST() 실행 ");		
		
		eService.insertProj(pVO);
		eService.insertSkill(sVO);
		eService.insertReg(rVO);
		
		return "redirect:/enroll/enrollSuccess";
	}
	
	
	// 프로젝트 임시저장 -> ajax
	@PostMapping(value="/saveProj")
	@ResponseBody
	public HashMap<String, Object> savePOST(ProjectVO pVO, SkillVO sVO, RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /saveProj -> savePOST() 실행 ");
		
		// boolean으로 최초 임시저장 여부 판단
		// 해당 서비스단이 실행되면 false 값이 리턴됨
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("result", eService.saveProj(pVO)); // false 담음
		eService.insertSkill(sVO);
		eService.insertReg(rVO);
		
		return map;
	}
	
	// 프로젝트 임시저장 후 등록
	@PostMapping(value="/enrollSaveProj")
	public String enrollSavePOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /enrollSaveProj -> enrollSavePOST() 실행 ");
		
		eService.multiSaveProj(pVO);
		eService.multiSaveSk(sVO);
		eService.multiSaveReg(rVO);
		
		return "redirect:/enroll/enrollSuccess";
		
	}
	
	// 프로젝트 최초 임시저장 이후 임시저장
	@PostMapping(value="/multiSaveProj")
	@ResponseBody
	public void multiSavePOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /multiSaveProj -> multiSavePOST() 실행 ");
		
		eService.multiSaveProj(pVO);
		eService.multiSaveSk(sVO);
		eService.multiSaveReg(rVO);

	}
	
	// 프로젝트 등록 후 성공 페이지
	// http://localhost:8088/enroll/enrollSuccess
	@GetMapping(value="/enrollSuccess")
	public void enrollSuccessGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollSuccess -> enrollSuccessGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollSuccess.jsp 페이지 연결 ");
		
	}
	
}
