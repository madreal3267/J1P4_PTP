package com.itwillbs.service;

import java.math.BigDecimal;
import java.security.SecureRandom;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.dto.SettlementDTO;
import com.itwillbs.persistence.SettlementDAO;
import com.itwillbs.util.PaymentRequest;
import com.itwillbs.util.PaymentResponse;
import com.itwillbs.util.PortOneClient;


@Service
public class SettlementServiceImpl implements SettlementService {
		

		private static final Logger logger = LoggerFactory.getLogger(SettlementServiceImpl.class);
	
		@Autowired
	    private SettlementDAO settlementDAO;

	    @Autowired
	    private PortOneClient portOneClient;

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
		public void requestSettlement(SettlementDTO settlement) {
	    	settlementDAO.updateSettlement(settlement);
		}

		@Transactional
	    @Override
	    public void processSettlement(SettlementDTO settlement) {
	        // Calculate fee and settled cost
	        BigDecimal fee = settlement.getPrice().multiply(new BigDecimal("0.1"));
	        BigDecimal settledCost = settlement.getPrice().subtract(fee);

	        settlement.setFee(fee);
	        settlement.setSettled_cost(settledCost);
	        settlement.setMerchant_uid(UUID.randomUUID().toString());

	        // Call the payment API
	        PaymentRequest request = new PaymentRequest();
	        request.setPg("kakaopay");
	        request.setPay_method("easy");
	        request.setMerchant_uid(settlement.getMerchant_uid());
	        request.setName("정산 처리");
	        request.setAmount(settledCost);
	        request.setBuyer_name(settlement.getDepositor());

	        PaymentResponse response = portOneClient.requestPayment(request);

	        if (response.isSuccess()) {
	            // Update the settlement
	            settlement.setSettlement_check(true);
	            settlementDAO.updateSettlement(settlement);
	        } else {
	            throw new RuntimeException("Payment failed: " + response.getError_msg());
	        }
	    }


}