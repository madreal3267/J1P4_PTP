package com.itwillbs.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
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
import com.itwillbs.persistence.EnrollProjDAO;
import com.itwillbs.service.EnrollProjService;
import com.itwillbs.service.SettlementService;

@Controller
@RequestMapping(value = "J1P4_PTP/enroll/*")
public class EnrollProjController {

	private static final Logger logger = LoggerFactory.getLogger(EnrollProjController.class);
	
	@Inject
	private EnrollProjService eService;
	
	@Inject
	private SettlementService sService;
	
	@Inject
	private EnrollProjDAO eDao;
	// 프로젝트 등록 페이지 연결
	// http://localhost:8088/enroll/enrollProj
	@GetMapping(value="/enrollProj")
	public void enrollProjGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollProj -> enrollGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollProj.jsp 페이지 연결 ");
		
	}
	
	// 프로젝트 등록
	@PostMapping(value="/enrollProj")
	public String enrollProjPOST(ProjectVO pVO, SkillVO sVO, RegionVO rVO/*, Model model,HttpSession session */) {
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
	public void enrollProjSuccessGET() {
		logger.debug(" Controller : ( •̀ ω •́ )y /enrollSuccess -> enrollSuccessGET() 실행 ");
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/enroll/enrollSuccess.jsp 페이지 연결 ");
		
	}
	
	// ----------------------------- 머지 후 파트 분리 해야됨 -----------------------------
	// 임시로 EnrollProjController에 구현 중임
	
	// http://localhost:8088/enroll/getSavedProj?proj_no=412
	
	// 내 프로젝트 관리에서 임시저장 프로젝트 불러오기
	@GetMapping(value="/getSavedProj")
	public String getSavedProjGET(Model model,ProjectVO vo, @RequestParam("proj_no") int proj_no, HttpSession session,HttpServletResponse response) throws IOException {
		logger.debug(" Controller : ( •̀ ω •́ )y /getSavedProj -> getSavedProjGET() 실행 ");
		
		vo.setUser_id(String.valueOf(session.getAttribute("user_id")));
		vo.setProj_no(proj_no);
		logger.debug("@@@@@@@@@@@@@@@"+vo);
		
//		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html; charset=utf-8");
		
		// eService.chkProj -> 불러온 임시저장 프로젝트의 번호(파라미터값)와 로그인한 아이디(세션)가 일치하면 1을 리턴
		// 일치하지 않는 경우 (본인의 프로젝트가 아닌데 파라미터값을 변경하여 강제접근할 경우) 0을 리턴
		if(eService.chkProj(vo)==1) {
			// eService.chkTemp -> 불러온 임시저장 프로젝트가 임시저장 프로젝트면 1을 리턴
			// 아닐 경우 (등록된 프로젝트에 파라미터값을 변경하여 강제접근할 경우) 0을 리턴
			if(eService.chkTemp(vo)==1) {
				model.addAttribute("resultProj", eService.getSavedProj(vo));
				model.addAttribute("resultSk", eService.getSavedSk(vo));
				model.addAttribute("resultReg", eService.getSavedReg(vo));
				return "/enroll/getSavedProj";				
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script> alert('Fuck FUCK You');");
				out.println("history.back();</script>");
				out.close();
				return null;
			}
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script> alert('Fuck You');");
			out.println("history.back();</script>");
			out.close();
			return null;
		}
	}
	
	// 불러온 임시저장 프로젝트 임시저장
	@PostMapping(value="/savedProjSave")
	@ResponseBody
	public void savedProjSavePOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /savedProjSave -> savedProjSavePOST 실행 ");
		
		System.out.println(pVO.getWork_field()+"@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		eService.savedProjSave(pVO);
		eService.savedSkSave(sVO);
		eService.savedRegSave(rVO);

	}
	
	// 불러온 임시저장 프로젝트 등록
	@PostMapping(value="/savedProjEnroll")
	public String savedProjEnrollPOST(ProjectVO pVO,SkillVO sVO,RegionVO rVO) {
		logger.debug(" Controller : (＃°Д°) /savedProjEnroll -> realEnrollPOST() 실행 ");
		
		eService.savedProjSave(pVO);
		eService.savedSkSave(sVO);
		eService.savedRegSave(rVO);
		
		return "redirect:/enroll/enrollSuccess";
		
	}
	
}
