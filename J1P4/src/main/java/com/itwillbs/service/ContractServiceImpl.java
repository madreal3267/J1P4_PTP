package com.itwillbs.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dto.ContractDTO;
import com.itwillbs.persistence.ContractDAO;

@Service
public class ContractServiceImpl implements ContractService{
	
	@Inject
	private ContractDAO cdao;
	
	
	 

	    @Override
	    public void saveContract(ContractDTO contract) {
	    	cdao.insertContract(contract);
	    }

	    @Override
	    public ContractDTO getContractById(int contract_no) {
	        return cdao.selectContractById(contract_no);
	    }

	    @Override
	    public List<ContractDTO> getAllContracts() {
	        return cdao.selectAllContracts();
	    }
	
	
}
