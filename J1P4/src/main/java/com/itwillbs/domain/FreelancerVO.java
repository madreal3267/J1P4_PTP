package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FreelancerVO {
	private String free_id;
	private int enroll_status;
	private String work_field;
	private String school_type;
	private String school_nm;
	private String major;
	private String grad_status;
	private String entrance;
	private String graduation;
	private int work_check;
	private String work_date;
	private int proj_cost;
	private String oneline_bio;
	private String bio;
	private Timestamp mod_date;
	private Timestamp reg_date;
}
