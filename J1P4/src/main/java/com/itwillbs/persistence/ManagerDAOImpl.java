package com.itwillbs.persistence;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.itwillbs.dto.ManagerDTO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Inject
    private SqlSession sqlSession;
    private static final String namespace = "com.itwillbs.mapper.AdminMapper";

    @Override
    public ManagerDTO getManagerById(String managerId) {
        return sqlSession.selectOne(namespace + ".getManagerById", managerId);
    }

    @Override
    public void approveManager(int managerNo) {
        sqlSession.update(namespace + ".approveManager", managerNo);
    }

    @Override
    public List<ManagerDTO> getAllManagers() {
        return sqlSession.selectList(namespace + ".getAllManagers");
    }

    @Override
    public void insertManager(ManagerDTO manager) {
        sqlSession.insert(namespace + ".insertManager", manager);
    }
    
    @Override
    public void deleteManager(int managerNo) {
        sqlSession.delete(namespace + ".deleteManager", managerNo);
    }
    
    @Override
    public int getManagerCount() {
        return sqlSession.selectOne(namespace + ".getManagerCount");
    }
    
    @Override
    public int getUnapprovedManagerCount() {
        return sqlSession.selectOne(namespace + ".getUnapprovedManagerCount");
    }
}
