package com.itwillbs.domain;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProjectVO {
	
	private String user_id;
	private int proj_no;
	private int ct_no;
	private int free_no;
	private String work_field;
	private String proj_title;
	private int proj_progress;
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
	private int pay_check;
	private int deadline_check;
	private String reject_reason;
	private Timestamp reg_date;
	private Timestamp mod_date;
	private String temporary;
	
}
