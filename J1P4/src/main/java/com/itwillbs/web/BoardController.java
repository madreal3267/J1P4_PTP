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
	public void list(Criteria cri, Model model) {

		model.addAttribute("list", bService.pListPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));

		int pNum = bService.pNum();
		model.addAttribute("pNum", pNum);


	}

	@GetMapping(value = "/listProto")
	@ResponseBody
	public List<ProjectVO> getRejectReason(@RequestParam("sn") String sn,ProjectVO pvo, Criteria cri) {
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		logger.debug(sn);

		List<ProjectVO> result = bService.proLSort(cri);
		logger.debug("22 "+result);

		return result;
	}
	
//	@GetMapping(value = "/listProto")
//	@ResponseBody
//	public List<ProjectVO> getRejectReason(@RequestParam("sn") String sn,ProjectVO pvo, Criteria cri) {
//		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
//		logger.debug(sn);
//		
//		List result = bService.proLSort(cri);
//		
//		return result;
//	}

	/*
	 * @GetMapping(value = "/listProto")
	 * 
	 * @ResponseBody public List<ProjectVO> list(Criteria cri,Model
	 * model, @RequestParam("sn") String sn) throws Exception {
	 * logger.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

	 * return bService.pCostDesc(cri); }
	 */

	@GetMapping(value = "/list")
	public void pNumGET(Model model) {
		logger.debug(" /list -> pNumGET() 호출 ");

		int pNum = bService.pNum();
		model.addAttribute("pNum", pNum);

	}

}
