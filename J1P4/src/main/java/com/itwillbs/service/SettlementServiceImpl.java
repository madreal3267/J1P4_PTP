package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<SettlementDTO> getSettlementsByPriceCheck(boolean price_check) {
		return sdao.getSettlementsByPriceCheck(price_check);
	}

	
	
	
	
	
}
