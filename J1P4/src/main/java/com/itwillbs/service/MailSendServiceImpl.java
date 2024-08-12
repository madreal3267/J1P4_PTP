package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.MailHandler;
import com.itwillbs.persistence.MemberDAO;
import com.itwillbs.persistence.TempKey;

@Service
public class MailSendServiceImpl implements MailSendService{
	

	private static final Logger logger = LoggerFactory.getLogger(MailSendServiceImpl.class);

	
	@Inject
	private MemberDAO mdao;
	
	@Autowired
	private JavaMailSender mailSender; //MailHandler클래스에 있는 객체
	
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		logger.debug("이메일 인증");

		mdao.insert(vo);
		logger.debug("이메일 인증");

		String key = new TempKey().getKey(8, false); //난수를 생성하는 키
		
		MailHandler mailhandler = new MailHandler(mailSender);
		mailhandler.setSubject("[PTP 이메일 인증메일 입니다.]"); //메일제목
		mailhandler.setText(
				"<h1>메일인증</h1>" +
						"<br/>"+vo.getUser_id()+"님 "+
						"<br/>PTP에 회원가입해주셔서 감사합니다."+
						"<br/>아래 [이메일 인증 확인]을 눌러주세요."+
						"<a href='http://localhost:8088/J1P4_PTP/member/registerEmail?user_email=" + vo.getUser_email() +
						"&key=" + key +
						"' target='_blank'>이메일 인증 확인</a>");
		mailhandler.setFrom("itwil_j1p4@naver.com", "PTP");
		mailhandler.setTo(vo.getUser_email());
		mailhandler.send();
		
		
		logger.debug("이메일 인증");

		
	}
	
	
	//로그인 성공시 1로 반환
	@Override
	public int updateMailAuth(String mail_auth) throws Exception {
		mdao.updateMailAuth(mail_auth);
		
		return 0;
	}

	
	
	

	
	
}
