package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.dto.ContractDTO;

public interface ContractService {
		
	public void insertContract(ContractDTO contract);
    public List<ContractDTO> getContracts();
    public void updateContract(ContractDTO contract);
}
