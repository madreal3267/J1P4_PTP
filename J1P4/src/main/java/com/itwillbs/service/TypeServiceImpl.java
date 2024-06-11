package com.itwillbs.service;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.TypeVO;
import com.itwillbs.persistence.TypeDAO;

@Service
public class TypeServiceImpl implements TypeService{
	
	

	private static final Logger logger = LoggerFactory.getLogger(TypeServiceImpl.class);
	
	@Inject TypeDAO tdao;
	
	@Override
	public void typeUpdate(TypeVO tvo) {
		tdao.updateType(tvo);
		
	}
	
	
	
}
