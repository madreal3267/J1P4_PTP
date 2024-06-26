package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.dto.ContractDTO;

@Repository
public class ContractDAOImpl implements ContractDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ContractDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.AdminMapper.";

	

    @Override
    public void insertContract(ContractDTO contract) {
        sqlSession.insert(NAMESPACE + "insertContract", contract);
    }
    
    @Override
    public boolean existsByProjNo(int proj_no) {
        Integer count = sqlSession.selectOne(NAMESPACE + "existsByProjNo", proj_no);
        return count != null && count > 0;
    }

    @Override
    public ContractDTO selectContractById(int contract_no) {
        return sqlSession.selectOne(NAMESPACE + "selectContractById", contract_no);
    }

    @Override
    public List<ContractDTO> selectAllContracts() {
        return sqlSession.selectList(NAMESPACE + "selectAllContracts");
    }
	
	
	
	
	
}
