package com.itwillbs.domain;

import lombok.Data;

@Data
public class TypeVO {
	
	private String user_id;
	private String user_type; // 개인, 팀, 사업자 
	private String user_cp; // 프리랜서, 클라이언트
	private int mail_auth; //디폴트 0 -> 유형선택시 1로 변경
}
