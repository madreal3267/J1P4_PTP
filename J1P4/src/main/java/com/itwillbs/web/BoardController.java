package com.itwillbs.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.itwillbs.domain.ApplyVO;
import com.itwillbs.domain.BMarkVO;
import com.itwillbs.domain.Criteria;
import com.itwillbs.domain.FreelancerVO;
import com.itwillbs.domain.MemberVO;
import com.itwillbs.domain.OfferVO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.RegionVO;
import com.itwillbs.domain.SkillVO;
import com.itwillbs.service.BoardService;
import com.itwillbs.service.MyProfileService;
import com.itwillbs.service.OfferProjServie;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	HashMap<String, Object> data = new HashMap<>();

	@Inject
	private BoardService bService;

	
	// http://localhost:8088/board/listPro
	// 기본 페이지
	@GetMapping(value = "/listPro")
	public void list(Criteria cri, Model model, HttpServletRequest request,BMarkVO vo) {
		logger.debug("/listPro 실행 ");
		// 북마크 체크
		Integer fn = (Integer)request.getSession().getAttribute("free_no");
		if(request.getSession().getAttribute("free_no") != null) {
			logger.debug("프리랜서 로그인!");
			logger.debug("fn"+fn);
			List<BMarkVO> bMproj_no = bService.freebMark(fn);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}
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
	public String listPage(Criteria cri, Model model, HttpServletRequest request,@RequestParam("sn") String sn, String work_field, ProjectVO vo) {
		logger.debug("/listProP 실행 ");
		logger.debug("work_field " + work_field);

		
		int pNum = bService.fiNum(vo);
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
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));
		
		// 북마크 체크
		Integer fn = (Integer)request.getSession().getAttribute("free_no");
		if(request.getSession().getAttribute("free_no") != null) {
			logger.debug("프리랜서 로그인!");
			logger.debug("fn"+fn);
			List<BMarkVO> bMproj_no = bService.freebMark(fn);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}
		
		// 데드라인 일때 예외
		if(sn.equals("deadline")) {
			logger.debug("@@@@ deadline 정렬 확인용111111111@@@@");
			model.addAttribute("list", bService.proLSortD(cri));
			return "/board/listPro";			
		}
		
		logger.debug("@@@@ deadline 정렬 확인용222222222@@@@");
		
		model.addAttribute("list", bService.proLSort(cri));
		
		return "/board/listPro";
		
	}
	// 정렬 후 페이지
	@PostMapping(value = "/listProFi")
	public String listPageFi(Criteria cri, Model model, HttpServletRequest request,@RequestParam("sn") String sn, String work_field, ProjectVO vo) {
		logger.debug("/listProFi 실행 ");
		logger.debug("work_field " + work_field);
		
		// 북마크 체크
		Integer fn = (Integer)request.getSession().getAttribute("free_no");
		if(request.getSession().getAttribute("free_no") != null) {
			logger.debug("프리랜서 로그인!");
			logger.debug("fn"+fn);
			List<BMarkVO> bMproj_no = bService.freebMark(fn);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}
		
		int pNum = bService.fiNum(vo);
		model.addAttribute("pNum", pNum);
		
		int pageNum = 1;
		int amount = 6;
		
		int offset = (pageNum-1)*amount;
		
		cri.setAmount(amount);
		
		cri.setOffset(offset);
		
		logger.debug("pageNum : "+pageNum);
		logger.debug("offset : "+offset);
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));
		
		// 데드라인 일때 예외
		if(sn.equals("deadline")) {
			logger.debug("@@@@ deadline 정렬 확인용111111111@@@@");
			model.addAttribute("list", bService.proLSortD(cri));
			return "/board/listPro";			
		}
		
		logger.debug("@@@@ deadline 정렬 확인용222222222@@@@");
		
		model.addAttribute("list", bService.proLSort(cri));
		
		return "/board/listPro";
		
	}
	

	 //정렬하기
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
	public void fiterList(@RequestParam("work_field") String work_field, Model model,ProjectVO pvo, Criteria cri, HttpServletRequest request) {
		logger.debug("work_field : "+work_field);
		
		// 북마크 체크
		Integer fn = (Integer)request.getSession().getAttribute("free_no");
		if(request.getSession().getAttribute("free_no") != null) {
			logger.debug("프리랜서 로그인!");
			logger.debug("fn"+fn);
			List<BMarkVO> bMproj_no = bService.freebMark(fn);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}
		
		
		List<ProjectVO> list = bService.proFi(cri);
		model.addAttribute("list", list);
		
		pvo.setWork_field(work_field);

		int fiNum = bService.fiNum(pvo);
		model.addAttribute("pNum", fiNum);
		logger.debug("fiNum : "+fiNum);
		
		model.addAttribute("pageMaker", new PageDTO(cri, fiNum));
	

		
	}
	
	@GetMapping(value = "/detailList")
	public String detailGET(@RequestParam("proj_no") int proj_no, Model model, HttpServletRequest request, ProjectVO vo) {
		// 프로젝트 리스트 상세정보
		
		ProjectVO resultVO = bService.dePro(proj_no);
		model.addAttribute(resultVO);
		int ct_no = resultVO.getCt_no();
		// 평점 전달
		String sc = String.valueOf(bService.proScoC(ct_no));
		
		if(sc.equals("0")){
			logger.debug("널값 확인용000000000000");
			model.addAttribute("score", 0);
		}else {
			logger.debug("널값 확인용");
			logger.debug("ct_no"+ct_no);
			double score = bService.proSco(ct_no);
			model.addAttribute("score", score);	
		}
		// 북마크 체크
			Integer fn = (Integer)request.getSession().getAttribute("free_no");
			if(request.getSession().getAttribute("free_no") != null) {
				logger.debug("프리랜서 로그인!");
				logger.debug("fn"+fn);
				List<BMarkVO> bMproj_no = bService.freebMark(fn);
				logger.debug("bMproj_no"+bMproj_no);
				
				model.addAttribute("bMproj_no", bMproj_no);
				// 프로젝트 지원
				model.addAttribute("skill",bService.getSkillA(proj_no));
			}
		// 뷰페이지 이동
		return "/board/detailList";
	}
	
	
	
	// http://localhost:8088/board/listFree
	@GetMapping(value = "/listFree")
	public void flist(Criteria cri, Model model, HttpServletRequest request) {
		
		// 북마크 체크
		Integer ct = (Integer)request.getSession().getAttribute("ct_no");
		if(request.getSession().getAttribute("ct_no") != null) {
			logger.debug("클라이언트 로그인!");
			logger.debug("ct"+ct);
			List<BMarkVO> bMproj_no = bService.bMarkC(ct);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}
		
		int pNum = bService.fNum();
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
		
		model.addAttribute("list", bService.fListPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));


	}
	
	// 북마크 등록
	@GetMapping(value = "/dobMark")
	@ResponseBody
	public void dobMark(@RequestParam int proj_no, HttpSession session, BMarkVO vo, HttpServletRequest request){
		
		// 게시물 번호
		vo.setProj_no(proj_no);
		
		// 로그인한 프리랜서
		Integer Free_no = (Integer)request.getSession().getAttribute("free_no");
		
		// 테스트용 프리랜서
		//int Free_no = 349;
		vo.setFree_no(Free_no);

		// 디비에 북마크 저장
		bService.doBMark(vo);
		
		
		logger.debug("북마크 저장");
	}
	
	// 북마크 해제
	@GetMapping(value = "/deletebMark")
	@ResponseBody
	public void deleteBMark(@RequestParam int proj_no, HttpSession session, BMarkVO vo, HttpServletRequest request){
		
		// 게시물 번호
		vo.setProj_no(proj_no);
		
		// 로그인한 프리랜서
		Integer Free_no = (Integer)request.getSession().getAttribute("free_no");
		
		// 테스트용 프리랜서
		//int Free_no = 349;
		vo.setFree_no(Free_no);
		
		
		// 디비에 북마크 해제
		bService.deleteBMark(vo);
		
		logger.debug("북마크 해제");
	}
	
	// 모달 필터
	@RequestMapping(value = "/moFiListPro", method = RequestMethod.POST)
	public String moFi(ProjectVO vo, Criteria cri, String skill_nm,String sn, Model model, String modalCheck, HttpServletRequest request) {
		
		logger.debug("vo : "+vo);
		logger.debug("sn : "+sn);
		
		// 북마크 체크
		Integer fn = (Integer)request.getSession().getAttribute("free_no");
		if(request.getSession().getAttribute("free_no") != null) {
			logger.debug("프리랜서 로그인!");
			logger.debug("fn"+fn);
			List<BMarkVO> bMproj_no = bService.freebMark(fn);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}

		// worke_fiel를 선택안했을 시는 기본 "개발"
		if(vo.getWork_field() == null) {
			cri.setWork_field("개발");
			vo.setWork_field("개발");
		}
		// district를 선택안했을 시는 ""으로 변경
		if(vo.getDistrict().equals("전체")) {
			cri.setDistrict("");
			vo.setDistrict("");
		}

	
		
		model.addAttribute("skill_nm", skill_nm);
		model.addAttribute("job_level", vo.getJob_level());
		model.addAttribute("region", vo.getRegion());
		model.addAttribute("district", vo.getDistrict());
		
		model.addAttribute("modalCheck", modalCheck);

		
		// skill_nm 없을때
		if(vo.getSkill_nm() == null) {
			int pNum = bService.mofiNumNs(vo);
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
			model.addAttribute("pageMaker", new PageDTO(cri, pNum));
			// sn 없을때
			if(sn == null) {
				cri.setSn("reg_date");
				logger.debug("@@@@ 정렬 확인용 sn vo.getSkill_nm() @@@@");
				model.addAttribute("list", bService.moFiProNs(cri));
				return "/board/listPro";		
			}
			// 데드라인 일때 예외
			if(sn.equals("deadline")) {
				logger.debug("@@@@ deadline 정렬 확인용 vo.getSkill_nm()@@@@");
				model.addAttribute("list", bService.moFiProDNs(cri));
				return "/board/listPro";			
			}
			model.addAttribute("list", bService.moFiProNs(cri));
			logger.debug("@@@@ 정렬 확인용 vo.getSkill_nm @@@@");
			return "/board/listPro";		
		}
		if(skill_nm == "") {
			int pNum = bService.mofiNumNs(vo);
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
			
			model.addAttribute("pageMaker", new PageDTO(cri, pNum));
			// sn 예외
			if(sn == null) {
				cri.setSn("reg_date");
				logger.debug("@@@@ 정렬 확인용 sn skill_nm @@@@");
				model.addAttribute("list", bService.moFiProNs(cri));
				return "/board/listPro";		
			}
			// 데드라인 일때 예외
			if(sn.equals("deadline")) {
				logger.debug("@@@@ deadline 정렬 확인용skill_nm @@@@");
				model.addAttribute("list", bService.moFiProDNs(cri));
				return "/board/listPro";			
			}
			logger.debug("@@@@ 정렬 확인용 skill_nm @@@@");
			model.addAttribute("list", bService.moFiProNs(cri));
			return "/board/listPro";		
		}
		
		int pNum = bService.mofiNum(vo);
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
		logger.debug("skill_nm : "+skill_nm);
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));
		
		// sn 예외
		if(sn == null) {
			cri.setSn("reg_date");
			logger.debug("@@@@ 정렬 확인용 sn @@@@");
			if(skill_nm == null) {
				model.addAttribute("list", bService.moFiProNs(cri));
				return "/board/listPro";		
			}
			model.addAttribute("list", bService.moFiPro(cri));
			return "/board/listPro";			
		}
		// 데드라인 일때 예외
		if(sn.equals("deadline")) {
			logger.debug("@@@@ deadline 정렬 확인용111111111@@@@");
			model.addAttribute("list", bService.moFiProD(cri));
			return "/board/listPro";			
		}
		logger.debug("@@@@ 정렬 확인용 XXX @@@@");
		model.addAttribute("list", bService.moFiPro(cri));
		
		return "/board/listPro";
		//return "";
	}

	
	// 프리랜서 필터, 정렬, 페이징 페이지
	@GetMapping(value = "/listFreeP")
	public String listPageFree(Criteria cri, Model model, HttpServletRequest request,@RequestParam("sn") String sn, String work_field, FreelancerVO vo) {
		logger.debug("/listFreeP 실행 ");
		logger.debug("work_field " + work_field);

		
		int pNum = bService.fiNumFree(vo);
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
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));
		
		// 북마크 체크
		Integer ct = (Integer)request.getSession().getAttribute("ct_no");
		if(request.getSession().getAttribute("ct_no") != null) {
			logger.debug("클라이언트 로그인!");
			logger.debug("ct"+ct);
			List<BMarkVO> bMproj_no = bService.bMarkC(ct);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}
		
		
		logger.debug("@@@@ 222222222@@@@");
		
		model.addAttribute("list", bService.freeLSort(cri));
		
		return "/board/listFree";
		
	}
	
	// 모달 필터 프리랜서 찾기
	@RequestMapping(value = "/moFiListFree", method = RequestMethod.POST)
	public String moFiFree(FreelancerVO vo, Criteria cri, String skill_nm,String sn, Model model, String modalCheck, HttpServletRequest request) {
		
		logger.debug("vo : "+vo);
		logger.debug("sn : "+sn);
		
		// 북마크 체크
		Integer ct = (Integer)request.getSession().getAttribute("ct_no");
		if(request.getSession().getAttribute("ct_no") != null) {
			logger.debug("클라이언트 로그인!");
			logger.debug("ct"+ct);
			List<BMarkVO> bMproj_no = bService.bMarkC(ct);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
		}

		// worke_fiel를 선택안했을 시는 기본 "개발"
		if(vo.getWork_field() == null) {
			cri.setWork_field("개발");
			vo.setWork_field("개발");
		}
		// district를 선택안했을 시는 ""으로 변경
		if(vo.getDistrict().equals("전체")) {
			cri.setDistrict("");
			vo.setDistrict("");
		}

	
		
		model.addAttribute("skill_nm", skill_nm);
		model.addAttribute("job_level", vo.getJob_lev());
		model.addAttribute("region", vo.getRegion());
		model.addAttribute("district", vo.getDistrict());
		
		model.addAttribute("modalCheck", modalCheck);

		
		// skill_nm 없을때
		if(vo.getSkill_nm() == null) {
			int pNum = bService.mofiNumNsFree(vo);
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
			model.addAttribute("pageMaker", new PageDTO(cri, pNum));
			// sn 없을때
			if(sn == null) {
				cri.setSn("reg_date");
				logger.debug("@@@@ 정렬 확인용 sn vo.getSkill_nm() @@@@");
				model.addAttribute("list", bService.moFiFreeNs(cri));
				return "/board/listFree";		
			}
			
			model.addAttribute("list", bService.moFiFreeNs(cri));
			logger.debug("@@@@ 정렬 확인용 vo.getSkill_nm @@@@");
			return "/board/listFree";		
		}
		if(skill_nm == "") {
			int pNum = bService.mofiNumNsFree(vo);
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
			
			model.addAttribute("pageMaker", new PageDTO(cri, pNum));
			// sn 예외
			if(sn == null) {
				cri.setSn("reg_date");
				logger.debug("@@@@ 정렬 확인용 sn skill_nm @@@@");
				model.addAttribute("list", bService.moFiFreeNs(cri));
				return "/board/listFree";		
			}
			
			logger.debug("@@@@ 정렬 확인용 skill_nm @@@@");
			model.addAttribute("list", bService.moFiFreeNs(cri));
			return "/board/listFree";		
		}
		
		int pNum = bService.mofiNumFree(vo);
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
		logger.debug("skill_nm : "+skill_nm);
		model.addAttribute("pageMaker", new PageDTO(cri, pNum));
		
		// sn 예외
		if(sn == null) {
			cri.setSn("reg_date");
			logger.debug("@@@@ 정렬 확인용 sn @@@@");
			if(skill_nm == null) {
				model.addAttribute("list", bService.moFiFreeNs(cri));
				return "/board/listFree";		
			}
			model.addAttribute("list", bService.moFiFree(cri));
			return "/board/listFree";			
		}
		
		logger.debug("@@@@ 정렬 확인용 XXX @@@@");
		model.addAttribute("list", bService.moFiFree(cri));
		
		return "/board/listFree";
	}
	
	// 프리랜서 상세페이지 이동
	@GetMapping(value = "/detailListFree")
	public String detailFreeGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session,HttpServletResponse response, HttpServletRequest request) {
		// 프로젝트 리스트 상세정보

		model.addAttribute("free_no",vo.getFree_no());
		logger.debug("vo : "+vo);
		
		model.addAttribute("myPortf", bService.getPortf(vo));

		
		// 북마크 체크, 프리랜서에게 제안할 정보 전달
		Integer ct = (Integer)request.getSession().getAttribute("ct_no");
		if(request.getSession().getAttribute("ct_no") != null) {
			logger.debug("클라이언트 로그인!");
			logger.debug("ct"+ct);
			List<BMarkVO> bMproj_no = bService.bMarkC(ct);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
			// 클라이언트가 프리랜서에게 제안
			List<ProjectVO> pvo = bService.getProj(ct);
			model.addAttribute("proj",pvo);
		}
		logger.debug("vo.getUser_type"+vo.getUser_type());
		if(vo.getUser_type()!=null) {
			if(vo.getUser_type().equals("개인") || vo.getUser_type().equals("팀")) {
				model.addAttribute("myProfile", bService.getProfile(vo));
				model.addAttribute("mySkill", bService.getSkill(vo));
				model.addAttribute("myReg",bService.getReg(vo));
				model.addAttribute("myCareer", bService.getCareer(vo));
				model.addAttribute("myLicense", bService.getLicense(vo));
				return "/board/detailListFree";
			}else if(vo.getUser_type().equals("사업자")) {			
					model.addAttribute("myProfile", bService.getProfile(vo));
					model.addAttribute("mySkill", bService.getSkill(vo));
					model.addAttribute("myReg",bService.getReg(vo));
					model.addAttribute("myCareer", bService.getCareer(vo));
					model.addAttribute("myComp", bService.getComp(vo));
					model.addAttribute("myPartn", bService.getPartn(vo));
					return "/board/detailListFreeC";
			}
		}
		model.addAttribute("myProfile", bService.getProfile(vo));
		model.addAttribute("mySkill", bService.getSkill(vo));
		model.addAttribute("myReg",bService.getReg(vo));
		model.addAttribute("myCareer", bService.getCareer(vo));
		model.addAttribute("myLicense", bService.getLicense(vo));
		// 뷰페이지 이동
		return "/board/detailListFree";
	}
	// 프리랜서 상세페이지 이동
	@GetMapping(value = "/detailListFreeC")
	public String detailFreeCGET(@RequestParam int free_no, Model model,FreelancerVO vo,HttpSession session,HttpServletResponse response, HttpServletRequest request) {
		// 프로젝트 리스트 상세정보

		model.addAttribute("free_no",vo.getFree_no());
		logger.debug("vo : "+vo);
		
		model.addAttribute("myPortf", bService.getPortf(vo));

		
		// 북마크 체크, 프리랜서에게 제안할 정보 전달
		Integer ct = (Integer)request.getSession().getAttribute("ct_no");
		if(request.getSession().getAttribute("ct_no") != null) {
			logger.debug("클라이언트 로그인!");
			logger.debug("ct"+ct);
			List<BMarkVO> bMproj_no = bService.bMarkC(ct);
			logger.debug("bMproj_no"+bMproj_no);
			
			model.addAttribute("bMproj_no", bMproj_no);
			// 클라이언트가 프리랜서에게 제안
			List<ProjectVO> pvo = bService.getProj(ct);
			model.addAttribute("proj",pvo);
		}
					
		model.addAttribute("myProfile", bService.getProfile(vo));
		model.addAttribute("mySkill", bService.getSkill(vo));
		model.addAttribute("myReg",bService.getReg(vo));
		model.addAttribute("myCareer", bService.getCareer(vo));
		model.addAttribute("myComp", bService.getComp(vo));
		model.addAttribute("myPartn", bService.getPartn(vo));
		return "/board/detailListFreeC";		
					
	}
	
	
	
	
	// 클라이언트가 프리랜서를 북마크 등록
	@GetMapping(value = "/dobMarkC")
	@ResponseBody
	public void dobMarkC(@RequestParam int free_no, HttpSession session, BMarkVO vo, HttpServletRequest request){
		
		// 게시물 번호
		vo.setFree_no(free_no);
		
		// 로그인한 클라이언트
		Integer ct_no = (Integer)request.getSession().getAttribute("ct_no");
		
		// 테스트용 프리랜서
		//int Free_no = 349;
		vo.setCt_no(ct_no);;

		// 디비에 북마크 저장
		bService.doBMarkC(vo);
		
		
		logger.debug("북마크 저장");
	}
	
	// 클라이언트가 프리랜서를 북마크 해제
	@GetMapping(value = "/deletebMarkC")
	@ResponseBody
	public void deleteBMarkC(@RequestParam int free_no, HttpSession session, BMarkVO vo, HttpServletRequest request){
		
		// 게시물 번호
		vo.setFree_no(free_no);
		
		// 로그인한 클라이언트
		Integer ct_no = (Integer)request.getSession().getAttribute("ct_no");
		
		// 테스트용 프리랜서
		//int Free_no = 349;
		vo.setCt_no(ct_no);
		
		
		// 디비에 북마크 해제
		bService.deleteBMarkC(vo);
		
		logger.debug("북마크 해제");
	}
	
	@PostMapping(value="/offerProj")
	@ResponseBody
	public void offerProjPOST(OfferVO vo) {
		logger.debug(" Controller : ( •̀ ω •́ )y /offerProj -> offerProjPOST() 실행 ");
		
		bService.insertOffer(vo);
		
	}
	
	@PostMapping(value="/applyProj")
	@ResponseBody
	public void ApplyProjPOST(ApplyVO vo) {
		logger.debug(" Controller : ( •̀ ω •́ )y /applyProj -> ApplyProjPOST() 실행 ");
		
		bService.insertApply(vo);
		
	}
	
	
	
	
}
