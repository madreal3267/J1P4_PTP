package com.itwillbs.domain;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Data : 자동으로 get/set 메서드, toString 메서드 사용

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
	
	private int phone_no;
	private String profile;
	
	private String user_cf; 
	private String user_type;
	
	//프리랜서 테이블
	private String free_id; // 회원id
	private int enroll_status; // 등록여부 - 디폴트 0
	
	//클라이언트 테이블
	private String ct_id; //회원id
		
	
}
