package com.itwillbs.domain;


import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//@Data : 자동으로 get/set 메서드, toString 메서드 사용

@Data

public class MemberVO {
	
	
	private String user_id;
	private String user_pw;
	private String user_email;
	private String name;
	
	private Timestamp reg_date;
	private Timestamp update_date;
	
	private String mail_key;
	private int mail_auth;
	

	private String profile;
	
	private String user_cf; 
	private String user_type;
	
	//프리랜서 테이블
	private String free_id; // 회원id
	private int enroll_status; // 등록여부 - 디폴트 0
	
	//클라이언트 테이블
	private String ct_id; //회원id
		
	
	
	//<회원정보>

	
	private String team_nm; //팀명/회사명/ 법인명 
	private String rep_nm; //대표자명
	private String est_date; //설립일
	private String addr; //주소, 나머지 주소
	
	private int phone_no; //핸드폰 번호, 전화번호
	
	private String tax_email; //세금계산서용 

	//<신원인증>
	
	private int business_registration; //사업자등록번호

	//<계좌관리>
	private String bank_nm; //은행명
	private String depositor; //예금주
	private int account; //계좌번호

	

	
	
	
	
}
