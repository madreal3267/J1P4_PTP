package com.itwillbs.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.dto.SettlementDTO;

@Repository
public class SettlementDAOImpl implements SettlementDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE
				= "com.itwillbs.mapper.AdminMapper.";

	@Override
	public List<SettlementDTO> getAllSettlements() {
		List<SettlementDTO> resultDTO = sqlSession.selectList(NAMESPACE + "getAllSettlements");
		return resultDTO;
	}

	@Override
	public List<SettlementDTO> getSettlementsByPriceCheck(boolean price_check) {
		List<SettlementDTO> resultDTO = sqlSession.selectList(NAMESPACE + "getSettlementsByPriceCheck", price_check);
		return resultDTO;
	}
	
	
	
}
