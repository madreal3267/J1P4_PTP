//package com.itwillbs.web;
//
//import com.itwillbs.dto.SettlementDTO;
//import com.itwillbs.service.SettlementService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.*;
//
//@RestController
//@RequestMapping("/api")
//public class WebhookController {
//
//    @Autowired
//    private SettlementService settlementService;
//
//    @PostMapping("/webhook")
//    public void processWebhook(@RequestBody String merchantUid) {
//        SettlementDTO settlement = settlementService.getSettlementByMerchantUid(merchantUid);
//        settlement.setSettlement_check(true);
//        settlementService.updateSettlement(settlement);
//    }
//}
