package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProjectVO {


	/* 프로젝트 테이블 */
	private int proj_no;
	private int ct_no;
	private int free_no;
	
	private String work_field;
	private String proj_title;
	private String proj_progress;
	private String start_date;
	private int date_nego;
	private String work_period;
	private String no_recruited;
	private String deadline;
	private String proj_cost;
	private int cost_nego;
	
	private String pmeet_meth;
	private String meet_meth;
	private String meet_cycle;
	private String proj_content;
	private String job_level;
	
	private int career_proof;
	private String wanted_career;
	
	private String dlvy_msg;
	private String proj_status;
	private int pay_check = 0; // Default 값 0 (false)
	private int deadline_check;
	private String reject_reason;
	private String reg_date;
	private String mod_date;
	
	// 추가
	private int rn;
	private int count;
	
	// skill 테이블
	private String skill_nm;
	
	// region 테이블
	private String region;
	private String district;

	// 지윤씨
	private String temporary;
	private String user_id;

}