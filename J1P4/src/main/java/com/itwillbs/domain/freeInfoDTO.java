package com.itwillbs.domain;

import lombok.Data;

@Data
public class freeInfoDTO {
	
	// 프리랜서 페이지 출력 내용
	private String user_id;
	private String name;
	private String work_field;
	private int yeoncha;
	private String school_type;
	private String region;
	private String district;
	private String skills;
	private String job_level;
	private String oneline_bio;
	
	private int career_count;
	private int portfolio_count;
}
