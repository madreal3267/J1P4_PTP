package com.itwillbs.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.persistence.MyProManageDAO;
import com.itwillbs.service.MyProManageService;

@Controller
@RequestMapping(value = "/myProManage/*")
public class MyProManageController {

	private static final Logger logger = LoggerFactory.getLogger(MyProManageController.class);
	
	@Inject
	private MyProManageService myService;
	
	// http://localhost:8088/myProManage/dbtime
	@RequestMapping(value = "/dbtime", method = RequestMethod.GET)
	public void showDBTime(Model model) {
		logger.debug("서버시간 : " + myService.getDBTime());
		
		String serverTime = myService.getDBTime();
		
		model.addAttribute("serverTime", serverTime);
	}
}
