package com.itwillbs.domain;

import lombok.Data;

@Data
public class RegionVO {
	
	// region 테이블
	private int region_no;
	private int free_no;
	private int proj_no;
	private String region;
	private String district;
	private String temporary;
	private String user_id;

}
