package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.dto.ProjectDTO;
import com.itwillbs.persistence.ProjectDAO;

@Service
public class ProjectServiceImpl implements ProjectService {
	

	private static final Logger logger = LoggerFactory.getLogger(ProjectServiceImpl.class);
	
	@Inject
	private ProjectDAO pdao;
	
	
	@Override
	public List<ProjectDTO> getProjectsByStatus(String proj_status) {
		logger.debug("컨트롤러 -> 서비스 호출");
		logger.debug("getProjectsByStatus() 실행");
		return pdao.getProjectsByStatus(proj_status);
	}

	@Override
	public List<ProjectDTO> getAllProjects() {
		logger.debug("컨트롤러 -> 서비스 호출");
		logger.debug("getAllProjects() 실행");
		return pdao.getAllProjects();
	}

	@Override
	public void updateProjectStatus(ProjectVO vo) {
		logger.debug("컨트롤러 -> 서비스 호출");
		logger.debug("updateProjectStatus() 실행");
		
		pdao.updateProjectStatus(vo);
		
	}

	@Override
	public void rejectProject(ProjectVO vo) {
		logger.debug("컨트롤러 -> 서비스 호출");
		logger.debug("rejectProject() 실행");
		
		pdao.rejectProject(vo);
	}

	@Override
	public ProjectVO getProjectById(int proj_no) {
		return pdao.getProjectById(proj_no);
	}
	
	
}
