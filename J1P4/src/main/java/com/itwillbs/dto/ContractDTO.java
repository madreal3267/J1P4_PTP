package com.itwillbs.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class ContractDTO {
	private int contract_no;
    private int proj_no;
    private String contract_title;
    private String contract_path;
    private Date upload_date;
    private String proj_title;
    private String ct_id;
    private String free_id;
    
    public String getFormattedUploadDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(upload_date);
    }
}
