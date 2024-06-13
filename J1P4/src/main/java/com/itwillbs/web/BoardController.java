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

	// http://localhost:8088/board/listPro
//	@RequestMapping(value = "/listPro",method = RequestMethod.GET)
//	public void projListGET(Model model) {
//		logger.debug(" /list -> projListGET() 호출 ");
//		
//		List<ProjectVO> bvo = bService.projList();
//		logger.debug(" boardList : "+bvo.size());
//		
//		
//		model.addAttribute("bvo", bService.projList());
//		
//	}
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
		
		logger.debug("pageNum : "+pageNum);
		
		int offset = (pageNum-1)*amount;

		cri.setAmount(amount);

		cri.setOffset(offset);

		List<ProjectVO> result = bService.proLSort(cri);
		logger.debug("22 "+result);

		return result;
	}

	/*
	 * @GetMapping(value = "/listProP")
	 * 
	 * @ResponseBody public List<ProjectVO> getRejectReason(@RequestParam("pageNum")
	 * int pageNum,@RequestParam("amount") int amount,@RequestParam("sn") String sn
	 * ,ProjectVO pvo, Criteria cri,HttpServletRequest request) {
	 * logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	 * logger.debug(sn); logger.debug("amount : "+amount);
	 * logger.debug("pageNum : "+pageNum);
	 * 
	 * 
	 * if(request.getParameter("pageNum") != null) { pageNum =
	 * Integer.parseInt(request.getParameter("pageNum")); }
	 * if(request.getParameter("amount") != null) { amount =
	 * Integer.parseInt(request.getParameter("amount")); }
	 * 
	 * 
	 * 
	 * int offset = (pageNum-1)*amount;
	 * 
	 * cri.setAmount(amount);
	 * 
	 * cri.setOffset(offset);
	 * 
	 * logger.debug("pageNum : "+pageNum); logger.debug("offset : "+offset);
	 * 
	 * List<ProjectVO> result = bService.proLSort(cri); logger.debug("22 "+result);
	 * 
	 * return result; }
	 */
	
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
	public String detailGET(HttpSession session, Model model) {
		// 프로젝트 리스트 상세정보
		int proj_no = (Integer)session.getAttribute("proj_no");
		
		ProjectVO resultVO = bService.dePro(proj_no);
		model.addAttribute(resultVO);
		// 로그인 여부 조회
		
		// 뷰페이지 이동
		return "/board/detailList";
	}
	
	
	//테스트용 페이지
	@GetMapping(value = "/list")
	public void pNumGET(Model model) {
		logger.debug(" /list -> pNumGET() 호출 ");

		int pNum = bService.pNum();
		model.addAttribute("pNum", pNum);

	}
	
	@RequestMapping(value = "/detailList")
	public void detailListGET() {
		
	}
	
	

}
