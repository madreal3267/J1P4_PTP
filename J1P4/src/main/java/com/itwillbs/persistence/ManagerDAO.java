package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.dto.ManagerDTO;

public interface ManagerDAO {
	ManagerDTO getManagerById(String managerId);
	
    void approveManager(int managerNo);
    
    List<ManagerDTO> getAllManagers();
    
    void insertManager(ManagerDTO manager);
    
    void deleteManager(int managerNo);
    
    int getManagerCount();
    
    int getUnapprovedManagerCount();
}
