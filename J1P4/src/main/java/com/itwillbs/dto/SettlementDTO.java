package com.itwillbs.dto;

import lombok.Data;

@Data
public class SettlementDTO {
	
	private int proj_no;
    private String proj_title;
    private String ct_id;
    private String free_id;
    private int price;
    private boolean price_check;
    
}
