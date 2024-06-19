package com.itwillbs.dto;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class SettlementDTO {
	
	private int settlement_no;
    private int proj_no;
    private String proj_title;
    private String ct_id;
    private String free_id;
    private BigDecimal price;
    private BigDecimal settled_cost;
    private BigDecimal fee;
    private boolean price_check;
    private boolean settlement_check;
    private boolean settlement_requested;
    private String bank_nm;
    private String account;
    private String depositor;
    private String merchant_uid;
    
}
