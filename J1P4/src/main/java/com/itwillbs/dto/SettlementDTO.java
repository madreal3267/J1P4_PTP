package com.itwillbs.dto;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class SettlementDTO {
	
	private int settlement_no;
    private int proj_no;
    private int ct_no;
    private int free_no;
    private String proj_title;	
    private String ct_id;
    private String free_id;
    private BigDecimal price = BigDecimal.ZERO.setScale(0);
    private BigDecimal settled_cost = BigDecimal.ZERO.setScale(0);
    private BigDecimal fee = BigDecimal.ZERO.setScale(0);
    private boolean price_check;
    private boolean settlement_check;
    private boolean settlement_requested;
    private String bank_nm;
    private String account;
    private String depositor;
    private String merchant_uid;
    
    
    public void setPrice(BigDecimal price) {
        this.price = price.setScale(0, BigDecimal.ROUND_DOWN);
    }

    public void setSettled_cost(BigDecimal settled_cost) {
        this.settled_cost = settled_cost.setScale(0, BigDecimal.ROUND_DOWN);
    }

    public void setFee(BigDecimal fee) {
        this.fee = fee.setScale(0, BigDecimal.ROUND_DOWN);
    }
}