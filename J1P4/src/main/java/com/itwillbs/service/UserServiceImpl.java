package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.dto.UserDTO;
import com.itwillbs.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Inject
	private UserDAO udao;

	@Override
	public List<UserDTO> getAllUsers() {
		logger.debug("컨트롤러 -> 서비스 호출");
		logger.debug("getAllUsers() 실행");
		return udao.getAllUsers();
	}

	@Override
	public List<UserDTO> getFreelancers() {
		logger.debug("컨트롤러 -> 서비스 호출");
		logger.debug("getFreelancers() 실행");
		return udao.getFreelancers();
	}

	@Override
	public List<UserDTO> getClients() {
		logger.debug("컨트롤러 -> 서비스 호출");
		logger.debug("getClients() 실행");
		return udao.getClients();
	}
	
//	@Override
//	public List<UserDTO> UserList() {
//		logger.debug("컨트롤러 -> 서비스 호출");
//		logger.debug("userList() 실행");
//		
//		
//		return udao.userList();
//	}
	
	
	
	
}
