package com.itwillbs.dto;

import lombok.Data;

@Data
public class SettlementDTO {
	
	private int settlement_no;
    private int proj_no;
    private String proj_title;
    private String ct_id;
    private String free_id;
    private int price;
    private boolean price_check;
    private int settled_cost;
    private int fee;
    private boolean settlement_check;
    private boolean settlement_requested;
    
    
    
}
