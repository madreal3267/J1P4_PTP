package com.itwillbs.domain;

import java.util.Date;

import lombok.Data;

@Data
public class FreelancerVO {
	
	private int free_no;
    private String free_id;
    private int enroll_status;
    private String work_field;
    private String school_type;
    private String school_nm;
    private String major;
    private String grad_status;
    private Date entrance;
    private Date graduation;
    private int work_check;
    private Date work_date;
    private int proj_cost;
    private String oneline_bio;
    private String bio;
    private Date reg_date;
    private Date mod_date;
}
