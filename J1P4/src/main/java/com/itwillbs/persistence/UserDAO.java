package com.itwillbs.persistence;

import java.util.List;

import com.itwillbs.dto.UserDTO;

public interface UserDAO {
		
	List<UserDTO> getAllUsers();	// freelancer join client 테이블
    List<UserDTO> getFreelancers(); // freelancer join user 테이블
    List<UserDTO> getClients();     // client  join user 테이블
    int getUserCount();
    int getFreelancerCount();
    int getClientCount();
    
 // 추가 메서드
    String getClientIdByCtNo(int ct_no);
    String getFreelancerIdByFreeNo(int free_no);
}