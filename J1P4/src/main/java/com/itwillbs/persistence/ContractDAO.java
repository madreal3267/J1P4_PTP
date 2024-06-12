package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import com.itwillbs.dto.ContractDTO;

public interface ContractDAO {
	
	public void insertContract(ContractDTO contract);
    public List<ContractDTO> getContracts();
    public void updateContract(ContractDTO contract);
	
}
