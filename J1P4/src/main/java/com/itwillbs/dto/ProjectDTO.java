package com.itwillbs.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ProjectDTO {
	private int proj_no;
    private String proj_title;
    private String ct_id; // 클라이언트 아이디
    private Date reg_date;
    private int work_period;
    private String proj_status;
    
    public String getFormattedRegDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(reg_date);
    }
}
