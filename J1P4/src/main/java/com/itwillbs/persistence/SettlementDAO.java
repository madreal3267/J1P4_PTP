package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.dto.SettlementDTO;

public interface SettlementDAO {
	
	void updateSettlement(SettlementDTO settlement);
    SettlementDTO getSettlementById(int settlementNo);
    List<SettlementDTO> getAllSettlements();
    List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck);
    List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck);
    SettlementDTO getSettlementByMerchantUid(String merchant_uid);
    void insertSettlement(SettlementDTO settlement);
}