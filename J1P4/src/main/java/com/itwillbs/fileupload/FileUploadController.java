package com.itwillbs.fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping(value = "/myProfile/*")
public class FileUploadController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
	private static final String FAKE_PATH="/upload";
	
	
	// 파일 업로드 처리
	
	@PostMapping(value="/upload")
	@ResponseBody
	public Map<String, Object> fileUploadPOST(MultipartHttpServletRequest multiRequest,Model model) throws Exception{
		logger.debug(" fileUploadPOST() 호출");
		
		// 파일업로드 처리 -> 전달한 정보를 저장
		
		// 한글처리 인코딩
		multiRequest.setCharacterEncoding("UTF-8");
		
		// 파라메터 정보 저장 -> Map<K,V>
		Map paramMap = new HashMap(); 
		
		
		// input-file의 정보를 제외한 모든 정보 가져오기
		Enumeration enu = multiRequest.getParameterNames();
		while(enu.hasMoreElements()) {
			String name = (String)enu.nextElement();
			logger.debug("name : "+name);
			String value = multiRequest.getParameter(name);
			logger.debug("name : "+name);
			paramMap.put(name, value);
			
			
		}
		logger.debug(" paramMap : {}",paramMap);
		// 파일의 정보를 제외한 모든 파라메터 정보를 저장 완료
		/////////////////////////////////////////////////////////////////////
		// 파일 업로드
		
		List<String> fileNameList = fileProcess(multiRequest);
		
		paramMap.put("fileNameList", fileNameList);
		
		logger.debug("paramMap : {}",paramMap);
		
		model.addAttribute("paramMap", paramMap);
		
		
		return paramMap;
	}
	
	
	public List<String> fileProcess(MultipartHttpServletRequest multiRequest) throws Exception{
		logger.debug(" fileProcess() : 파일 업로드 처리 시작");
			
		// 업로드된 파일정보를 저장하는 List
		List<String> fileNameList = new ArrayList<String>();

		// 전달된 파일의 정보를 저장(input-file태그의 이름)
		Iterator<String> fileNames = multiRequest.getFileNames();
		while(fileNames.hasNext()) {
			String fileName = fileNames.next();
			logger.debug("fileName : "+fileName);
			// 파일 파라메터이름을 사용해서 파일을 임시저장
			MultipartFile mFile = multiRequest.getFile(fileName);
			
			// 파일의 원본이름을 리스트에 저장
			String oFileName =  mFile.getOriginalFilename();
			fileNameList.add(oFileName);
			
			// 파일 업로드
			// 파일 생성

			File file = new File(multiRequest.getRealPath(FAKE_PATH)+"\\"+oFileName);

			
			if(mFile.getSize() != 0) { // 첨부파일이 있을떄
				if(!file.exists()) {
					// -> file 해당경로에 파일이 없으면 디렉토리 생성후 파일진행
					
				}
					if(file.getParentFile().mkdirs()) {
						// -> file 해당경로에 파일이 없으면 디렉토리 생성후 파일 진행
						// 파일을 생성
						file.createNewFile();
					}
			}
			// 임시생성 파일을 실제 파일의 정보로 전달
			mFile.transferTo(file);
			
		} // while 종료
			
		logger.debug(" fileNameList : "+fileNameList);
		logger.debug(" 파일 업로드 완료!, 파일이름 저장 완료!");
		// 파일 이름 저장 완료!
		
		
			
		return fileNameList;
	}
	
	
	// 파일 다운로드
	@RequestMapping(value="/download",method=RequestMethod.GET)
	public void downloadGET(@RequestParam("fileName") String fileName
				,HttpServletResponse resp
				,HttpServletRequest req) throws Exception{
		logger.debug(" downloadGET() 실행 ");	
		
		// 외부 (브라우저)로 통신가능한 통로
		OutputStream out = resp.getOutputStream();
		
		// 다운로드할 파일의 정보(위치)
		String downFile = req.getRealPath(FAKE_PATH)+"\\"+fileName;
		
		// 다운로드할 파일 생성
		File file = new File(downFile);
		
		// 다운로드에 필요한 설정
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment; fileName="+URLEncoder.encode(fileName,"UTF-8"));
		
		FileInputStream fis = new FileInputStream(file);
		
		byte[] buffer = new byte[1024 * 8];
		
		while(true) {
			int data = fis.read(buffer);
			if(data == -1) break; // 파일의 끝
			
			
			out.write(buffer,0,data);
		}
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}