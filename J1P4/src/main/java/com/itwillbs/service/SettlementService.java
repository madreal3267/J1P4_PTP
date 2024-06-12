package com.itwillbs.service;

import java.util.List;

import com.itwillbs.dto.SettlementDTO;

public interface SettlementService {
	
	List<SettlementDTO> getAllSettlements();
	
    List<SettlementDTO> getSettlementsByPriceCheck(boolean price_check);
}
	    
