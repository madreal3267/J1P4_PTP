package com.itwillbs.domain;

import lombok.Data;

@Data
public class PartnersVO {

	private int free_no;
	private String partners_nm;
	private String pDetails;
	private String user_id;
	public String getpDetails() {
		return pDetails;
	}
	public void setpDetails(String pDetails) {
		this.pDetails = pDetails;
	}
	
	
	
}
