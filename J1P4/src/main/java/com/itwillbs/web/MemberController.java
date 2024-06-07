package com.itwillbs.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.service.MemberService;
// @RequestMapping(value = "/member/*")
// URI가 /member/~ 시작하는 모든 주소를 처리(매핑) ~.me, ~.bo
// GET/POST 방식 상관 없이 모두 처리 가능

@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체를 주입
	@Inject
	private MemberService mService;
	
	// http://localhost:8088/member/test
	// 회원가입 - 회원정보 입력(GET - 정보 보여주는 형태)
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void insertGET() {
		logger.debug(" /test -> insertGET() 호출 ");
		// 연결된 뷰페이지 실행 /WEB-INF/views/member/test.jsp
		logger.debug("/views/member/insert.jsp 페이지 연결");
	}
	
	
	// 회원가입 - 입력받은 정보 처리(POST - 정보 처리하는 형태)
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public String insertPOST(MemberVO vo) {
		logger.debug(" /insert -> insertPOST() 호출 ");
		// 한글 인코딩 => web.xml에 필터를 사용해서 처리
//		requset.setCharacterEncoding(); (x)
		
		// 전달정보를 저장(파라메터 - 아이디, 비밀번호, 이름, 이메일)
		// => 컨트롤러가 자동으로 파라메터 수집
		logger.debug(" vo : "+ vo);
		
		// 서비스 => DB에 회원가입 처리 메서드 호출
		mService.testJoin(vo);
		
		// 연결된 뷰페이지 실행(페이지 이동) -> 로그인 페이지		
		return "redirect:/member/test2";
	}
	
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public void testGET() {
		logger.debug(" /test2 -> testGET() 호출 ");
		// 연결된 뷰페이지 실행 /WEB-INF/views/member/test.jsp
		logger.debug("/views/member/test2.jsp 페이지 연결");
	}
	
	
	
	
	//---------------------------------------------------------------------------------------
	//회원가입 페이지
	// http://localhost:8088/member/insert
	
	//회원정보를 입력하는 것은 DB가 필요없으니깐 매개변수가 없는 것!
	// 정보를 보여주는 형태는 - GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertjoinGET() {
		
	}
	
	// 입력받은 회원정보를 보여줘야 하니깐 DB가 필요!! -> 매개변수 MemberVO vo를 써준다.
	// 입력받은 정보를 처리해야하니깐 -> POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertjoinPOST(MemberVO vo) {
		mService.join(vo);
		
		return "redirect:/member/test2"; // 회원가입하기 눌렀을때 어디로 페이지 이동할지 정하는 것!
		
	}
	
//-----------------------------------------------------------------------------------------
	
	
	//http://localhost:8088/member/login
	//로그인 페이지 
	//GET
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		
		return"/member/login";
	}
	
	//POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(HttpSession session, MemberVO vo ) {
		
		MemberVO resultVO= mService.memberLogin(vo);
		
		if(resultVO == null ) {
			
			return "redirect:/member/login";
		}
		
		session.setAttribute("user_id", resultVO.getUser_id());
		return"redirect:/member/test2";
	}
	
	
	
	
} // Controller
