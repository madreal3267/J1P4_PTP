package com.itwillbs.web;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ProjectVO;
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
	private SettlementService settlementService;
	
	@Autowired
	private ContractService cService;
	
	
	// 관리자 메인페이지 이동
	// http://localhost:8088/admin/main
	@GetMapping(value = "/main")
	public void mainGET() {
		logger.debug(" main -> mainGET() 호출");
		
		logger.debug("/views/admin/main.jsp 페이지 연결");
	}
	

	
	// http://localhost:8088/admin/users?type=all
	// http://localhost:8088/admin/users?type=freelancers
	// 회원 정보관리 메서드
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
	// 프로젝트 관리 메서드들
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
	// 프로젝트 승인 메서드
	@PostMapping("/project/approve")
	public String approveProject(@RequestParam("proj_no") int proj_no) {
		ProjectVO pvo = new ProjectVO();
		pvo.setProj_no(proj_no);
		pvo.setProj_status("진행 중");
        pService.updateProjectStatus(pvo);
        logger.debug("승인 proj_no : " + proj_no);
        return "redirect:/admin/projects";
    }
	// 프로젝트 반려 메서드
	@PostMapping("/project/reject")
	public String rejectProject(@RequestParam("proj_no") int proj_no, @RequestParam("reject_reason") String reject_reason) {
		ProjectVO pvo = new ProjectVO();
		pvo.setProj_no(proj_no);
		pvo.setReject_reason(reject_reason);
        pService.rejectProject(pvo);
        return "redirect:/admin/projects";
    }
	// 프로젝트 반려 사유를 가져오는 메서드
	 @GetMapping("/project/rejectReason")
	    @ResponseBody
	    public Map<String,String> getRejectReason(@RequestParam("proj_no") int proj_no) {
		 	ProjectVO pvo = pService.getProjectById(proj_no);
		 	Map<String,String> response = new HashMap<>();
		 	response.put("reject_reason", pvo.getReject_reason());
	        return response;
	    }
	 
	 
	 @GetMapping("/settlements")
	    public String getSettlements(Model model,
	                                 @RequestParam(value = "price_check", required = false) Boolean priceCheck,
	                                 @RequestParam(value = "settlement_check", required = false) Boolean settlementCheck) {
	        List<SettlementDTO> settlements;

	        if (priceCheck != null) {
	            settlements = settlementService.getSettlementsByPriceCheck(priceCheck);
	        } else if (settlementCheck != null) {
	            settlements = settlementService.getSettlementsBySettlementCheck(settlementCheck);
	        } else {
	            settlements = settlementService.getAllSettlements();
	        }

	        model.addAttribute("settlements", settlements);
	        return "admin/settlementList";
	    }
	 	// 정산 금액과 수수료를 가져오는 메서드.
	    @GetMapping("/settlements/{settlement_no}/calculate")
	    @ResponseBody
	    public SettlementDTO calculateSettlement(@PathVariable("settlement_no") int settlementNo) {
	        SettlementDTO settlement = settlementService.getSettlementById(settlementNo);
	        BigDecimal fee = settlement.getPrice().multiply(new BigDecimal("0.1"));
	        BigDecimal settledCost = settlement.getPrice().subtract(fee);
	        settlement.setFee(fee);
	        settlement.setSettled_cost(settledCost);
	        return settlement;
	    }
	    // 정산 정보를 업데이트 하는 메서드.
	    @PostMapping("/settlements/{settlement_no}/update")
	    @ResponseBody
	    public ResponseEntity<String> updateSettlement(@PathVariable("settlement_no") int settlementNo,
	                                                   @RequestBody SettlementDTO updatedSettlement) {
	        try {
	            SettlementDTO settlement = settlementService.getSettlementById(settlementNo);
	            settlement.setFee(updatedSettlement.getFee());
	            settlement.setSettled_cost(updatedSettlement.getSettled_cost());
	            settlement.setSettlement_check(true);
	            settlementService.updateSettlement(settlement);
	            return ResponseEntity.ok("정산 정보가 성공적으로 업데이트되었습니다.");
	        } catch (Exception e) {
	            logger.error("Error updating settlement: ", e);
	            return ResponseEntity.status(500).body("서버 업데이트에 실패하였습니다. 에러 내용: " + e.getMessage());
	        }
	    }

	 
	 
	/* 클라이언트 결제처리 */
//	 @GetMapping("/settlements")
//	    public String getSettlements(Model model,
//	                                 @RequestParam(value = "price_check", required = false) Boolean priceCheck,
//	                                 @RequestParam(value = "settlement_check", required = false) Boolean settlementCheck) {
//	        List<SettlementDTO> settlements;
//
//	        if (priceCheck != null) {
//	            settlements = settlementService.getSettlementsByPriceCheck(priceCheck);
//	        } else if (settlementCheck != null) {
//	            settlements = settlementService.getSettlementsBySettlementCheck(settlementCheck);
//	        } else {
//	            settlements = settlementService.getAllSettlements();
//	        }
//
//	        model.addAttribute("settlements", settlements);
//	        return "admin/settlementList";
//	    }
//
//	    @GetMapping("/settlements/{settlement_no}/calculate")
//	    @ResponseBody
//	    public SettlementDTO calculateSettlement(@PathVariable("settlement_no") int settlementNo) {
//	        SettlementDTO settlement = settlementService.getSettlementById(settlementNo);
//	        BigDecimal fee = settlement.getPrice().multiply(new BigDecimal("0.1"));
//	        BigDecimal settledCost = settlement.getPrice().subtract(fee);
//	        settlement.setFee(fee);
//	        settlement.setSettled_cost(settledCost);
//	        return settlement;
//	    }
//
//	    @PostMapping("/settlements/{settlement_no}/update")
//	    @ResponseBody
//	    public ResponseEntity<String> updateSettlement(@PathVariable("settlement_no") int settlementNo,
//	                                                   @RequestBody SettlementDTO updatedSettlement) {
//	        try {
//	            SettlementDTO settlement = settlementService.getSettlementById(settlementNo);
//	            settlement.setFee(updatedSettlement.getFee());
//	            settlement.setSettled_cost(updatedSettlement.getSettled_cost());
//	            settlement.setSettlement_check(true);
//	            settlementService.updateSettlement(settlement);
//	            return ResponseEntity.ok("정산 정보가 성공적으로 업데이트되었습니다.");
//	        } catch (Exception e) {
//	            logger.error("Error updating settlement: ", e);
//	            return ResponseEntity.status(500).body("서버 업데이트에 실패하였습니다. 에러 내용: " + e.getMessage());
//	        }
//	    }
	 /* 클라이언트 결제처리 */

	    
	    
	    
	    
	 // 파일 업로드 경로 설정
	 @Value("${file.upload-dir}")
	    private String UPLOAD_DIR;
	    
//	    private static final String UPLOAD_DIR = System.getenv("FILE_UPLOAD_DIR");
	 @Autowired
	    private ServletContext servletContext;
	 
	 // 계약서 리스트 출력
	 @GetMapping("/contracts")
	    public String getContracts(Model model) {
	        List<ContractDTO> contracts = cService.getAllContracts();
	        model.addAttribute("contracts", contracts);
	        return "admin/contractList";
	    }
	 // 계약서 업로드 메서드
	 @PostMapping("/contracts/upload")
	    public String uploadContract(@RequestParam("proj_no") int projNo,
	                                 @RequestParam("contract_title") String contractTitle,
	                                 @RequestParam("file") MultipartFile file) {
	        if (!file.isEmpty()) {
	            try {
	                logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + UPLOAD_DIR);

	                File uploadDirFile = new File(UPLOAD_DIR);
	                if (!uploadDirFile.exists()) {
	                    uploadDirFile.mkdirs(); // 경로가 존재하지 않으면 생성
	                }

	                // 파일을 저장할 경로를 지정
	                String filePath = UPLOAD_DIR + File.separator + file.getOriginalFilename();
	                File dest = new File(filePath);
	                file.transferTo(dest);

	                // ContractDTO 객체를 생성하고 필요한 정보를 설정
	                ContractDTO contract = new ContractDTO();
	                contract.setProj_no(projNo);
	                contract.setContract_title(contractTitle);
	                contract.setContract_path(filePath);
	                contract.setUpload_date(new Date(System.currentTimeMillis()));

	                // 서비스 호출
	                cService.saveContract(contract);
	            } catch (IOException e) {
	                e.printStackTrace();
	                return "admin/uploadError"; // 예외 발생 시 uploadError.jsp로 이동
	            }
	        } else {
	            return "admin/uploadError"; // 파일이 비어있을 경우 uploadError.jsp로 이동
	        }
	        return "redirect:/admin/contracts";
	    }
	 
	 
	 // 계약서를 다운로드 하는 메서드
	 @GetMapping("/contract/download")
	 public void downloadFile(@RequestParam("contract_no") int contractNo, HttpServletResponse response) {
	     ContractDTO contract = cService.getContractById(contractNo);
	     if (contract == null) {
	         throw new IllegalArgumentException("Invalid contract ID: " + contractNo);
	     }

	     File file = new File(contract.getContract_path());
	     if (!file.exists()) {
	         throw new IllegalArgumentException("File not found: " + contract.getContract_path());
	     }

	     response.setContentType("application/pdf");
	     response.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

	     try (InputStream is = new FileInputStream(file)) {
	         org.apache.commons.io.IOUtils.copy(is, response.getOutputStream());
	         response.flushBuffer();
	     } catch (IOException e) {
	         e.printStackTrace();
	     }
	 }
}
	 

