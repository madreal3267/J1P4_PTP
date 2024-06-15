package com.itwillbs.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.service.BoardService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService bService;

	// 기본 페이지
	@GetMapping(value = "/listPro")
	public void list(Criteria cri, Model model, HttpServletRequest request) {
		
		int pNum = bService.pNum();
		model.addAttribute("pNum", pNum);
		
		int pageNum = 1;
		int amount = 6;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("amount") != null) {
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		int offset = (pageNum-1)*amount;

		cri.setAmount(amount);

		cri.setOffset(offset);
		
		logger.debug("pageNum : "+pageNum);
		logger.debug("offset : "+offset);
		
		model.addAttribute("list", bService.pListPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));


	}
	// 정렬 후 페이지
	@GetMapping(value = "/listProP")
	public String listPage(Criteria cri, Model model, HttpServletRequest request,@RequestParam("sn") String sn) {
		
		int pNum = bService.pNum();
		model.addAttribute("pNum", pNum);
		
		int pageNum = 1;
		int amount = 6;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("amount") != null) {
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		int offset = (pageNum-1)*amount;
		
		cri.setAmount(amount);
		
		cri.setOffset(offset);
		
		logger.debug("pageNum : "+pageNum);
		logger.debug("offset : "+offset);
		model.addAttribute("list", bService.proLSort(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));
		
		return "/board/listPro";
		
	}
	
	// 정렬하기
	@GetMapping(value = "/listProto")
	@ResponseBody
	public List<ProjectVO> getRejectReason(@RequestParam("pageNum") int pageNum,@RequestParam("amount") int amount, @RequestParam("sn") String sn,ProjectVO pvo, Criteria cri, HttpServletRequest request) {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		logger.debug(sn);
		
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("amount") != null) {
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		logger.debug("pageNum@ : "+pageNum);
		logger.debug("amount@ : "+amount);
		
		int offset = (pageNum-1)*amount;
		logger.debug("offset@ : "+offset);

		cri.setAmount(amount);
		logger.debug("1111111 ");

		cri.setOffset(offset);
		logger.debug("22222222 ");

		List<ProjectVO> list = bService.proLSort(cri); 
		logger.debug("22 "+list); 

		return list;
	}

	
	// 필터
	@RequestMapping(value = "/listPro",method = RequestMethod.POST)
	public void fiterList(@RequestParam("work_field") String work_field, Model model,ProjectVO pvo, Criteria cri) {
		logger.debug("work_field : "+work_field);
		
		
		List<ProjectVO> list = bService.proFi(cri);
		model.addAttribute("list", list);
		
		pvo.setWork_field(work_field);

		int fiNum = bService.fiNum(pvo);
		model.addAttribute("pNum", fiNum);
		logger.debug("fiNum : "+fiNum);
		
		model.addAttribute("pageMaker", new PageDTO(cri, fiNum));
	

		
	}
	
	@GetMapping(value = "/detailList")
	public String detailGET(@RequestParam("proj_no") int proj_no, Model model) {
		// 프로젝트 리스트 상세정보
		
		ProjectVO resultVO = bService.dePro(proj_no);
		model.addAttribute(resultVO);
		// 로그인 여부 조회
		
		// 뷰페이지 이동
		return "/board/detailList";
	}
	
	
	
	// http://localhost:8088/board/listFree
	@GetMapping(value = "/listFree")
	public void flist(Criteria cri, Model model, HttpServletRequest request) {
		
		int fNum = bService.fNum();
		model.addAttribute("fNum", fNum);
		
		int pageNum = 1;
		int amount = 6;
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("amount") != null) {
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		
		
		int offset = (pageNum-1)*amount;

		cri.setAmount(amount);

		cri.setOffset(offset);
		
		logger.debug("pageNum : "+pageNum);
		logger.debug("offset : "+offset);
		
		model.addAttribute("list", bService.fListPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, fNum));


	}
	
	

}
