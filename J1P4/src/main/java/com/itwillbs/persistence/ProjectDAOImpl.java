package com.itwillbs.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.dto.ProjectDTO;

@Repository
public class ProjectDAOImpl implements ProjectDAO {
	
	

	private static final Logger logger = LoggerFactory.getLogger(ProjectDAOImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE
					= "com.itwillbs.mapper.AdminMapper.";
	
	@Override
	public List<ProjectDTO> getProjectsByStatus(String proj_status) {
		List<ProjectDTO> resultVO = sqlSession.selectList(NAMESPACE + "getProjectsByStatus", proj_status);
		return resultVO;
	}
	
	@Override
	public List<ProjectDTO> getAllProjects() {
		List<ProjectDTO> resultVO = sqlSession.selectList(NAMESPACE + "getAllProjects");
		return resultVO;
	}

	@Override
	public void updateProjectStatus(ProjectVO vo) {
		
		sqlSession.update(NAMESPACE + "updateProjectStatus", vo);
	}

	@Override
	public void rejectProject(ProjectVO vo) {
		sqlSession.update(NAMESPACE + "rejectProject", vo);
	}

	@Override
	public ProjectVO getProjectById(int proj_no) {
		return sqlSession.selectOne(NAMESPACE + "getProjectById", proj_no);
	}
	
	@Override
    public int getProjectCount() {
        return sqlSession.selectOne(NAMESPACE + "getProjectCount");
    }
	
	@Override
    public List<Map<String, Object>> getProjectStatusCounts() {
        return sqlSession.selectList(NAMESPACE + "getProjectStatusCounts");
    }
}
