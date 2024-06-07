package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.persistence.MyProManageDAO;

@Service
public class MyProManageServiceImpl implements MyProManageService {

	private static final Logger logger = LoggerFactory.getLogger(MyProManageServiceImpl.class);
	
	@Inject
	private MyProManageDAO mpmdao;

	@Override
	public String getDBTime() {
		
		return mpmdao.getTime();
	}
	
	
}
