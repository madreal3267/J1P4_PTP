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
//@Getter
//@Setter
//@ToString
//@AllArgsConstructor
//@NoArgsConstructor
public class MemberVO {
	// VO(Value Object) == DTO
//	private int aS; #{aS} => setaS() X /setAS() O
	
	private int test1;
	private String test2;
	
	private String user_id;
	private String user_pw;
	private String user_email;
	private String name;
	
	private Timestamp reg_date;
	private Timestamp update_date;

	
	// alt + shift + s -> r (get/set 메서드)
	
	
	// alt + shift + s -> s

	
	
}
