package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import com.itwillbs.dto.ContractDTO;
import com.itwillbs.util.DuplicateProjNoException;

public interface ContractDAO {
	
	public void insertContract(ContractDTO contract);
	public boolean existsByProjNo(int proj_no);
    public ContractDTO selectContractById(int contract_no);
    public List<ContractDTO> selectAllContracts();
	
}
