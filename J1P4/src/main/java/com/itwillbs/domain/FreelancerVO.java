package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FreelancerVO {
	/* 프리랜서 테이블*/
	private int free_no;
	private String free_id;
	private String enroll_status;
	private String work_field;
	private String scholl_type;
	private String school_nm;
	private String major;
	private String grad_status;
	
	private Timestamp entrance ;
	private Timestamp graduation ;
	
	private String work_check;
	private Timestamp work_date ;
	
	private int proj_cost;
	private String oneline_bio;
	private String bio;
	
	private Timestamp reg_date ;
	private Timestamp mod_date ;
	

}
