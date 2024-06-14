package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EvaluateFreelancerDTO {

	// 평가 대기중 프로젝트 출력 요소
	private String proj_title;
	private String name; 
	private Timestamp mod_date;
	// 프리랜서 평가 입력에 필요한 요소
	private int ct_no;
	private int free_no;
	// 프리랜서 평가 입력 요소
	private double score;
	private String content;
}
