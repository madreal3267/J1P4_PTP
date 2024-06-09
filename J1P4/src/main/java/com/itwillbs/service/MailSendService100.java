package com.itwillbs.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;

import org.springframework.mail.javamail.JavaMailSender;

import com.itwillbs.domain.MemberVO;
import com.itwillbs.persistence.MailHandler;

public class MailSendService100 implements MailSendService {

	@Inject
	private JavaMailSender mailSender;
	@Inject
	private MemberVO vo;
	
	//인증코드 
	private boolean lowerCheck;
	private int size;
	
	public String getKey(int size, boolean lowerCheck) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		
		return init();
	}
	
	public String init() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = random.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		
		
		return sb.toString();
	}
	
	
	//-------------------------------------------------------------------------
	
	 public String sendAuthMail(String email) {
	        //6자리 난수 인증번호 생성
	        String authKey = getKey(6, true);

	        //인증메일 보내기
	        try {
	            MailHandler sendMail = new MailHandler(mailSender);
	            sendMail.setSubject("회원가입 이메일 인증");
	            sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
	            .append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
	            .append("<a href='http://localhost:8088/member/registerEmail?user_email=")
	            .append(email) //여기 email변수는 MaileHandller 클래스에 있는 변수
	            .append("&authKey=")
	            .append(authKey)
	            .append("' target='_blenk'>이메일 인증 확인</a>")
	            .toString());
	            sendMail.setFrom("이메일 주소", "관리자");
	            sendMail.setTo(email);
	            sendMail.send();
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        } catch (UnsupportedEncodingException e) {
	            e.printStackTrace();
	        }

	          return authKey;
			
			
	
	
	 }

	@Override
	public String updateMailKey(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMailAuth(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}		
}
