package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class MyProManageDAOImpl implements MyProManageDAO {

	private static final Logger logger = LoggerFactory.getLogger(MyProManageDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.itwillbs.mapper.MyProManageMapper.";

	@Override
	public String getTime() {
		
		String result = sqlSession.selectOne(NAMESPACE+"getTime");
		logger.debug("DAO : 결과 -" + result);
		return result;
	}
	
	
}
