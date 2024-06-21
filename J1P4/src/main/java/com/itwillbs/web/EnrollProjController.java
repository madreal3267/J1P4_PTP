package com.itwillbs.web;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	// 프로젝트 등록 페이지 연결
	// http://localhost:8088/enroll/enrollProj
	@GetMapping(value="/enrollProj")
	public void enrollGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollProj -> enrollGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollProj.jsp 페이지 연결 ");
		
	}
	
	// 프로젝트 등록
	@PostMapping(value="/enrollProj")
	public String enrollPOST(ProjectVO pVO, SkillVO sVO, RegionVO rVO/*, Model model,HttpSession session */) {
		logger.debug(" Controller : (＃°Д°) /enrollProj -> enrollPOST() 실행 ");		
		
//		String id = (String)session.getAttribute("user_id");
		eService.insertProj(pVO);
//		model.addAttribute("projNo",eService.getProjNo(id));
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
	
	// ----------------------------- 머지 후 파트 분리 해야됨 -----------------------------
	// 임시로 EnrollProjController에 구현 중임
	
	// http://localhost:8088/enroll/saveProjDt?proj_no=315
	
	// 내 프로젝트 관리에서 임시저장 프로젝트 불러오기
	@GetMapping(value="/saveProjDt")
	public void saveProjDtGET(Model model, @RequestParam("proj_no") int proj_no) {
		logger.debug(" Controller : ( •̀ ω •́ )y /saveProj -> saveProjDtGET() 실행 ");
		
		model.addAttribute("resultProj", eService.saveProjDt(proj_no));
		model.addAttribute("resultSk", eService.saveSkDt(proj_no));
		model.addAttribute("resultReg", eService.saveRegDt(proj_no));
	}
	
	// 불러온 임시저장 프로젝트 임시저장
	@PostMapping(value="/saveProjSave")
	@ResponseBody
	public void moreSavePOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /saveProjSave -> moreSavePOST 실행 ");
		
		eService.saveProjSave(pVO);
		eService.saveSkSave(sVO);
		eService.saveRegSave(rVO);

	}
	
	// 불러온 임시저장 프로젝트 등록
	@PostMapping(value="/realEnrollProj")
	public String realEnrollPOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /realEnrollProj -> realEnrollPOST() 실행 ");
		
		eService.saveProjSave(pVO);
		eService.saveSkSave(sVO);
		eService.saveRegSave(rVO);
		
		return "redirect:/enroll/enrollSuccess";
		
	}
	
}
