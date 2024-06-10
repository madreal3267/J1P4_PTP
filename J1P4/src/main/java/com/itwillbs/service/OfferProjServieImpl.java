package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.persistence.OfferProjDAO;

@Service
public class OfferProjServieImpl implements OfferProjServie {
	
	private static final Logger logger = LoggerFactory.getLogger(OfferProjServieImpl.class);
	
	@Inject
	private OfferProjDAO odao;

	@Override
	public List<ProjectVO> getProj() {
		logger.debug(" (●'◡'●) Service: getProj(vo) 실행 ");
		return odao.getProj();
	}

	@Override
	public void insertOffer(ProjectVO vo) {
		odao.insertOffer(vo);
	}
	
	
	
	
	
}
