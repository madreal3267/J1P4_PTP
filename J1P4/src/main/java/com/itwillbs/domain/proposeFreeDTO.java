package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class proposeFreeDTO {
	
	private String proj_title;
	private String name;
	private String skills;
	private String yeoncha;
	private String apply_YN;
	
	private String free_id;
	private String skill_nm;
	private String region;
	private String district;
	private int proj_no;
	private int free_no;
	
	private String meeting_dt;
	private String meeting_pc;
	private int meetingOK;
	
}
