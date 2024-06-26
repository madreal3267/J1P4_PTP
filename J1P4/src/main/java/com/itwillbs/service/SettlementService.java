package com.itwillbs.service;

import java.util.List;

import com.itwillbs.dto.SettlementDTO;

public interface SettlementService {
	
	void updateSettlement(SettlementDTO settlement);
    SettlementDTO getSettlementById(int settlementNo);
    List<SettlementDTO> getAllSettlements();
    List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck);
    List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck);
    SettlementDTO getSettlementByMerchantUid(String merchant_uid);
    void createSettlement(SettlementDTO settlement);
}
	    