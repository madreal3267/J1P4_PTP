package com.itwillbs.persistence;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource; //??왜 activation을 써야하는걸깡
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;


public class MailHandler { //인증메일을 보냈을때 해당하는 내용
	
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	//메일제목
	public void setSubject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}
	
	//메일내용
	public void setText(String htmlContent) throws MessagingException {
		messageHelper.setText(htmlContent, true);
	}
	
	//메일 발송자
	public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
		messageHelper.setFrom(email, name);
	}
	
	//메일 수신자
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}
	
	//메일 본문에 인라인
	public void addInline(String contentId, DataSource dataSource) throws MessagingException {
		messageHelper.addInline(contentId, dataSource);
	}
	
	//메일 전송
	public void send() {
		mailSender.send(message);
	}
	
	
	
	
	
	
}
