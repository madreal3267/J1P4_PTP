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
	    public void insertContract(ContractDTO contract) {
	        cdao.insertContract(contract);
	    }

	    @Override
	    public List<ContractDTO> getContracts() {
	        return cdao.getContracts();
	    }

	    @Override
	    public void updateContract(ContractDTO contract) {
	    	cdao.updateContract(contract);
	    }
	
	
}
