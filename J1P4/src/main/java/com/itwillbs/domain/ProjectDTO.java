package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProjectDTO {
	
	// project_table
	private int proj_no; 			// 프로젝트 진행중
	private int ct_no;				
									// private int free_no; 삭제 요청합니다.
	private String work_field;		// 관심
	private String proj_title;		// 관심, 진행 중 
	private int proj_progress;
	private Date start_date;
	private int date_nego;
	private String work_period;		// 관심
	private int no_recruited;
	private Date deadline;
	private String proj_cost;			// 관심
	private int cost_nego;
	private String pmeet_meth;
	private String meet_meth;
	private String meet_cycle;
	private String proj_content;
	private String job_level;
	private int career_proof; 
	private int wanted_career;
	private String dlvy_msg;
	private String proj_status;		// 진행 중
	private int pay_check;
	private int deadline_check;
	private String reject_reason;
	private Timestamp reg_date;		// 관심
	private Timestamp mod_date;
	
	// skill_table
	private String skill_nm;
	
	// region_table
	private String region;
	private String district;
	
	// 지원하기 필요
	private int free_no;			// 진행 중
	private String free_id;
	
	// 프로젝트 진행중 필요
	private String ct_id;			// 프로젝트 진행 중 
	private String manager_nm;		// 프로젝트 진행 중
	private Timestamp meeting_dt;
	private String meeting_pc;
	private int meetingOK;
	
	//지원 종료에 필요
	private int reject_check;
	
}
