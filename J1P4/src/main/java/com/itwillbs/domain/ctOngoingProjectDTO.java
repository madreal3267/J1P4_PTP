package com.itwillbs.domain;

import lombok.Data;

@Data
public class ctOngoingProjectDTO {
	
	// (클라이언트) 프로젝트 진행 중 
	private int proj_no;
	private String proj_title;
	private String manager_nm;
	private String proj_status;
	private String proj_cost;
	
	// 완료하기 필요
	private int ct_no;
	private int free_no;
	private int manager_no;
}
