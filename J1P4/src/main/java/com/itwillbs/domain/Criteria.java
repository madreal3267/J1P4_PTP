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
		this(1,10);
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	
}
