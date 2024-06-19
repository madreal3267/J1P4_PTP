package com.itwillbs.util;


import java.math.BigDecimal;

import lombok.Data;

@Data
public class PaymentRequest {
	
	private String pg;
    private String pay_method;
    private String merchant_uid;
    private String name;
    private BigDecimal amount;
    private String buyer_name;


	    

}
