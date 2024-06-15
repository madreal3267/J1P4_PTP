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
        return sqlSession.selectList(NAMESPACE + "getAllSettlements");
    }

    @Override
    public List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck) {
        return sqlSession.selectList(NAMESPACE + "getSettlementsByPriceCheck", priceCheck);
    }

    @Override
    public List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck) {
        return sqlSession.selectList(NAMESPACE + "getSettlementsBySettlementCheck", settlementCheck);
    }

    @Override
    public SettlementDTO getSettlementById(int settlement_no) {
        return sqlSession.selectOne(NAMESPACE + "getSettlementById", settlement_no);
    }

    @Override
    public void updateSettlement(SettlementDTO settlement) {
        sqlSession.update(NAMESPACE + "updateSettlement", settlement);
    }
	
	
	
}
