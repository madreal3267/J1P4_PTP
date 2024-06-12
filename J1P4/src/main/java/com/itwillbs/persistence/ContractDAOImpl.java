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
    public List<ContractDTO> getContracts() {
        return sqlSession.selectList(NAMESPACE + "getContracts");
    }

    @Override
    public void updateContract(ContractDTO contract) {
        sqlSession.update(NAMESPACE + "updateContract", contract);
    }
	
	
	
}
