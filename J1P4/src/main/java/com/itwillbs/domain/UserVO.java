package com.itwillbs.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class UserVO {
	
	private String user_id;
	private String user_email;
	private String user_pw;
	private LocalDateTime reg_date;
	private String user_type;
//	private String profile; 프로필사진 보류
	private String bank_nm;
	private String depositor;
	private String account;
	private String name;
	private boolean gender;
	private LocalDate birth_date;
	private String addr;
	private boolean check_email;
	private String phone_no;
	private String team_nm;
	private LocalDate est_date;
	private String tax_email;
	private String rep_nm;
	private String business_registration;
	private LocalDateTime update_date;
}
