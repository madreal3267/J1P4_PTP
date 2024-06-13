package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import com.itwillbs.dto.ContractDTO;

public interface ContractDAO {
	
	public void insertContract(ContractDTO contract);
    public ContractDTO selectContractById(int contract_no);
    public List<ContractDTO> selectAllContracts();
	
}
