package com.itwillbs.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.itwillbs.persistence.ManagerDAO;
import com.itwillbs.dto.ManagerDTO;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Inject
    private ManagerDAO managerDAO;

    @Override
    public ManagerDTO getManagerById(String managerId) {
        return managerDAO.getManagerById(managerId);
    }

    @Override
    public void approveManager(int managerNo) {
        managerDAO.approveManager(managerNo);
    }

    @Override
    public List<ManagerDTO> getAllManagers() {
        return managerDAO.getAllManagers();
    }

    @Override
    public void insertManager(ManagerDTO manager) {
        managerDAO.insertManager(manager);
    }
    
    @Override
    public int getManagerCount() {
        return managerDAO.getManagerCount();
    }
    
    @Override
    public int getUnapprovedManagerCount() {
        return managerDAO.getUnapprovedManagerCount();
    }
}
