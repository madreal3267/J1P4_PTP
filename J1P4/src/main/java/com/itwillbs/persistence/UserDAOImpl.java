package com.itwillbs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.UserVO;
import com.itwillbs.dto.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(UserDAOImpl.class);

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE
					= "com.itwillbs.mapper.UserMapper.";

	@Override
	public List<UserDTO> getAllUsers() {
		List<UserDTO> resultVO = sqlSession.selectList(NAMESPACE + "getAllUsers");
		return resultVO;
	}

	@Override
	public List<UserDTO> getFreelancers() {
		List<UserDTO> resultVO = sqlSession.selectList(NAMESPACE + "getFreelancers");
		return resultVO;
	}

	@Override
	public List<UserDTO> getClients() {
		List<UserDTO> resultVO = sqlSession.selectList(NAMESPACE + "getClients");
		return resultVO;
	}
	
	
//	유저 목록
//	@Override
//	public List<UserDTO> userList() {
//		
//		List<UserDTO> resultVO = sqlSession.selectList(NAMESPACE + "userList");
//		
//		logger.debug(resultVO.toString());
//		
//		return resultVO;
//	}
	
	
	
	
	
}
