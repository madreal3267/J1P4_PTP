package com.itwillbs.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProjectVO;
import com.itwillbs.domain.UserVO;
import com.itwillbs.dto.ContractDTO;
import com.itwillbs.dto.ProjectDTO;
import com.itwillbs.dto.SettlementDTO;
import com.itwillbs.dto.UserDTO;
import com.itwillbs.service.ContractService;
import com.itwillbs.service.ProjectService;
import com.itwillbs.service.SettlementService;
import com.itwillbs.service.UserService;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private UserService uService;
	
	@Inject
	private ProjectService pService;
	
	@Inject
	private SettlementService sService;
	
	@Inject
	private ContractService cService;
	
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
	
	@GetMapping("/projects")
	public String getProjects(@RequestParam(value = "proj_status", required = false) String proj_status, Model model) {
        List<ProjectDTO> projects;
        if (proj_status != null) {
            projects = pService.getProjectsByStatus(proj_status);
        } else {
            projects = pService.getAllProjects();
        }
        model.addAttribute("projects", projects);
        model.addAttribute("proj_status", proj_status);
        
        return "admin/projectList";
    }
	
	@PostMapping("/project/approve")
	public String approveProject(@RequestParam("proj_no") int proj_no) {
		ProjectVO pvo = new ProjectVO();
		pvo.setProj_no(proj_no);
		pvo.setProj_status("진행 중");
        pService.updateProjectStatus(pvo);
        logger.debug("승인 proj_no : " + proj_no);
        return "redirect:/admin/projects";
    }
	
	@PostMapping("/project/reject")
	public String rejectProject(@RequestParam("proj_no") int proj_no, @RequestParam("reject_reason") String reject_reason) {
		ProjectVO pvo = new ProjectVO();
		pvo.setProj_no(proj_no);
		pvo.setReject_reason(reject_reason);
        pService.rejectProject(pvo);
        return "redirect:/admin/projects";
    }
	
	 @GetMapping("/project/rejectReason")
	    @ResponseBody
	    public Map<String,String> getRejectReason(@RequestParam("proj_no") int proj_no) {
		 	ProjectVO pvo = pService.getProjectById(proj_no);
		 	Map<String,String> response = new HashMap<>();
		 	response.put("reject_reason", pvo.getReject_reason());
	        return response;
	    }
	 
	 @GetMapping("/settlement/paymentDetail")
	 public String getSettlements(@RequestParam(value = "price_check", required = false) Boolean price_check,Model model) {
		 
		 List<SettlementDTO> settlements;
		 
		 if (price_check != null) {
	            settlements = sService.getSettlementsByPriceCheck(price_check);
	        } else {
	            settlements = sService.getAllSettlements();
	        }
		 
		 model.addAttribute("settlements", settlements);
		 
		 return "admin/settlementList";
	 }
	 
	 
	 
	 
	 
	 
	 @GetMapping("/list")
	    public String getContractList(Model model) {
	        List<ContractDTO> contractList = cService.getContracts();
	        model.addAttribute("contractList", contractList);
	        return "admin/contractList";
	    }
	 
	 @PostMapping("/upload")
	    public String uploadContract(@RequestParam("proj_no") int proj_no,
	                                 @RequestParam("ct_no") int ct_no,
	                                 @RequestParam("free_no") int free_no,
	                                 @RequestParam("proj_title") String proj_title,
	                                 @RequestParam("file") MultipartFile file) {

	        String fileName = file.getOriginalFilename();
	        String uploadDir = "C:/uploads/"; // Change to your directory

	        try {
	            file.transferTo(new File(uploadDir + fileName));
	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        ContractDTO contract = new ContractDTO();
	        contract.setProj_no(proj_no);
	        contract.setCt_no(ct_no);
	        contract.setFree_no(free_no);
	        contract.setProj_title(proj_title);
	        contract.setContract_file(uploadDir + fileName);

	        cService.updateContract(contract);

	        return "redirect:/admin/contract/list";
	    }
	 
	 
	 @GetMapping("/download")
	    public String downloadContract(@RequestParam("contract_file") String contract_file, Model model) {
	        model.addAttribute("contract_file", contract_file);
	        return "admin/downloadView";
	    }
	
}
