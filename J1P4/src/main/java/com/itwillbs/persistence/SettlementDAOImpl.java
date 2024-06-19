package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwillbs.dto.SettlementDTO;

@Repository
public class SettlementDAOImpl implements SettlementDAO {

	@Autowired
    private SqlSession sqlSession;

    private static final String namespace = "com.itwillbs.mapper.AdminMapper";

    @Override
    public void updateSettlement(SettlementDTO settlement) {
        sqlSession.update(namespace + ".updateSettlement", settlement);
    }

    @Override
    public SettlementDTO getSettlementById(int settlementNo) {
        return sqlSession.selectOne(namespace + ".getSettlementById", settlementNo);
    }

    @Override
    public List<SettlementDTO> getAllSettlements() {
        return sqlSession.selectList(namespace + ".getAllSettlements");
    }

    @Override
    public List<SettlementDTO> getSettlementsByPriceCheck(boolean priceCheck) {
        return sqlSession.selectList(namespace + ".getSettlementsByPriceCheck", priceCheck);
    }

    @Override
    public List<SettlementDTO> getSettlementsBySettlementCheck(boolean settlementCheck) {
        return sqlSession.selectList(namespace + ".getSettlementsBySettlementCheck", settlementCheck);
    }

    @Override
    public SettlementDTO getSettlementByMerchantUid(String merchant_uid) {
        return sqlSession.selectOne(namespace + ".getSettlementByMerchantUid", merchant_uid);
    }

}
