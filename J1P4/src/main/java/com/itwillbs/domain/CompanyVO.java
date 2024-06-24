package com.itwillbs.domain;

import lombok.Data;

@Data
public class CompanyVO {

	private int free_no;
	private String yearmonth;
	private String hDetails;
	private String user_id;
	public String gethDetails() {
		return hDetails;
	}
	public void sethDetails(String hDetails) {
		this.hDetails = hDetails;
	}
	
	
}
