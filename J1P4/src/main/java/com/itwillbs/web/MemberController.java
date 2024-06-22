package com.itwillbs.web;


import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.MailHandler;
import com.itwillbs.persistence.TempKey;
import com.itwillbs.service.MailSendService;
import com.itwillbs.service.MemberService;


@Controller
@RequestMapping(value = "/member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 서비스 객체를 주입
	@Inject
	private MemberService mService;
	
	@Inject
	private MailSendService mailSend;
	
	@Inject
	private SqlSession sqlSession;
	
	@Autowired
	private JavaMailSender mailSender;
	
	//---------------------------------------------------------------------------------------
	

	//회원가입 페이지
	// http://localhost:8088/member/insert
	
	//회원정보를 입력하는 것은 DB가 필요없으니깐 매개변수가 없는 것!
	// 정보를 보여주는 형태는 - GET
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public void insertjoinGET() {
		logger.debug("/insert -> insertjoinGET() 호출 ");
	

	}
	
	// 입력받은 회원정보를 보여줘야 하니깐 DB가 필요!! -> 매개변수 MemberVO vo를 써준다.
	// 입력받은 정보를 처리해야하니깐 -> POST
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertjoinPOST(@ModelAttribute MemberVO vo,HttpServletRequest request) throws Exception {
		logger.debug("/insert -> insertjoinPOST() 호출 ");
		
		//디비에 회원가입 정보 입력
//		mService.join(vo);
//		logger.debug("vo : "+vo);
		HttpSession session = request.getSession();
		String user_id =  vo.getUser_id();
		session.setAttribute("user_id",user_id);
		logger.debug("@@@@@@@@@@user_id: "+ user_id);
		
		mailSend.join(vo);
		// 회원가입하기 눌렀을때 mailsend에 인증메일 확인링크를 클릭해달라는 페이지로 이동
		return "redirect:/member/mailsend"; 
	}
		
	
	//회원가입 버튼을 누르면 mailsend와  연결해주기 위해서 매핑을 한번 더 해야함.
	//http://localhost:8088/member/mailsend
	@RequestMapping(value = "/mailsend", method = RequestMethod.GET)
	public void test() {
		
	}
	
	
	
	//이메일 인증 메일 
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String emailConfirm(String user_email, Model model, String user_id, HttpSession session )throws Exception{
		mailSend.updateMailAuth(user_email);
		model.addAttribute("user_email", user_email);
		String id = (String)session.getAttribute("user_id");
		logger.debug("@@@@@@@@@@id22 "+ id);
		
		return "/member/registerEmail"; //인증 성공 후 이동하는 페이지
	}
		
	
	
	//---------------------------------------------------------------------------------- 회원유형 선택	
		//프리랜서, 클라이언트 유형 선택 -> 개인,팀,사업자 선택하는 페이지
		// http://localhost:8088/member/registerEmail
		@GetMapping(value = "/registerEmail")
		public void typeGET( HttpSession session, String user_id) {
		
		
		}
		
		@PostMapping(value = "/registerEmailChage")
		public String type(MemberVO vo, HttpSession session, String free_id, String ct_id) throws Exception {
			String cf = vo.getUser_cf();
			String type = vo.getUser_type();
			logger.debug("@@@@@@@@@@@@ cf @@@@@@@@@@@@ :"+cf);
			logger.debug("@@@@@@@@@@@@ type @@@@@@@@@@@@ :"+type);
			
			mService.userCf(vo);
			mService.userType(vo);
			
			free_id = (String)session.getAttribute("user_id");
			ct_id = (String)session.getAttribute("user_id");
			
			if(cf.equals("클라이언트")) {
				mService.insertCt(ct_id);
			}else {
				if(type.equals("개인") || type.equals("팀")) {
					mService.insertFree(free_id);
					mService.insertLicense(free_id);
					mService.insertSkill(free_id);
					mService.insertCareer(free_id);
					mService.insertReg(free_id);
				}else {
					mService.insertFree(free_id);
					mService.insertReg(free_id);
					mService.insertSkill(free_id);
					mService.insertComp(free_id);
					mService.insertPartners(free_id);
					mService.insertCareer(free_id);
				}
			}
			
			
			return"redirect:/main/home";
		}
	

		
		
	//-----------------------------------------------------------------------
	
	//아이디 중복 체크
	//ajax로 처리할때는 @ResponseBody를 써야 응답이 가능.
	@GetMapping(value = "/idcheck")
	public @ResponseBody int idCheck(@RequestParam("userid") String id) throws Exception {
	
		logger.debug("id :"+id);
	
		int res = mService.idCheck(id);
		
		return res;
		
	}
	
	//----------------------------------------------------------9번  
	
	//로그인 페이지
	// http://localhost:8088/member/login
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() {
		
		return"/member/login";
	}
	
	
		//POST
		@RequestMapping(value = "/login", method = RequestMethod.POST)
		public String loginPOST(HttpSession session, MemberVO vo, HttpServletRequest request,String id ) throws Exception {
			
			MemberVO resultVO= mService.memberLogin(vo);
			
			System.out.println("resultVO : "+resultVO);
			
			
			//로그인 성공처리
			// 세션에 있으면 있는 세션반환, 없으면 신규 세션을 생성
			HttpSession Session = request.getSession();
			if(resultVO != null) {
				Session.setAttribute("user_id", resultVO.getUser_id());
				Session.setAttribute("user_cf", mService.sessCf(vo));
				Session.setAttribute("user_type", mService.sessType(vo));
				Session.setAttribute("free_no", mService.sessFreeNo(vo));
				Session.setAttribute("ct_no", mService.sessCtNo(vo));
				return"redirect:/main/home";
				
			}else {
				Session.setAttribute("user_id", null);
				logger.debug("로그인 실패");
				return "redirect:/member/login";
			}
			
		}
		
		
		@GetMapping(value = "/loginmain")
		public void mainGET() {
			
		}
		

		//로그아웃
		@GetMapping(value = "/logout")
		public String logoutPOST(HttpSession session) {

			logger.debug("/logoutPOST()호출");
			session.invalidate();//세션무효화
			
			return "redirect:/main/home";
		}
		
		
		
	
	
	//아이디 찾기 페이지 
	// http://localhost:8088/member/idfind
	@RequestMapping(value = "/idfind", method = RequestMethod.GET)
	public String search_id(HttpServletRequest request, Model model, MemberVO vo ) {
		
		
		return"/member/idfind";
	}
	
	//아이디 찾기 로직
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public String findId(MemberVO vo,Model model) throws Exception{
		logger.info("memberEmail"+vo.getUser_email());
				
		if(mService.findIdCheck(vo.getUser_email())==0) {
		model.addAttribute("msg", "이메일이 맞는지 확인해주세요");
		
		return "/member/idfind";
		
		}else {
		model.addAttribute("member", mService.findId(vo.getUser_email()));
		
		return"/member/findId";
		}
	}
	
	@GetMapping(value = "/findId")
	public void findIdGET() {
		
	}
	
	//Post로 처리하고, count한 값이 0이면 
	//아이디찾기 페이지로 msg라는 String값을 보낸다.
	//그렇지 않으면 아이디찾기 로직을 수행하고 /member/findId페이지로 이동
	
	//--------------------------------------------------------------
	
	

	//비밀번호 찾기 페이지 
	// http://localhost:8088/member/pwfind
	@RequestMapping(value = "/pwfind", method = RequestMethod.GET)
	public void search_pw() {
		
	}
	
	
	//비밀번호 재설정페이지로 이동 -> 난수 저장
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public String findpw(@RequestParam("user_id") String user_id, MemberVO vo, Model model) throws Exception {
		 

		
		System.out.println(vo);
		logger.info("///////////////////////"+user_id);
		
        MemberVO member = mService.findUserById(user_id);
        if (member != null) {
            // user_id가 존재하는 경우 처리 로직
            model.addAttribute("message", "User ID exists.");
            
            String key = new TempKey().getKey(8, false); //난수를 생성하는 키
			System.out.println("key:"+ key);
			vo.setMail_key(key);
			
			mService.findpw(vo);
			
			MailHandler mailhandler = new MailHandler(mailSender);
			mailhandler.setSubject("[캐프리 비밀번호 재설정 메일입니다.]"); //메일제목
			mailhandler.setText(
					"<h1>메일인증</h1>" +
							"<br/>"+vo.getUser_id()+"님 "+
							"<br/>비밀번호 변경을 위해서"+
							"<br/>아래 [비밀번호 변경하기]를 눌러주세요."+
							"<a href='http://192.168.7.213:8088/member/findpw?user_email=" + vo.getUser_email() +
							"&key=" + key +
							"' target='_blank'>비밀번호 변경하기</a>");
			mailhandler.setFrom("itwil_j1p4@naver.com", "캐프리");
			mailhandler.setTo(vo.getUser_email());
			mailhandler.send();
			
			
			logger.debug("이메일 인증");
            
            
            
			return"/member/findpw2";

        } else {
            // user_id가 존재하지 않는 경우 처리 로직
        	logger.debug("아이디없음");
			String msg ="아이디가 없습니다";
			model.addAttribute("msg", msg);
			
			return "/member/pwfind";
        }
    
		
		
	}
		
	
	//변경한 비밀번호 DB에 전달
	
	@GetMapping(value = "/findpw")
	public void main(HttpServletRequest request, Model model, String user_email) throws Exception {
		logger.debug("비번변경 Post()호출");
		
		
	}
	
	@PostMapping(value = "/chage")
	public String chagePw(String user_pw, String user_email,HttpServletRequest request, Model model)throws Exception {
		
		String result = mService.findUserByMailKey(user_email);
		logger.debug("@@@@@@@@@@@@ result @@@@@@@@@@@@ :"+result);
		String key = request.getParameter("key");
		logger.debug("@@@@@@@@@@@@ key @@@@@@@@@@@@ :"+key);
		
		if(result!=null &&key.equals(result)) {			
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("user_email", user_email);
			paramMap.put("user_pw", user_pw); //현재비밀번호
			
			logger.debug("@@@@@@@@@@@@ user_pw @@@@@@@@@@@@ :"+user_pw);
			
			mService.chagepw(paramMap); //비밀번호 변경 메서드 -> 비밀번호가 변경됨.
			logger.debug("@@@@@@@@"+paramMap);
			logger.debug("비밀번호 변경완료");
			
		}else {
			
			String msg ="비밀번호 변경실패";
			model.addAttribute("msg", msg);
		}
		
		return "redirect:/member/login";
	}
	
	
	@GetMapping(value = "/main")
	public void main() {
		
	}
		
			
	

	
	
	
	
	
} // Controller
