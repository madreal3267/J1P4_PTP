package com.itwillbs.domain;


import java.util.Date;

import lombok.Data;

@Data
public class UserVO {
	
	private String user_id;
	private String user_email;
	private String user_pw;
	private Date reg_date;
	private String user_type;
//	private String profile; 프로필사진 보류
	private String bank_nm;
	private String depositor;
	private String account;
	private String name;
	private boolean gender;
	private Date birth_date;
	private String addr;
	private boolean check_email;
	private String phone_no;
	private String team_nm;
	private Date est_date;
	private String tax_email;
	private String rep_nm;
	private String business_registration;
	private Date update_date;
	private Integer mail_Auth;
    private String mail_Key;
}
