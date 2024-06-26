package com.itwillbs.service;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dto.ContractDTO;
import com.itwillbs.persistence.ContractDAO;
import com.itwillbs.util.DuplicateProjNoException;

@Service
public class ContractServiceImpl implements ContractService{
	
	@Inject
	private ContractDAO cdao;
	
	
	 

	@Override
    public void saveContract(ContractDTO contract) throws DuplicateProjNoException {
        // 프로젝트 번호 중복 확인
        if (cdao.existsByProjNo(contract.getProj_no())) {
            throw new DuplicateProjNoException("프로젝트 번호가 이미 존재합니다.");
        }
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
