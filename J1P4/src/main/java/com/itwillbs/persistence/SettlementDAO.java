package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.dto.SettlementDTO;

public interface SettlementDAO {
	
	List<SettlementDTO> getAllSettlements();
	
    List<SettlementDTO> getSettlementsByPriceCheck(boolean price_check);
}
