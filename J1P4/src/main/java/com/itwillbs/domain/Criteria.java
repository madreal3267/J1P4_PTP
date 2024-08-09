package com.itwillbs.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int pageNum;
	private int amount;
	private String type;
	private String keyword;
	
	private int skip;
	
	private String sn;
	
	public Criteria() {
		this(1,6);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public int offset;
	public String work_field;
	public String job_level;
	public String skill_nm;
	public String region;
	public String district;
	private String job_lev;
	
}
