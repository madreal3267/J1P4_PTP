package com.itwillbs.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {
	
	private int no;  // free_no 또는 ct_no에 해당하는 공통 필드
    private String id; // free_id 또는 ct_id에 해당하는 공통 필드
    private String name;
    private String user_type;
    
    private Date reg_date;
    
    private String role; // "freelancer" 또는 "client" 역할
    
    public String getFormattedRegDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(reg_date);
    }
    
}
