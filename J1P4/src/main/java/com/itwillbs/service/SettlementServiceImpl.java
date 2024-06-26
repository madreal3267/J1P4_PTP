package com.itwillbs.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.dto.SettlementDTO;
import com.itwillbs.persistence.SettlementDAO;

@Service
public class SettlementServiceImpl implements SettlementService {

    @Autowired
    private SettlementDAO settlementDAO;


    @Override
    public void updateSettlement(SettlementDTO settlement) {
        settlementDAO.updateSettlement(settlement);
    }

    @Override
    public SettlementDTO getSettlementById(int settlementNo) {
        return settlementDAO.getSettlementById(settlementNo);
    }

    @Override
    public List<SettlementDTO> getAllSettlements() {
        return settlementDAO.getAllSettlements();
    }

    @Override
    public List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck) {
        return settlementDAO.getSettlementsByPriceCheck(priceCheck);
    }

    @Override
    public List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck) {
        return settlementDAO.getSettlementsBySettlementCheck(settlementCheck);
    }

    @Override
    public SettlementDTO getSettlementByMerchantUid(String merchant_uid) {
        return settlementDAO.getSettlementByMerchantUid(merchant_uid);
    }

    @Override
    public void createSettlement(SettlementDTO settlement) {
        settlementDAO.insertSettlement(settlement);
    }
}
