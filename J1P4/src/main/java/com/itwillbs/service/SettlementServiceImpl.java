package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.dto.SettlementDTO;
import com.itwillbs.persistence.SettlementDAO;

@Service
public class SettlementServiceImpl implements SettlementService {
	
	@Autowired
	private SettlementDAO sdao;

	@Override
    public List<SettlementDTO> getAllSettlements() {
        return sdao.getAllSettlements();
    }

    @Override
    public List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck) {
        return sdao.getSettlementsByPriceCheck(priceCheck);
    }

    @Override
    public List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck) {
        return sdao.getSettlementsBySettlementCheck(settlementCheck);
    }

    @Override
    public SettlementDTO getSettlementById(int settlement_no) {
        return sdao.getSettlementById(settlement_no);
    }

    @Override
    public void updateSettlement(SettlementDTO settlement) {
    	sdao.updateSettlement(settlement);
    }

    @Override
    @Transactional
    public void processSettlement(SettlementDTO settlement) {
//        // 결제 처리 로직
//        int fee = (int) (settlement.getPrice() * 0.1); // 수수료 10%
//        int settledCost = settlement.getPrice() - fee;
//
//        PortoneClient client = new PortoneClient("api_key", "api_secret"); // 포트원 클라이언트 생성
//        PaymentRequest request = new PaymentRequest();
//        request.setAmount(settledCost);
//        request.setReceiver(settlement.getFree_id()); // 프리랜서 ID를 수신자로 설정
//
//        try {
//            PaymentResponse response = client.makePayment(request);
//            if (response.isSuccess()) {
//                // 결제 성공 시
//                settlement.setFee(fee);
//                settlement.setSettled_cost(settledCost);
//                settlement.setSettlement_check(true);
//                sdao.updateSettlement(settlement);
//            } else {
//                throw new RuntimeException("Payment failed: " + response.getMessage());
//            }
//        } catch (Exception e) {
//            throw new RuntimeException("Payment processing error: " + e.getMessage());
//        }
    }
   
	
}
