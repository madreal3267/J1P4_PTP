package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {

	private int test1;
	private String test2;
	
	private String user_id;
	private String user_pw;
	private String user_email;
	private String name;
	
	private Timestamp reg_date;
	private Timestamp update_date;
	
	private String mail_key;
	private int mail_auth;
	
}
