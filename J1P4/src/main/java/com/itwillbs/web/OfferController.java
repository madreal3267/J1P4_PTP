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

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.service.OfferProjServie;

@Controller
@RequestMapping(value = "/freelancerDetail/*")
public class OfferController {
	
	private static final Logger logger = LoggerFactory.getLogger(OfferController.class);
	
	@Inject
	private OfferProjServie oService;
	
	// http://localhost:8088/freelancerDetail/offerProj
	@GetMapping(value="/offerProj")
	public void offerProjGET(Model model) {
		logger.debug(" Controller : ( •̀ ω •́ )y /offerProj -> enrollGET() 실행 ");
		
		List<ProjectVO> vo = oService.getProj();
		
		model.addAttribute("proj",vo);
		
		logger.debug(" Controller : ( •̀ ω •́ )y /views/freelancerDetail/offerProj.jsp 페이지 연결 ");
		
	}
	
	@PostMapping(value="/offerProj")
	public void insertOfferPOST(ProjectVO vo) {
		oService.insertOffer(vo);
		
	}

}
