package com.itwillbs.domain;

import lombok.Data;

@Data
public class ProjectVO {
	private int proj_no;
    private int ct_no;
    private int free_no;
    private String work_field;
    private String proj_title;
    private int proj_progress;
    private String start_date;
    private int date_nego;
    private int work_period;
    private int no_recruited;
    private String deadline;
    private int proj_cost;
    private int cost_nego;
    private String pmeet_meth;
    private String meet_meth;
    private String proj_content;
    private String job_level;
    private int career_proof;
    private int wanted_career;
    private String dlvy_msg;
    private String proj_status;
    private int pay_check;
    private int deadline_check;
    private String reject_reason;
    private String reg_date;
    private String meet_cycle;
    private String temporary;
}
