package com.itwillbs.service;

import java.util.List;

import com.itwillbs.dto.SettlementDTO;

public interface SettlementService {
	
	void requestSettlement(SettlementDTO settlement);
    void updateSettlement(SettlementDTO settlement);
    void processSettlement(SettlementDTO settlement);
    SettlementDTO getSettlementById(int settlementNo);
    List<SettlementDTO> getAllSettlements();
    List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck);
    List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck);
    SettlementDTO getSettlementByMerchantUid(String merchant_uid);

}
	    
