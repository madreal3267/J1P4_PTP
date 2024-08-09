package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.dto.ProjectDTO;


public interface ProjectService {
	
	public List<ProjectDTO> getProjectsByStatus(String proj_status);

    public List<ProjectDTO> getAllProjects();

    public void updateProjectStatus(ProjectVO vo);

    public void rejectProject(ProjectVO vo);
    
    public ProjectVO getProjectById(int proj_no);
    
    int getProjectCount();
    
    List<Map<String, Object>> getProjectStatusCounts();
}
