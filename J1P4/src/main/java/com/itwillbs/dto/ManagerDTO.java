package com.itwillbs.dto;

import lombok.Data;

@Data
public class ManagerDTO {
	
	private int manager_no;
    private String manager_nm;
    private String manager_call;
    private String manager_email;
    private String manager_id;
    private String manager_pw;
    private boolean approved;
}
