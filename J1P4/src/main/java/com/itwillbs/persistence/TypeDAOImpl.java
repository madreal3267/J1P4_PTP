package com.itwillbs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.TypeVO;

@Repository
public class TypeDAOImpl implements TypeDAO {
	

	private static final Logger logger = LoggerFactory.getLogger(TypeDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession; 

	private static final String NAMESPACE 
	               = "com.itwillbs.mapper.MemberMapper.";
	
	//유형, 클라이언트/프리랜서, 회원가입성공여부
	@Override
	public void updateType(TypeVO tvo) {
		sqlSession.update(NAMESPACE+"updateTypeCp", tvo);
		
	}
	
	
	
}
