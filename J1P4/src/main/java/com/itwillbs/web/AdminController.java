package com.itwillbs.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.UserVO;
import com.itwillbs.dto.UserDTO;
import com.itwillbs.service.UserService;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private UserService uService;
	
	// 관리자 메인페이지 이동
	// http://localhost:8088/admin/main
	@GetMapping(value = "/main")
	public void mainGET() {
		logger.debug(" main -> mainGET() 호출");
		
		logger.debug("/views/admin/main.jsp 페이지 연결");
	}
	
//	// 회원정보 관리(회원 목록 출력)
//	@GetMapping(value = "/userList")
//	public void userListGET(Model model) {
//		logger.debug("/userList -> userListGET() 호출");
//		List<UserDTO> ul = uService.UserList();
//		logger.debug(" userList : " + ul.size());
//		model.addAttribute("ul", uService.UserList());
//	}
	
//	// 회원정보 관리(전체 목록)
//	@GetMapping("/allUsers")
//    public String allUsers(Model model) {
//        List<UserDTO> allUsers = uService.getAllUsers();
//        model.addAttribute("allUsers", allUsers);
//        return "allUsersView";
//    }
//
//	// 회원정보 관리(프리랜서 목록)
//    @GetMapping("/freelancers")
//    public String freelancers(Model model) {
//        List<UserDTO> freelancers = uService.getFreelancers();
//        model.addAttribute("freelancers", freelancers);
//        return "freelancersView";
//    }
//
//    // 회원정보 관리(클라이언트 목록)
//    @GetMapping("/clients")
//    public String clients(Model model) {
//        List<UserDTO> clients = uService.getClients();
//        model.addAttribute("clients", clients);
//        return "clientsView";
//    }
	
	// http://localhost:8088/admin/users?type=all
	// http://localhost:8088/admin/users?type=freelancers
	@GetMapping("/users")
    public String getUsers(@RequestParam(name = "type", required = false, defaultValue = "all") String type, Model model) {
        List<UserDTO> users;
        switch (type) {
            case "freelancers":
                users = uService.getFreelancers();
                break;
            case "clients":
                users = uService.getClients();
                break;
            case "all":
            default:
                users = uService.getAllUsers();
                break;
        }
        model.addAttribute("users", users);
        model.addAttribute("type", type);
        return "admin/userList";
    }
	
}
