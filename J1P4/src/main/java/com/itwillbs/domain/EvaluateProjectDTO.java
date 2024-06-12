package com.itwillbs.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class EvaluateProjectDTO {

	private String proj_title;
	private int proj_no;
	private int free_no;
	private int ct_no; 			/* 평가하기 필요 */
	private String ct_id;
	private Timestamp mod_date;
	
	private double score;		/* 평가하기 필요 */
	private String content;		/* 평가하기 필요 */
	
	
}
