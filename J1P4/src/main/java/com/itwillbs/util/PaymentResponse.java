package com.itwillbs.util;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class PaymentResponse {
	private boolean success;
    private String error_msg;

    
}