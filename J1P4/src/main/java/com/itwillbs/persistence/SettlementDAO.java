package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.dto.SettlementDTO;

public interface SettlementDAO {
	
	List<SettlementDTO> getAllSettlements();
    List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck);
    List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck);
    SettlementDTO getSettlementById(int settlement_no);
    void updateSettlement(SettlementDTO settlement);
}
