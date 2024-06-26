package com.itwillbs.web;

import java.io.File;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.ProjectVO;
import com.itwillbs.dto.AnnouncementDTO;
import com.itwillbs.dto.ContractDTO;
import com.itwillbs.dto.ManagerDTO;
import com.itwillbs.dto.ProjectDTO;
import com.itwillbs.dto.SettlementDTO;
import com.itwillbs.dto.UserDTO;
import com.itwillbs.service.AnnouncementService;
import com.itwillbs.service.ContractService;
import com.itwillbs.service.ManagerService;
import com.itwillbs.service.ProjectService;
import com.itwillbs.service.SettlementService;
import com.itwillbs.service.UserService;
import com.itwillbs.util.DuplicateProjNoException;
import com.itwillbs.util.Pagination;
import com.itwillbs.util.PaginationService;

@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {
	

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private UserService userService;
	
	@Inject
	private ProjectService projectService;
	
	@Inject
	private SettlementService settlementService;
	
	@Autowired
	private ContractService contractService;
	
	@Inject
    private ManagerService managerService;
	
	@Autowired
    private PaginationService paginationService;
	
	@Inject
    private AnnouncementService announcementService;
	
	// 관리자 로그인 페이지
	@GetMapping("/login")
    public String login() {
        return "admin/login";
    }
	
	// 로그인 시 manager 테이블의 approved 컬럼 값을 체크해서 조건 처리
    @PostMapping("/login")
    public String login(@RequestParam("manager_id") String managerId, 
                        @RequestParam("manager_pw") String managerPw, 
                        HttpSession session, Model model) {
    	// 로그인하는 매니저 정보 가져오기
        ManagerDTO manager = managerService.getManagerById(managerId);
        if (manager != null && manager.getManager_pw().equals(managerPw)) {
            if (manager.isApproved()) {
                session.setAttribute("manager", manager);
                return "redirect:/admin/main";
            } else {
                model.addAttribute("error", "승인 처리 진행중입니다.");
                return "admin/login";
            }
        } else {
            model.addAttribute("error", "ID 또는 비밀번호가 일치하지 않습니다.");
            return "admin/login";
        }
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	// 세션 초기화
        session.invalidate();
        return "redirect:/admin/login";
    }

    
 // 관리자 메인페이지 이동
    // http://localhost:8088/admin/main
    @GetMapping("/main")
    public String mainGET(Model model) {
        // 각 데이터들 count
        int userCount = userService.getUserCount();
        int projectCount = projectService.getProjectCount();
        int managerCount = managerService.getManagerCount();
        int unapprovedManagerCount = managerService.getUnapprovedManagerCount();
        int freelancerCount = userService.getFreelancerCount();
        int clientCount = userService.getClientCount();
        
        // 프로젝트의 상태별 카운트(수)를 가져옴
        List<Map<String, Object>> projectStatusCounts = projectService.getProjectStatusCounts();
        
        // ObjectMapper를 사용하여 projectStatusCounts List를 JSON 문자열으로 변환
        ObjectMapper mapper = new ObjectMapper();
        String projectStatusCountsJson = "";
        try {
            projectStatusCountsJson = mapper.writeValueAsString(projectStatusCounts);
        } catch (Exception e) {
            logger.error("projectStatusCounts을 JSON으로 변환하는데 실패하였습니다.", e);
        }
        
        // main.jsp의 템플릿에 사용할 데이터들을 model에 담음
        model.addAttribute("userCount", userCount);
        model.addAttribute("projectCount", projectCount);
        model.addAttribute("managerCount", managerCount);
        model.addAttribute("unapprovedManagerCount", unapprovedManagerCount);
        model.addAttribute("freelancerCount", freelancerCount);
        model.addAttribute("clientCount", clientCount);
        model.addAttribute("projectStatusCounts", projectStatusCountsJson);

        // 최근 날짜순 5개의 공지사항을 가져와 model에 담음
        List<AnnouncementDTO> latestNotices = announcementService.getLatestNotices(5);
        model.addAttribute("latestNotices", latestNotices);

        return "admin/main";
    }
    
    
    
    
 // 특정 공지사항을 ID로 조회하여 반환하는 메서드
    @GetMapping("/announcement")
    @ResponseBody
    public AnnouncementDTO getAnnouncement(@RequestParam("id") int id) {
        // ID를 사용하여 공지사항을 조회하고 반환
        return announcementService.getAnnouncementById(id);
    }

    // 새로운 공지사항을 작성하는 페이지로 이동하는 메서드
    @GetMapping("/announcement/new")
    public String newAnnouncement(Model model, HttpSession session) {
        // 현재 세션에서 로그인된 매니저 정보를 가져옴
        ManagerDTO loggedInManager = (ManagerDTO) session.getAttribute("manager");
        
        // 'admin' 매니저일 경우 공지사항 작성 페이지로 이동
        return "admin/newAnnouncement";
    }

    // 새로운 공지사항을 생성하는 메서드
    @PostMapping("/announcement/create")
    public String createAnnouncement(AnnouncementDTO announcement, HttpSession session) {
        // 현재 세션에서 로그인된 매니저 정보를 가져옴
        ManagerDTO loggedInManager = (ManagerDTO) session.getAttribute("manager");
        

        // 공지사항에 매니저 ID를 설정하고 공지사항을 생성
        announcement.setManager_id(loggedInManager.getManager_id());
        announcementService.createAnnouncement(announcement);

        // 공지사항 생성 후 메인 페이지로 리다이렉트
        return "redirect:/admin/main";
    }

    // 공지사항 리스트를 페이징 처리하여 조회하는 메서드
    @GetMapping("/notices")
    public String getNotices(Model model, 
                             @RequestParam(name = "page", required = false, defaultValue = "1") int page,
                             @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize) {
        // 모든 공지사항을 조회
        List<AnnouncementDTO> allNotices = announcementService.getAllAnnouncements();
        int totalRecords = allNotices.size();
        
        // 페이징 정보를 계산
        Pagination pagination = paginationService.getPagination(totalRecords, page, pageSize);

        // 페이징 처리된 공지사항 리스트를 조회
        List<AnnouncementDTO> pagedNotices = paginationService.getPagedData(allNotices, pagination);

        // 모델에 공지사항과 페이징 정보를 추가
        model.addAttribute("notices", pagedNotices);
        model.addAttribute("pagination", pagination);
        model.addAttribute("pageSize", pageSize);
        
        // 공지사항 리스트 페이지로 이동
        return "admin/noticeList";
    }

    // 매니저 리스트를 페이징 처리하여 조회하는 메서드
    @GetMapping("/managers")
    public String getManagers(Model model, HttpSession session,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        
        // 매니저가 로그인되어 있고, 매니저 ID가 'admin'인 경우(AuthInterceptor 설정)
    	
            // 모든 매니저를 조회
            List<ManagerDTO> managers = managerService.getAllManagers();
            int totalRecords = managers.size();
            
            // 페이징 정보를 계산
            Pagination pagination = paginationService.getPagination(totalRecords, page, pageSize);
            
            // 페이징 처리된 매니저 리스트를 조회
            List<ManagerDTO> pagedManagers = paginationService.getPagedData(managers, pagination);
            
            // 모델에 매니저와 페이징 정보를 추가
            model.addAttribute("managers", pagedManagers);
            model.addAttribute("pagination", pagination);
            model.addAttribute("pageSize", pageSize);
            
            // 매니저 리스트 페이지로 이동
            return "admin/managerList";
            
            // 매니저가 'admin'이 아닌 경우 메인 페이지로 이동(AuthInterceptor 설정)
    }

    // 매니저를 승인하는 메서드
    @PostMapping("/managers/approve")
    public String approveManager(@RequestParam("manager_no") int managerNo, HttpSession session) {
        
            managerService.approveManager(managerNo);
            return "redirect:/admin/managers";
        }
    
    // 매니저를 삭제하는 메서드("admin" 계정으로만 가능)
    @PostMapping("/managers/delete")
    public String deleteManager(@RequestParam("manager_no") int managerNo, HttpSession session) {
        ManagerDTO loggedInManager = (ManagerDTO) session.getAttribute("manager");
        if (loggedInManager != null && "admin".equals(loggedInManager.getManager_id())) {
            managerService.deleteManager(managerNo);
            return "redirect:/admin/managers";
        } else {
            return "redirect:/admin/login";
        }
    }
    
    

    // 회원가입 폼 페이지로 이동하는 메서드
    @GetMapping("/join")
    public String joinForm() {
        return "admin/join";
    }

    // 회원가입을 처리하는 메서드
    @PostMapping("/join")
    public String join(@RequestParam("manager_nm") String managerNm,
                       @RequestParam("manager_call") String managerCall,
                       @RequestParam("manager_email") String managerEmail,
                       @RequestParam("manager_id") String managerId,
                       @RequestParam("manager_pw") String managerPw,
                       Model model) {
        // 새로운 매니저 DTO 객체를 생성하고 값 설정
        ManagerDTO manager = new ManagerDTO();
        manager.setManager_nm(managerNm);
        manager.setManager_call(managerCall);
        manager.setManager_email(managerEmail);
        manager.setManager_id(managerId);
        manager.setManager_pw(managerPw);
        manager.setApproved(false); // 승인되지 않은 상태로 설정

        try {
            // 매니저를 데이터베이스에 삽입
            managerService.insertManager(manager);
            model.addAttribute("message", "회원가입이 완료되었습니다. 관리자의 승인을 기다려주세요.");
            return "admin/login";
        } catch (Exception e) {
            // 회원가입 중 에러가 발생할 경우 에러 메시지를 모델에 추가하고 회원가입 페이지로 이동
            model.addAttribute("error", "회원가입 중 오류가 발생하였습니다: " + e.getMessage());
            return "admin/join";
        }
    }

    // 회원 정보를 페이징 처리하여 조회하는 메서드
    @GetMapping("/users")
    public String getUsers(@RequestParam(name = "type", required = false, defaultValue = "all") String type,
                           @RequestParam(name = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
                           Model model) {
        List<UserDTO> users;
        // type 별로 목록을 가져와 List에 담음
        if ("freelancers".equals(type)) {
            users = userService.getFreelancers();
        } else if ("clients".equals(type)) {
            users = userService.getClients();
        } else {
            users = userService.getAllUsers();
        }
        
        // 해당 리스트 크기
        int totalRecords = users.size();
        // 페이징 정보 계산
        Pagination pagination = paginationService.getPagination(totalRecords, page, pageSize);
        // 페이징 처리된 데이터 조회
        List<UserDTO> pagedUsers = paginationService.getPagedData(users, pagination);

        model.addAttribute("users", pagedUsers);
        model.addAttribute("type", type);
        model.addAttribute("pagination", pagination);

        return "admin/userList";
    }

    // 프로젝트 리스트를 페이징 처리하여 조회하는 메서드
    @GetMapping("/projects")
    public String getProjects(@RequestParam(name = "proj_status", required = false, defaultValue = "all") String projStatus,
                              @RequestParam(name = "page", required = false, defaultValue = "1") int page,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize,
                              Model model) {
        List<ProjectDTO> projects;
        if (!"all".equals(projStatus)) {
            projects = projectService.getProjectsByStatus(projStatus);
        } else {
            projects = projectService.getAllProjects();
        }
        
        int totalRecords = projects.size();
        Pagination pagination = paginationService.getPagination(totalRecords, page, pageSize);
        List<ProjectDTO> pagedProjects = paginationService.getPagedData(projects, pagination);

        model.addAttribute("projects", pagedProjects);
        model.addAttribute("projStatus", projStatus);
        model.addAttribute("pagination", pagination);

        return "admin/projectList";
    }

    // 프로젝트를 승인하는 메서드
    @PostMapping("/project/approve")
    public String approveProject(@RequestParam("proj_no") int proj_no) {
        ProjectVO pvo = new ProjectVO();
        pvo.setProj_no(proj_no);
        pvo.setProj_status("모집중");
        projectService.updateProjectStatus(pvo);
        logger.debug("승인 proj_no : " + proj_no);
        return "redirect:/admin/projects";
    }

    // 프로젝트를 반려하는 메서드
    @PostMapping("/project/reject")
    public String rejectProject(@RequestParam("proj_no") int proj_no, @RequestParam("reject_reason") String reject_reason) {
        ProjectVO pvo = new ProjectVO();
        pvo.setProj_no(proj_no);
        pvo.setReject_reason(reject_reason);
        projectService.rejectProject(pvo);
        return "redirect:/admin/projects";
    }

    // 프로젝트 반려 사유를 가져오는 메서드
    @GetMapping("/project/rejectReason")
    @ResponseBody
    public Map<String,String> getRejectReason(@RequestParam("proj_no") int proj_no) {
        ProjectVO pvo = projectService.getProjectById(proj_no);
        Map<String,String> response = new HashMap<>();
        response.put("reject_reason", pvo.getReject_reason());
        return response;
    }

 // 정산 리스트를 페이징 처리하여 조회하는 메서드
    @GetMapping("/settlements")
    public String getSettlements(Model model,
                                 @RequestParam(value = "price_check", required = false) Boolean priceCheck,
                                 @RequestParam(value = "settlement_check", required = false) Boolean settlementCheck,
                                 @RequestParam(name = "page", required = false, defaultValue = "1") int page,
                                 @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize) {
        List<SettlementDTO> settlements;

        if (priceCheck != null) {
            settlements = settlementService.getSettlementsByPriceCheck(priceCheck);
        } else if (settlementCheck != null) {
            settlements = settlementService.getSettlementsBySettlementCheck(settlementCheck);
        } else {
            settlements = settlementService.getAllSettlements();
        }

        int totalRecords = settlements.size();
        Pagination pagination = paginationService.getPagination(totalRecords, page, pageSize);
        List<SettlementDTO> pagedSettlements = paginationService.getPagedData(settlements, pagination);

        model.addAttribute("settlements", pagedSettlements);
        model.addAttribute("pagination", pagination);
        model.addAttribute("priceCheck", priceCheck);
        model.addAttribute("settlementCheck", settlementCheck);

        return "admin/settlementList";
    }

    // 정산 금액과 수수료를 계산하는 메서드
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

    // 정산 정보를 업데이트하는 메서드
    @PostMapping("/settlements/{settlement_no}/update")
    @ResponseBody
    public String updateSettlement(@PathVariable("settlement_no") int settlementNo,
                                   @RequestBody SettlementDTO updatedSettlement) {
        try {
            SettlementDTO settlement = settlementService.getSettlementById(settlementNo);
            settlement.setFee(updatedSettlement.getFee());
            settlement.setSettled_cost(updatedSettlement.getSettled_cost());
            settlement.setSettlement_check(true);
            settlementService.updateSettlement(settlement);

            // 프로젝트 상태를 "완료"로 변경
            ProjectVO pvo = projectService.getProjectById(settlement.getProj_no());
            if (pvo != null) {
                pvo.setProj_status("완료");
                projectService.updateProjectStatus(pvo);
            }

            return "정산 정보가 성공적으로 업데이트되었습니다.";
        } catch (Exception e) {
            logger.error("Error updating settlement: ", e);
            return "서버 업데이트에 실패하였습니다. 에러 내용: " + e.getMessage();
        }
    }




	 
	 

	    
	 // 파일 업로드 경로 설정
	 @Value("${file.upload-dir}")
	    private String UPLOAD_DIR;
	    
//	    private static final String UPLOAD_DIR = System.getenv("FILE_UPLOAD_DIR");
	 
	 // 계약서 리스트 출력
	 @GetMapping("/contracts")
	 public String getContracts(Model model,
	                            @RequestParam(name = "page", required = false, defaultValue = "1") int page,
	                            @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize) {
	     List<ContractDTO> contracts = contractService.getAllContracts();
	     int totalRecords = contracts.size();
	     Pagination pagination = paginationService.getPagination(totalRecords, page, pageSize);

	     List<ContractDTO> pagedContracts = paginationService.getPagedData(contracts, pagination);

	     model.addAttribute("contracts", pagedContracts);
	     model.addAttribute("pagination", pagination);
	     model.addAttribute("pageSize", pageSize);

	     return "admin/contractList";
	 }
	 //
	 
	 
	 
	 
	 
	 
	 
	 // 계약서 업로드 메서드
	 @PostMapping("/contracts/upload")
	 @ResponseBody
	 public ResponseEntity<String> uploadContract(@RequestParam("proj_no") int projNo,
	                                              @RequestParam("contract_title") String contractTitle,
	                                              @RequestParam("file") MultipartFile file) {
	     if (!file.isEmpty()) {
	         try {
	             logger.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" + UPLOAD_DIR);

	             File uploadDirFile = new File(UPLOAD_DIR);
	             if (!uploadDirFile.exists()) {
	                 uploadDirFile.mkdirs(); // 경로가 존재하지 않으면 생성
	             }

	             String filePath = UPLOAD_DIR + File.separator + file.getOriginalFilename();
	             File dest = new File(filePath);
	             file.transferTo(dest);

	             ContractDTO contract = new ContractDTO();
	             contract.setProj_no(projNo);
	             contract.setContract_title(contractTitle);
	             contract.setContract_path(filePath);
	             contract.setUpload_date(new Date(System.currentTimeMillis()));

	             contractService.saveContract(contract);

	             ProjectVO pvo = projectService.getProjectById(projNo);
	             if (pvo != null) {
	                 pvo.setProj_status("진행 중");
	                 projectService.updateProjectStatus(pvo);
	             }

	             return ResponseEntity.ok("Contract uploaded successfully.");

	         } catch (DuplicateProjNoException e) {
	             return ResponseEntity.status(HttpStatus.CONFLICT).body("Duplicate project number.");
	         } catch (IOException e) {
	             e.printStackTrace();
	             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Upload failed.");
	         }
	     } else {
	         return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("File is empty.");
	     }
	 }




	 
	 
	 
	 
	 @GetMapping("/contract/download")
	    public void downloadFile(@RequestParam("contract_no") int contractNo, HttpServletResponse response) {
	        ContractDTO contract = contractService.getContractById(contractNo);
	        if (contract == null) {
	            throw new IllegalArgumentException("유효하지 않은 계약번호 : " + contractNo);
	        }

	        File file = new File(contract.getContract_path());
	        if (!file.exists()) {
	            throw new IllegalArgumentException("파일을 찾지 못했습니다. : " + contract.getContract_path());
	        }

	        // MIME 타입을 설정하여 브라우저가 파일 형식을 인식
	        // URLConnection.guessContentTypeFromName를 사용하여 파일의 MIME 타입을 추정
	        // MIME 타입이 null이면 기본값으로 application/octet-stream을 사용
	        // response.setContentType를 사용하여 응답의 콘텐츠 타입을 설정
	        String mimeType = URLConnection.guessContentTypeFromName(file.getName());
	        if (mimeType == null) {
	            mimeType = "application/octet-stream"; // 기본 바이너리 파일로 설정
	        }

	        response.setContentType(mimeType);

	        try {
	            // 파일 이름을 URL 인코딩하여 Content-Disposition 헤더에 설정
	            String encodedFileName = URLEncoder.encode(file.getName(), StandardCharsets.UTF_8.toString());

	            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
	            
	            
	            // FileInputStream을 사용하여 파일을 읽음
	            // IOUtils.copy를 사용하여 입력 스트림의 데이터를 응답 출력 스트림으로 복사
	            // response.flushBuffer를 호출하여 버퍼에 남아있는 데이터를 클라이언트로 전송
	            // 입출력 예외가 발생하면 스택 트레이스를 출력
	            try (InputStream is = new FileInputStream(file)) {
	                IOUtils.copy(is, response.getOutputStream());
	                response.flushBuffer();
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	 
	 
	 
}



	 

