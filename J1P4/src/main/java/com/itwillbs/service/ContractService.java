package com.itwillbs.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.itwillbs.dto.ContractDTO;
import com.itwillbs.util.DuplicateProjNoException;

public interface ContractService{
		
	public void saveContract(ContractDTO contract) throws DuplicateProjNoException;
    public ContractDTO getContractById(int contract_no);
    public List<ContractDTO> getAllContracts();
}
